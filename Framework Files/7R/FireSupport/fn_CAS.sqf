/*
	Parameters:
		<-- Target Marker Name as String
		<-- Type as Integer (0: guns, 1: missles, 2: guns + missles, 3: bomb)
		<-- Plane Classname as String
		<-- Delay as Integer
		<-- Spawn Marker Name as String
	
	Planes:	
		B_Plane_CAS_01_F
		O_Plane_CAS_02_F
		I_Plane_Fighter_03_CAS_F
		
	Description:
		Handles simulated CAS.

	Example:
		nul = ["cas-t",3,"B_Plane_CAS_01_F",10,"STARTSPAWN"] spawn fw_fnc_CAS;
*/

// Parameter Init
params ["_target","_type","_plane","_delay","_spawn"];

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "CASFireMissionLock") then {CASFireMissionLock = false; publicVariable "CASFireMissionLock";};
if (isNil "CASCallAmmo") then {CASCallAmmo = 30; publicVariable "CASCallAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (CASFireMissionLock) exitWith {
	[[SR_Side, "IND"],"Negative: Close Air Support available. Other Mission in progress."] remoteExec ["sideChat", 0];
};
if (CASCallAmmo == 0) exitWith {
	[[SR_Side, "IND"],"Negative: Close Air Support available. Out of Ammunition."] remoteExec ["sideChat", 0];
};
if (markerPos _target isEqualto [0,0,0]) exitWith {
	[[SR_Side, "IND"],"No CAS Target designated."] remoteExec ["sideChat", 0];
};

// Locks other requests, only one Fire Mission at a time.
CASFireMissionLock = true;
publicVariable "CASFireMissionLock";

// Fire Mission Confirmation Message + Create Log
_str = "CAS Strike: " + (["Gunrun","Misslerun"," Gun and Missle run","Bomb"] select _type) + " at Grid " + (mapGridPosition markerPos _target) + ".";
[[SR_Side, "IND"],_str] remoteExec ["sideChat", 0];
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// CAS Strike Preperation
if (isNil "_delay") then {_delay = 0};
if (_delay > 0) then {
	sleep _delay;
	[[SR_Side, "IND"],"CAS is moments away."] remoteExec ["sideChat", 0];
};

// Module Prep
_center = createCenter sideLogic;   
_group = createGroup _center;  
_pos = markerPos _target;  
_dir = random 360;
    
// Module Exec
_cas = _group createUnit ["ModuleCAS_F",(markerPos _target), [], 0, "NONE"];  
_cas setVariable ["vehicle","B_Plane_CAS_01_F", true];
_cas setVariable ["type", 3, true];
_cas setDir _dir;

// Publishing of new Ammo Count and Ending Message
waitUntil {!alive _cas};
CASCallAmmo = CASCallAmmo - 1;
publicVariable "CASCallAmmo";
deleteMarker _target;
sleep 5;

_str = "CAS completed. " + str (CASCallAmmo) + " Strikes left.";
[[SR_Side, "IND"],_str] remoteExec ["sideChat", 0];

// Lock release to allow new Fire Missions
CASFireMissionLock = false;
publicVariable "CASFireMissionLock";