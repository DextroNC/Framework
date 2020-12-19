/*
	Parameters:
		<-- Target Marker Name as String
		<-- Type as Integer (0: guns, 1: missles, 2: guns + missles, 3: bomb)
		<-- Plane Classname as String
		<-- Delay as Integer
	
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
_str = "";

// Parameter Init
params ["_target",["_type",3],["_plane","B_Plane_Fighter_01_F"],["_delay",0]];

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "CASFireMissionLock") then {CASFireMissionLock = false; publicVariable "CASFireMissionLock";};
if (isNil "CASCallAmmo") then {CASCallAmmo = 30; publicVariable "CASCallAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (CASFireMissionLock) exitWith {
	["Negative: Close Air Support available. Other Mission in progress.","FS: Currently Busy"] spawn fw_fnc_info;
	
};
if (CASCallAmmo == 0) exitWith {
	["Negative: Close Air Support available. Out of Ammunition.","FS: No Ammunition"] spawn fw_fnc_info;
};
if (markerPos _target isEqualto [0,0,0]) exitWith {
	["No CAS Target designated.","FS: No Target"] spawn fw_fnc_info;
};
_start = CBA_MissionTime;


// Locks other requests, only one Fire Mission at a time.
CASFireMissionLock = true;
publicVariable "CASFireMissionLock";

// Fire Mission Confirmation Message + Create Log
_str = "CAS Strike: " + (["Gun Run","Missle Run"," Gun and Missle Run","Bomb"] select _type) + " at Grid " + (mapGridPosition markerPos _target) + ".";
[_str,_str] spawn fw_fnc_info;
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// CAS Strike Preperation
if (isNil "_delay") then {_delay = 0};
if (_delay > 0) then {
	sleep _delay;
	["CAS is moments away."] spawn fw_fnc_info;
};

// Module Prep
private _direction = markerDir _target;
  
// Module Exec
_cas = createVehicle ["LaserTargetCBase",(markerPos _target), [], 0, "NONE"];
_cas enableSimulation false; 
_cas hideObject true;
_cas setVariable ["vehicle",_plane, true];
_cas setVariable ["type", _type, true];
_cas setDir _direction;
[_cas,nil,true] call BIS_fnc_moduleCAS;
deleteVehicle _cas;

// Publishing of new Ammo Count and Ending Message
deleteMarker "CASTarget";
CASCallAmmo = CASCallAmmo - 1;
publicVariable "CASCallAmmo";

_str = "CAS completed. " + str (CASCallAmmo) + " Strikes left.";
[_str,_str] spawn fw_fnc_info;

// Lock release to allow new Fire Missions
CASFireMissionLock = false;
publicVariable "CASFireMissionLock";