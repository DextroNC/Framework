// Parameter Init
params ["_unit"];
private _timeOfDeath = CBA_MissionTime;

// Set Max Respawn Time
if (SR_RespawnLock) then {
	// When locked block respawn
	setPlayerRespawnTime 9999;
};

// Pilot excemption to bypass Queue
private _pilot = (_unit getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot";
if (_pilot && !SR_RespawnLock) then {
	setPlayerRespawnTime 30;
};

// Force Instant Respawn
if (SR_RespawnForce) then {
	// When on, force instant respawn
	setPlayerRespawnTime 3;
};
	
// Start Spectator
[true] call acre_api_fnc_setSpectator;
["Initialize", [player, [], false,false]] call BIS_fnc_EGSpectator;

// Log Entry
private _nameDead = name _unit;
private _nameGroup = groupId (group _unit);
private _nameKiller = str (_unit getVariable ["ace_medical_lastDamageSource", "unknown"]);
private _entry = "<br/>" + _nameDead + " [" +  _nameGroup + "] has been killed in action by +"  + _nameKiller + ".";
["CombatLog", ["KIA", _entry]] call CBA_fnc_globalEvent; 

// Debrief Entry
SR_KIA = SR_KIA + "<br/>" + _nameDead + " [" + _nameGroup + "]" ;
publicVariable "SR_KIA";

// Respawn tracking variable
_unit setVariable ["SR_HasDied",true];