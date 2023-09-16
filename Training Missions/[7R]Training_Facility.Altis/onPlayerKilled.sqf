// Init Params
setPlayerRespawnTime 3;

/*
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

setPlayerRespawnTime 3;
if ((player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot") exitWith {};
_oldGroup = units group player; 
_newGroup = createGroup SR_Side; 
[player] joinSilent _newGroup; 
{player reveal _x} forEach _oldGroup;*/
