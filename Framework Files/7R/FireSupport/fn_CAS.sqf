/*
	Parameters:
		<-- Target Marker Name as String
		<-- Type as Integer (0: guns, 1: missles, 2: guns + missles, 3: bomb)
		<-- Plane Classname as String
		<-- Delay as Integer
		<-- Spawn Marker Name as String
		<-- Optional: Laser Designated as Boolean
		<-- Optional: Caller as Object (for laser)
	
	Planes:	
		B_Plane_CAS_01_F
		O_Plane_CAS_02_F
		I_Plane_Fighter_03_CAS_F
		
	Description:
		Handles simulated CAS.

	Example:
		nul = ["cas-t",3,"B_Plane_CAS_01_F",10,"STARTSPAWN"] spawn fw_fnc_CAS;
*/
// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
params ["_target","_type","_plane","_delay","_spawn","_laser","_caller"];
if (isNil "_laser") then {_laser = false;_caller=objNull};

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "CASFireMissionLock") then {CASFireMissionLock = false; publicVariable "CASFireMissionLock";};
if (isNil "CASCallAmmo") then {CASCallAmmo = 30; publicVariable "CASCallAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (CASFireMissionLock) exitWith {
	[[SR_Side, "HQ"],"Negative: Close Air Support available. Other Mission in progress."] remoteExec ["sideChat", 0];
};
if (CASCallAmmo == 0) exitWith {
	[[SR_Side, "HQ"],"Negative: Close Air Support available. Out of Ammunition."] remoteExec ["sideChat", 0];
};
if (markerPos _target isEqualto [0,0,0] || !_laser) exitWith {
	[[SR_Side, "HQ"],"No CAS Target designated."] remoteExec ["sideChat", 0];
};

// Find Laser Designator in Group
if (_laser) then {
	_target = objNull;
	while {isNull _target} do {
		{
				_target = laserTarget _x;
				if (!isNull _target) exitWith {_spotter = _x;};
		} forEach units group _caller;
		_target = laserTarget _spotter;
	};
};

// Locks other requests, only one Fire Mission at a time.
CASFireMissionLock = true;
publicVariable "CASFireMissionLock";

// Fire Mission Confirmation Message + Create Log
["FS: Mission Confirmed", 1.5] call ace_common_fnc_displayTextStructured;
_str = "CAS Strike: " + (["Gunrun","Misslerun"," Gun and Missle run","Bomb"] select _type) + " at Grid " + (mapGridPosition markerPos _target) + ".";
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", 0];
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// CAS Strike Preperation
if (isNil "_delay") then {_delay = 0};
if (_delay > 0) then {
	sleep _delay;
	[[SR_Side, "HQ"],"CAS is moments away."] remoteExec ["sideChat", 0];
};

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