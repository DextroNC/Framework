/*
	Parameters:
		<-- None

	Return:
	--> None

	Description:
		Casualty log for the debrief: friendly fire (SR_FF) and those killed in action (SR_KIA,
		plus the "KIA" combat log entry). Auto exec on start.
		The server is the only writer of SR_FF and SR_KIA. Each player's own machine works out
		who knocked them down or killed them and sends the entry to the server.

	Example:
		None, runs as postInit.
*/
// Server side
// The server is the only writer of SR_FF and SR_KIA. Clients send it entries, so incidents on
// several machines at once cannot overwrite each other's line.
if (isServer) then {
	["SR_FF_Entry", {
		params ["_shooterName", "_victimName", "_self", "_killed"];
		private _text = switch (true) do {
			case (_self && _killed): {"%1 fatally hurt themselves"};
			case _self: {"%1 hurt themselves"};
			case _killed: {"%1 killed %2"};
			default {"%1 shot at %2"};
		};
		diag_log ("[Friendly Fire] - " + format [_text, _shooterName, _victimName]);

		// The debrief parses SR_FF as structured text, so names must not carry markup.
		SR_FF = SR_FF + "<br/>" + format [_text, _shooterName call fw_fnc_escapeText, _victimName call fw_fnc_escapeText] + ".";
		publicVariable "SR_FF";
	}] call CBA_fnc_addEventHandler;

	["SR_KIA_Entry", {
		params ["_nameDead", "_nameGroup", "_nameKiller"];
		// The combat log and the debrief both parse these as structured text.
		_nameDead = _nameDead call fw_fnc_escapeText;
		_nameGroup = _nameGroup call fw_fnc_escapeText;
		_nameKiller = _nameKiller call fw_fnc_escapeText;
		["CombatLog", ["KIA", "<br/>" + _nameDead + " [" + _nameGroup + "] has been killed in action by " + _nameKiller + "."]] call CBA_fnc_globalEvent;
		SR_KIA = SR_KIA + "<br/>" + _nameDead + " [" + _nameGroup + "]";
		publicVariable "SR_KIA";
	}] call CBA_fnc_addEventHandler;
};

// Client Only Part
if (!hasInterface) exitWith {};

// Wound tracking
// ACE keeps its damage source variables only on the machine where the unit is local, so all of
// this runs on the player's own machine and exits everywhere else. ACE raises ace_unconscious
// and ace_medical_death from inside its own ace_medical_woundReceived handler, and ours for the
// same wound runs right after it. So a knock-down or death is first marked pending, then the
// wound that follows in the same frame is recorded as its cause, and the incident is judged on
// the next frame.
//   A hit is [time, frame, attacker, attacker is a player, attacker name, used, bleeding added].
//   The name is taken when the hit lands, so it survives the attacker's body being deleted.
//   "used" is set once the hit has explained an incident.
//   SR_LastHit:      the latest hit.
//   SR_DownBy:       the hit behind the current knock-down, or [] if none is known.
//   SR_FF_AnchorHit: the latest hit whose attacker ACE named, for frag fragments.
//   SR_FF_BleedHit:  the hit that added the most bleeding since the last bandage, tourniquet or
//                    full heal, for knock-downs from blood loss.
//   SR_FF_BleedSeen: ace_medical_woundBleeding as last seen, to tell what a wound added.
//   SR_FF_Pending:   [frame, killed, victim name, the hit that caused it or [], bleeding].
//   SR_FF_NoBlame:   frame of a knock-down that medication or a script caused.
["ace_medical_woundReceived", {
	params ["_unit", "", "_shooter", "_type"];
	// No isPlayer check: a fatal wound has already killed the unit by the time this runs.
	// SR_FF_Incident filters on players while they are still alive.
	if (!local _unit) exitWith {};

	// ACE passes the victim, or nobody, for crashes, drowning, fire, falls and collisions. For a
	// vehicle, static weapon or mortar it passes the vehicle, and objNull for an ACE-placed
	// explosive, but it writes the person behind it to lastInstigator just before raising this
	// event. ace_medical_fnc_addDamageToUnit also passes objNull when it has no instigator, and
	// then leaves lastInstigator stale, so objNull only counts for engine damage: ACE's
	// "vehiclehit", or an ammo class that is not also one of ACE's damage type names ("grenade").
	private _attacker = objNull;
	switch (true) do {
		case (_type in ["drowning", "vehiclecrash", "burn", "falling", "collision"] && {isNull _shooter || {_shooter isEqualTo _unit}}): {};
		case (_shooter isKindOf "CAManBase"): {_attacker = _shooter};
		case (
			(_unit getVariable ["ace_medical_lastDamageSource", objNull]) isEqualTo _shooter
			&& {
				!isNull _shooter
				|| {_type == "vehiclehit"}
				|| {isClass (configFile >> "CfgAmmo" >> _type) && {!isClass (configFile >> "ACE_Medical_Injuries" >> "damageTypes" >> _type)}}
			}
		): {
			_attacker = _unit getVariable ["ace_medical_lastInstigator", objNull];
		};
	};

	// ACE frag fragments carry no shooter at all. Within a second of a hit whose attacker ACE
	// named, normally the blast of the same round, they belong to that attacker. A fragment that
	// inherits an attacker does not extend that second.
	private _direct = !isNull _attacker;
	private _anchor = _unit getVariable ["SR_FF_AnchorHit", []];
	if (
		!_direct && {(_type select [0, 9]) == "ace_frag_"}
		&& {_anchor isNotEqualTo []} && {CBA_missionTime - (_anchor select 0) <= 1}
	) then {
		_attacker = _anchor select 2;
	};

	// The array syntax of isPlayer also holds for an attacker who has died since.
	private _isPlayer = isPlayer [_attacker];

	// Bleeding this wound added. ACE's handler, which ran first, has updated woundBleeding, and
	// the treatment handlers below resync the baseline. A tourniquet removed by someone else or a
	// reopening wound raises bleeding unseen, which this then credits to the next wound.
	private _bleeding = _unit getVariable ["ace_medical_woundBleeding", 0];
	private _bleedAdded = 0 max (_bleeding - (_unit getVariable ["SR_FF_BleedSeen", 0]));
	_unit setVariable ["SR_FF_BleedSeen", _bleeding];

	// A wound taken while already down, from whoever knocked the unit down, belongs to that
	// knock-down and must not explain a later one again. ACE's handler has run first, so the
	// unit is already down for the wound that knocked it down; that one reaches SR_FF_Pending
	// below, which does not look at "used".
	private _used = (_unit getVariable ["ACE_isUnconscious", false]) && {_attacker isEqualTo ((_unit getVariable ["SR_DownBy", []]) param [2, objNull])};
	private _hit = [CBA_missionTime, diag_frameNo, _attacker, _isPlayer, ["", name _attacker] select (!isNull _attacker), _used, _bleedAdded];
	_unit setVariable ["SR_LastHit", _hit];
	if (_direct) then {_unit setVariable ["SR_FF_AnchorHit", _hit]};

	private _bleedHit = _unit getVariable ["SR_FF_BleedHit", []];
	if (_bleedAdded > 0 && {
		_bleedHit isEqualTo [] || {_bleedHit select 5} || {CBA_missionTime - (_bleedHit select 0) > 300} || {_bleedAdded >= (_bleedHit select 6)}
	}) then {
		_unit setVariable ["SR_FF_BleedHit", _hit];
	};

	private _pending = _unit getVariable ["SR_FF_Pending", []];
	if (_pending isNotEqualTo [] && {(_pending select 0) == diag_frameNo} && {(_pending select 3) isEqualTo []}) then {
		_pending set [3, _hit];
		_unit setVariable ["SR_DownBy", _hit];
	};
}] call CBA_fnc_addEventHandler;

