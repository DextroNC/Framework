/*

	Parameters:
		<-- Leader as Object
		<-- Target Position Marker as String
		<-- Limited Speed as Boolean
		<-- Patrol Parameters initialized on Target Pos as Array
		<-- Optional: Patrol Parameters initialized on Target Pos for Cargo as Array
		
	Description:
	Handles tempalte spawned Vehicles. First they will get a waypoint at Target Marker Pos. 
	If engage or waypoint is reached, they get passed into Patrol Script.

*/

// Parameter Init
params ["_leader","_marker","_speed","_patrolParams",["_cargo",[]],["_groupSize",4]];
private "_ins"; 
_veh = vehicle _leader;

// Damaged Eventhandler
_index = (vehicle _leader) addEventHandler ["Dammaged",{(leader group driver (_this select 0)) setVariable ['dismount', true, true];}];

// First insertion Waypoint
if ((markerSize _marker) isEqualTo [1,1]) then {
	_ins = markerPos _marker;
} else {
	_ins = [_marker, true] call CBA_fnc_randPosArea;
};

// Target Waypoint
_wp = group _leader addWaypoint [_ins ,0,1];
_wp setWaypointType "MOVE";
// Check for Speed Limit and Enforce
if (_speed) then {
	_wp setWaypointSpeed "LIMITED";
} else {
	_wp setWaypointSpeed "NORMAL";
};
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointStatements ["true", "this setVariable ['dismount', true, true]"];

// Initialize Dismount when at WP or Engaged
waitUntil {_leader getVariable ["dismount", false] || !alive _leader || !alive (vehicle _leader) || _leader call BIS_fnc_enemyDetected || !((group _leader) getVariable ["SR_State", "PATROL"] isEqualTo "PATROL")};

// Remove Eventhandler
(vehicle _leader) removeEventHandler ["Dammaged", _index];
[_leader, _patrolParams, _cargo, _groupSize] spawn fw_fnc_dismountVehicle;