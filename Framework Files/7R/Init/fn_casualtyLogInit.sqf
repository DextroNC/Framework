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
// The server is the single writer of SR_FF and SR_KIA: clients send it entries, and it appends
// them one at a time.
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

		// Names are escaped because the debrief parses SR_FF as structured text.
		SR_FF = SR_FF + "<br/>" + format [_text, _shooterName call fw_fnc_escapeText, _victimName call fw_fnc_escapeText] + ".";
		publicVariable "SR_FF";
	}] call CBA_fnc_addEventHandler;

	["SR_KIA_Entry", {
		params ["_nameDead", "_nameGroup", "_nameKiller"];
		// Escaped because the combat log and the debrief parse these as structured text.
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
// ACE keeps its damage source variables on the machine where the unit is local, so this runs on
// the player's own machine. ACE raises ace_unconscious and ace_medical_death from inside its own
// ace_medical_woundReceived handler, and ours for the same wound runs right after it. A
// knock-down or death is marked pending, the wound that follows in the same frame is recorded as
// its cause, and the incident is judged on the next frame.
//   A hit is [time, frame, attacker, attacker is a player, attacker name, used, bleeding added].
//   The name is taken when the hit lands, so it stays available after the body is deleted.
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
	// Records wounds of every local unit. SR_FF_Incident picks out the players while they are
	// still alive, since a fatal wound has killed the unit by the time this runs.
	if (!local _unit) exitWith {};

	// The attacker is the shooter when that is a man. For a vehicle, static weapon, mortar or
	// ACE-placed explosive it is the person ACE writes to lastInstigator just before raising this
	// event, which is current for engine damage: a non-null shooter, ACE's "vehiclehit", or an
	// ammo class that is not also an ACE damage type name ("grenade"). Crashes, drowning, fire,
	// falls and collisions, where ACE names the victim or nobody, get objNull.
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

	// Frag fragments have no shooter. They take the attacker of the latest hit ACE attributed
	// directly, if it landed within the last second: normally the blast of the same round.
	private _direct = !isNull _attacker;
	private _anchor = _unit getVariable ["SR_FF_AnchorHit", []];
	if (
		!_direct && {(_type select [0, 9]) == "ace_frag_"}
		&& {_anchor isNotEqualTo []} && {CBA_missionTime - (_anchor select 0) <= 1}
	) then {
		_attacker = _anchor select 2;
	};

	// The array syntax of isPlayer also works on an attacker who has died since.
	private _isPlayer = isPlayer [_attacker];

	// Bleeding this wound added, against the baseline from the last wound or treatment. ACE's
	// handler ran first, so woundBleeding already includes this wound.
	private _bleeding = _unit getVariable ["ace_medical_woundBleeding", 0];
	private _bleedAdded = 0 max (_bleeding - (_unit getVariable ["SR_FF_BleedSeen", 0]));
	_unit setVariable ["SR_FF_BleedSeen", _bleeding];

	// A wound taken while down from the attacker who knocked the unit down belongs to that
	// knock-down and starts out used. The knock-down's own wound reaches SR_FF_Pending below,
	// which takes it whatever its "used" flag.
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

	// With no wound right after the incident, the cause is a wound earlier in the same frame.
	// Failing that, a knock-down from blood loss (the victim is bleeding and the frame is not
	// marked SR_FF_NoBlame) is blamed on the unused hit that added the most bleeding since the
	// last bandage, tourniquet or full heal, within 300 seconds.
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

	// A death in the same frame as a knock-down joins that incident and keeps its cause:
	// ace_vehicle_damage wounds the crew and then kills them in one call.
	private _frame = diag_frameNo;
	private _pending = _unit getVariable ["SR_FF_Pending", []];
	if (_pending isNotEqualTo [] && {(_pending select 0) == _frame}) exitWith {
		if (_killed) then {_pending set [1, true]};
	};
	// An unjudged incident from an earlier frame is judged before it is replaced.
	if (_pending isNotEqualTo []) then {["SR_FF_Judge", [_unit, _pending select 0]] call CBA_fnc_localEvent};

	private _bleeding = (_unit getVariable ["ace_medical_woundBleeding", 0]) > 0;
	_unit setVariable ["SR_FF_Pending", [_frame, _killed, name _unit, [], _bleeding]];
	[{["SR_FF_Judge", _this] call CBA_fnc_localEvent}, [_unit, _frame]] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

// Waking up ends the knock-down and clears its cause.
["ace_unconscious", {
	params ["_unit", "_state"];
	if (_state) then {
		["SR_FF_Incident", [_unit, false]] call CBA_fnc_localEvent;
	} else {
		if (local _unit) then {_unit setVariable ["SR_DownBy", nil]};
	};
}] call CBA_fnc_addEventHandler;

// Deaths are incidents too: ACE's default fatal injury setting kills on a fatal wound directly.
["ace_medical_death", {
	params ["_unit"];
	["SR_FF_Incident", [_unit, true]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

// Marks knock-downs caused by a script or by medication: ace_medical_fnc_setUnconscious
// (G-force, Zeus, field rations) raises knockOut, and an overdose knocks the patient down inside
// ACE's medicationLocal handler. ACE's handlers run first, so the mark lands right after the
// incident and before SR_FF_Judge reads it.
["ace_medical_knockOut", {
	params ["_unit"];
	if (local _unit) then {_unit setVariable ["SR_FF_NoBlame", diag_frameNo]};
}] call CBA_fnc_addEventHandler;

["ace_medical_treatment_medicationLocal", {
	params ["_unit"];
	if (local _unit) then {_unit setVariable ["SR_FF_NoBlame", diag_frameNo]};
}] call CBA_fnc_addEventHandler;

// Bandages, tourniquets and full heals, on the patient's machine: the bleeding baseline takes
// ACE's new woundBleeding (ACE's handlers run first), and blood-loss blame starts again from the
// next wound.
{
	[_x, {
		params ["_unit"];
		if (!local _unit) exitWith {};
		_unit setVariable ["SR_FF_BleedSeen", _unit getVariable ["ace_medical_woundBleeding", 0]];
		_unit setVariable ["SR_FF_BleedHit", nil];
	}] call CBA_fnc_addEventHandler;
} forEach ["ace_medical_treatment_bandageLocal", "ace_medical_treatment_tourniquetLocal", "ace_medical_treatment_fullHealLocal"];

// KIA Log
// ACE raises ace_killed for every death on the machine where the unit is local. ACE kills inside
// its own woundReceived handler, before ours records the fatal wound, so the killer is worked
// out on the next frame:
// - At the end of a knock-down (cardiac arrest timer, bleed-out, ACE's respawn button while
//   unconscious): the attacker who knocked the player down.
// - Otherwise the attacker of a wound in the death frame or the one before it: a fatal wound,
//   an execution in cardiac arrest, a vehicle destroyed around the player.
// - Otherwise (a scripted kill, hunger, being buried alive): "unknown".
// SR_KIALog = false in 7R/fn_systemInit.sqf turns the KIA log off.
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

// Clears the record on a respawned unit, in case the engine copies variables over from the body.
["CAManBase", "Respawn", {
	params ["_unit"];
	if (!local _unit) exitWith {};
	{
		_unit setVariable [_x, nil];
	} forEach ["SR_LastHit", "SR_DownBy", "SR_FF_AnchorHit", "SR_FF_BleedHit", "SR_FF_BleedSeen", "SR_FF_Pending", "SR_FF_NoBlame"];
}] call CBA_fnc_addClassEventHandler;