// Friendly Fire Log
// Judges a pending incident once every wound of its frame has been recorded.
["SR_FF_Judge", {
	params ["_unit", "_frame"];
	private _pending = _unit getVariable ["SR_FF_Pending", []];
	if (_pending isEqualTo [] || {(_pending select 0) != _frame}) exitWith {};
	_unit setVariable ["SR_FF_Pending", nil];
	_pending params ["", "_killed", "_victimName", "_hit", "_bleeding"];

	// No wound came after it. A wound earlier in the same frame still caused it. Otherwise it is
	// a knock-down from blood loss, pain or medication, a scripted knock-down (G-force, Zeus,
	// field rations), or a death at the end of a knock-down. Only a bleeding victim's knock-down
	// with no medication or script behind it is blamed, on the recent wound that added the most
	// bleeding since the last bandage, tourniquet or full heal, and only if that wound has not
	// explained an incident already.
	if (_hit isEqualTo []) then {
		private _last = _unit getVariable ["SR_LastHit", []];
		if (_last isNotEqualTo [] && {(_last select 1) == _frame}) exitWith {_hit = _last};
		if (_killed || {!_bleeding} || {(_unit getVariable ["SR_FF_NoBlame", -1]) == _frame}) exitWith {};
		private _bleedHit = _unit getVariable ["SR_FF_BleedHit", []];
		if (_bleedHit isNotEqualTo [] && {!(_bleedHit select 5)} && {CBA_missionTime - (_bleedHit select 0) <= 300}) then {
			_hit = _bleedHit;
		};
	};
	if (!_killed) then {_unit setVariable ["SR_DownBy", _hit]};
	if (_hit isEqualTo []) exitWith {};
	_hit set [5, true];

	_hit params ["", "", "_attacker", "_isPlayer", "_attackerName"];
	if (!_isPlayer) exitWith {};
	["SR_FF_Entry", [_attackerName, _victimName, _attacker isEqualTo _unit, _killed]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["SR_FF_Incident", {
	params ["_unit", "_killed"];
	if (!local _unit || {!isPlayer _unit}) exitWith {};

	// A death in the same frame as a knock-down is one incident: ace_vehicle_damage wounds the
	// crew and then kills them in one call, with no wound after the death. Keep the cause found.
	private _frame = diag_frameNo;
	private _pending = _unit getVariable ["SR_FF_Pending", []];
	if (_pending isNotEqualTo [] && {(_pending select 0) == _frame}) exitWith {
		if (_killed) then {_pending set [1, true]};
	};
	// An incident from an earlier frame that is not judged yet: judge it before replacing it.
	if (_pending isNotEqualTo []) then {["SR_FF_Judge", [_unit, _pending select 0]] call CBA_fnc_localEvent};

	private _bleeding = (_unit getVariable ["ace_medical_woundBleeding", 0]) > 0;
	_unit setVariable ["SR_FF_Pending", [_frame, _killed, name _unit, [], _bleeding]];
	[{["SR_FF_Judge", _this] call CBA_fnc_localEvent}, [_unit, _frame]] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

// On waking up the knock-down is over, so nothing later is blamed on whoever caused it.
["ace_unconscious", {
	params ["_unit", "_state"];
	if (_state) then {
		["SR_FF_Incident", [_unit, false]] call CBA_fnc_localEvent;
	} else {
		if (local _unit) then {_unit setVariable ["SR_DownBy", nil]};
	};
}] call CBA_fnc_addEventHandler;

// With ACE's default fatal injury setting a fatal wound kills without a knock-down first.
["ace_medical_death", {
	params ["_unit"];
	["SR_FF_Incident", [_unit, true]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

// Knock-downs that no wound caused. ace_medical_fnc_setUnconscious (G-force, Zeus, field
// rations) raises knockOut, and an overdose knocks the patient down inside ACE's
// medicationLocal handler. ACE's handlers run before these, so the frame is marked right after
// the incident and before SR_FF_Judge looks at it.
["ace_medical_knockOut", {
	params ["_unit"];
	if (local _unit) then {_unit setVariable ["SR_FF_NoBlame", diag_frameNo]};
}] call CBA_fnc_addEventHandler;

["ace_medical_treatment_medicationLocal", {
	params ["_unit"];
	if (local _unit) then {_unit setVariable ["SR_FF_NoBlame", diag_frameNo]};
}] call CBA_fnc_addEventHandler;

// Treatment that changes bleeding, run on the patient's machine. Once a medic has worked on the
// bleeding, a later knock-down from blood loss is no longer pinned on a wound from before, and
// the baseline follows ACE's new value. ACE's handlers run first, so woundBleeding is current.
{
	[_x, {
		params ["_unit"];
		if (!local _unit) exitWith {};
		_unit setVariable ["SR_FF_BleedSeen", _unit getVariable ["ace_medical_woundBleeding", 0]];
		_unit setVariable ["SR_FF_BleedHit", nil];
	}] call CBA_fnc_addEventHandler;
} forEach ["ace_medical_treatment_bandageLocal", "ace_medical_treatment_tourniquetLocal", "ace_medical_treatment_fullHealLocal"];

// KIA Log
// ACE raises ace_killed for every death, scripted ones included, on the machine where the unit
// is local. A fatal wound is recorded only after it (ACE kills inside its own woundReceived
// handler, which runs before ours), so the killer is worked out on the next frame:
// - At the end of a knock-down (cardiac arrest timer, bleed-out, or ACE's respawn button while
//   unconscious) no wound comes with the death, so the killer is whoever knocked the player down.
// - Otherwise a wound in the death frame or the one before it killed: a fatal wound, an
//   execution in cardiac arrest, a vehicle destroyed around the player.
// - Anything else (a scripted kill, hunger, being buried alive) has no killer.
// A mission turns this off with SR_KIALog = false in 7R/fn_systemInit.sqf.
["ace_killed", {
	params ["_unit", "_causeOfDeath"];
	if (!local _unit || {!isPlayer [_unit]} || {!(missionNamespace getVariable ["SR_KIALog", true])}) exitWith {};
	[{
		params ["_unit", "_causeOfDeath", "_frame", "_nameDead", "_nameGroup"];
		private _hit = [];
		if (((_causeOfDeath splitString ":") param [1, ""]) in ["Timeout", "Bleedout"] || {_causeOfDeath == "respawn_button"}) then {
			_hit = _unit getVariable ["SR_DownBy", []];
		} else {
			private _last = _unit getVariable ["SR_LastHit", []];
			if (_last isNotEqualTo [] && {(_last select 1) >= _frame - 1}) then {_hit = _last};
		};
		private _nameKiller = _hit param [4, ""];
		if (_nameKiller == "") then {_nameKiller = "unknown"};
		["SR_KIA_Entry", [_nameDead, _nameGroup, _nameKiller]] call CBA_fnc_serverEvent;
	}, [_unit, _causeOfDeath, diag_frameNo, name _unit, groupId (group _unit)]] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

// The respawned unit starts with a clean record, in case these were copied over from the body.
["CAManBase", "Respawn", {
	params ["_unit"];
	if (!local _unit) exitWith {};
	{
		_unit setVariable [_x, nil];
	} forEach ["SR_LastHit", "SR_DownBy", "SR_FF_AnchorHit", "SR_FF_BleedHit", "SR_FF_BleedSeen", "SR_FF_Pending", "SR_FF_NoBlame"];
}] call CBA_fnc_addClassEventHandler;
