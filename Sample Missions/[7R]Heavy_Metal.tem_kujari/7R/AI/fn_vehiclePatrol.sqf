/*

	Parameters:
		<-- Vehicle as Object
		<-- Array of Patrol Points as Array of Marker Names as String Example: ["pat1", "pat2"]
		<-- Limited Speed as Integer (in kph)
		<-- Upsmon Parameters initialized on when in contact as Array

	Description:
		AI Vehicle Patrol, on contact passed to Upsmon
		
*/

// Server only execute check
if (!isServer) exitWith{};

// Parameter Init
params ["_v","_markers","_speed","_upsmon"];
private ["_c","_l","_w"];
_l = leader group driver _v;

// Damaged Eventhandler
_index = _v addEventHandler ["Dammaged",{(_this select 0) setVariable ['dismount', true, true];}];

// Limited Vehicle Speed
_v limitSpeed _speed;

// Creates Waypoints
_c = count _markers;
 for [{_i=0}, {_i < _c}, {_i = _i + 1}] do {
	_w = group _l addWaypoint [markerPos (_markers select _i) ,0,5];
	_w setWaypointType "MOVE";
	_w setWaypointSpeed "LIMITED";
	_w setWaypointBehaviour "CARELESS";
	if (_i == (_c - 1)) then {
		_w setWaypointType "CYCLE";
	};
 };
 
[{(_this select 0) getVariable ["dismount", false] || !alive (_this select 0) || (_this select 1) call BIS_fnc_enemyDetected}, {
   params ["_v","_l","_index","_upsmon"];
   _v removeEventHandler ["Dammaged", _index];
	[_l, _upsmon] spawn fw_fnc_dismountVehicle;
},[_v,_l,_index,_upsmon]] call CBA_fnc_waitUntilAndExecute;