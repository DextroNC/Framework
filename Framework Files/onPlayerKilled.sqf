// Init Params
setPlayerRespawnTime 999999;

// Start Spectator
[true] call acre_api_fnc_setSpectator;
["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;


// Log Entry
_unit = _this select 0;
_name = name _unit;
_killer = str (_unit getVariable ["ace_medical_lastDamageSource", "unknown"]);
_str = "<br/>" +_name + " has been killed in action by +"  + _killer + ".";
["CombatLog", ["KIA", _str]] call CBA_fnc_globalEvent; 

// Debrief Entry
SR_KIA = SR_KIA + "<br/>" + _name ;
publicVariable "SR_KIA";

			
// Init Variables if not initiliazed yet
if (isNil "SR_RespawnWave") then {
	SR_RespawnWave = false;
	publicVariable "SR_RespawnWave";
};
if (isNil "SR_RespawnLock") then {
	SR_RespawnLock = false;
	publicVariable "SR_RespawnLock";
};
if (isNil "SR_RespawnForce") then {
	SR_RespawnForce = false;
	publicVariable "SR_RespawnForce";
};

// Active Wave check
if (SR_RespawnWave) exitWith {
	setPlayerRespawnTime 3;
	_oldGroup = units group player; 
	_newGroup = createGroup SR_Side; 
	[player] joinSilent _newGroup; 
	{player reveal _x} forEach _oldGroup;
};

// Count Dead to evaluate weither to start wave or not (also contains lock)
if (!SR_RespawnLock) Then {
	//_dead = ({isPlayer _x} count allDeadMen) - ({isPlayer _x && alive _x} count playableunits);
	_dead = ({isPlayer _x} count allDeadMen);

	if (_dead >= 2) then {
		["SideChatSS", [[SR_Side, "HQ"], "Reinforments Wave incoming."]] call CBA_fnc_globalEvent;
		["RespawnDiary", ["Reinforcements dispatched."]] call CBA_fnc_globalEvent;
		// Start Wave Cycle
		SR_RespawnWave = true;
		publicVariable "SR_RespawnWave";

		[{SR_RespawnWave = false; publicVariable "SR_RespawnWave"; ["SideChatSS", [[SR_Side, "HQ"], "Reinforments Wave ended."]] call CBA_fnc_globalEvent;}, [], 60] call CBA_fnc_waitAndExecute;
	};
};

// Wait for wave or force
waitUntil {SR_RespawnWave || SR_RespawnForce || (player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot" || !(markerPos "SR_RP" isEqualTo [0,0,0])};
setPlayerRespawnTime 3;
if ((player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot") exitWith {};
_oldGroup = units group player; 
_newGroup = createGroup SR_Side; 
[player] joinSilent _newGroup; 
{player reveal _x} forEach _oldGroup;