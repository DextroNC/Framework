/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- UAV Classname as String
		<-- Opt. Delay as Integer (delay from call to arrival) : default = 0
		<-- Opt. Airtime as Integer (time in the AO above objective) : default = 180
		<-- Opt. Cooldown as Integer (time between 2 uavs) : default = 300
		<-- Opt. Ammunition as Integer (percentage of ammunition) : default = 1 (100%)
	
	UAVs:	

		
	Description:
		Handles simulated UAV Support.

	Example:
		nul = ["cas-t","STARTSPAWN","",0,120,240,0.75] spawn fw_fnc_UAV;
*/
// Parameter Init
params [["_tM","cas-t"],["_sM","STARTSPAWN"],["_class","B_UAV_02_dynamicLoadout_F"],["_delay",0],["_airTime",180],["_cooldown",300],["_ammo",1]];
_str = "";
_spawnPos = markerPos "_tM";
_targetPos = markerPos "_sM";
_lock = missionNamespace getVariable ["UAV_Lock",false];
_last = missionNamespace getVariable ["UAV_Last", 0];
_ammo = missionNamespace getVariable ["UAV_Ammo", 0];

// Check Avialability
if (_lock) exitWith {
	["UAV: All in use", 1.5] call ace_common_fnc_displayTextStructured;
};
if (CBA_MissionTime - _last < _cooldown) exitWith {
	_str = "UAV: Cooldown " + (_cooldown - (CBA_MissionTime - _last)) + "s"; 
	[_str, 1.5] call ace_common_fnc_displayTextStructured;
};
if (_ammo == 0) exitWith {
	["UAV: None left", 1.5] call ace_common_fnc_displayTextStructured;
};
if (_targetPos isEqualto [0,0,0]) exitWith {
	_str = "CAS Strike: " + (["Gunrun","Misslerun"," Gun and Missle run","Bomb"] select _type) + " at Grid " + (mapGridPosition markerPos _target) + ".";
	["UAV: No Target-Area", 1.5] call ace_common_fnc_displayTextStructured;
};

// Set Lock
UAV_Lock = true;
publicVariable "UAV_Lock";


// Fire Mission Confirmation Message + Create Log
["UAV: Mission Confirmed", 1.5] call ace_common_fnc_displayTextStructured;
if (_laser) then {
	_str = "Guided CAS Strike: " + (["Gunrun","Misslerun"," Gun and Missle run","Bomb"] select _type) + " at Grid " + (mapGridPosition _target) + ".";
} else {
	_str = "CAS Strike: " + (["Gunrun","Misslerun"," Gun and Missle run","Bomb"] select _type) + " at Grid " + (mapGridPosition markerPos _target) + ".";
};
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", 0];
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// CAS Strike Preperation
if (isNil "_delay") then {_delay = 0};
if (_delay > 0) then {
	sleep _delay;
	[[SR_Side, "HQ"],"CAS is moments away."] remoteExec ["sideChat", 0];
};


_start = CBA_MissionTime;

// Module Prep
_dir = random 360;
    
// Module Exec
if (_laser) then {
	_target setVariable ["vehicle",_plane, true];
	_target setVariable ["type", 3, true];
	_target setDir _dir;
	[_target,nil,true] call BIS_fnc_moduleCAS;
} else {
	_cas = createVehicle ["LaserTargetCBase",(markerPos _target), [], 0, "NONE"];
	_cas enableSimulation false; 
	_cas hideObject true;
	_cas setVariable ["vehicle",_plane, true];
	_cas setVariable ["type", 3, true];
	_cas setDir _dir;
	[_cas,nil,true] call BIS_fnc_moduleCAS;
	deleteVehicle _cas;
};

// Publishing of new Ammo Count and Ending Message
deleteMarker "CASTarget";
CASCallAmmo = CASCallAmmo - 1;
publicVariable "CASCallAmmo";

_str = "CAS completed. " + str (CASCallAmmo) + " Strikes left.";
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", 0];

// Lock release to allow new Fire Missions
CASFireMissionLock = false;
publicVariable "CASFireMissionLock";