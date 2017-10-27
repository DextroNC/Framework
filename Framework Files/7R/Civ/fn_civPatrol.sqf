/*
	Parameters:
		<-- Group/Unit as Group
		<-- Zone (Marker Name) as String
		<-- Opt. Amount of Waypoints as Integer: Default = 4; 

	Description:
	Manages patrol for civilians.
		
	Example:
	[_grp,_marker,4] spawn fw_fnc_civPatrol;
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
params ["_grp","_zone","_amount"];
if (isNil "_amount") then {_amount =4};

// Task Patrol
_pa = [_zone] call CBA_fnc_getArea;
[_grp, _pa select 0, _pa select 1, _amount, "MOVE", "SAFE", "BLUE", "LIMITED", "COLUMN", "", [3,6,9]] call CBA_fnc_taskPatrol;
