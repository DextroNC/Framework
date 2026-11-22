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

// Combat Log and Debrief Entry: written by 7R/Init/fn_casualtyLogInit.sqf from ACE's ace_killed

// Respawn tracking variable
_unit setVariable ["SR_HasDied",true];