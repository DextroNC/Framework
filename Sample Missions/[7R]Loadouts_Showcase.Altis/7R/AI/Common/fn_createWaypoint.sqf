/*

	Parameters:
		<-- Group as Group
		<-- Position as Array/Marker
		<-- Type as String (Default A3 Types + "END" special type, default: "MOVE")
		<-- Opt. Exclusiv as Boolean (default: false)
		<-- Opt. Speed as String (default :"NORMAL")
		<-- Opt. Behaviour as String (default: "CARELESS")
		<-- Opt. CombatMode as String (default: "WHITE")
		<-- Opt. Statements as String (default: ["true",""])

	Return:
		--> Waypoint Return [Group, index]

	Description:
		Creates a waypoint for AI
	
	Example:
		_return = [_group, _position, _type] call fw_fnc_createWaypoint;

*/
// Parameter Init
params ["_group","_position",["_type","MOVE"],["_exclusiv",false],["_speed","NORMAL"],["_behaviour","CARELESS"],["_combatMode","WHITE"],["_statement",["true", ""]]];
private _waypointNumber = 1;

// Adjust position
if (typeName _position isEqualTo "STRING") then {
	_position = markerPos _position;
};

// Adjust for special parameters
// Special end statement
if (_type isEqualTo "END") then {
	_type = "MOVE";
	_statement = ["true", "[this] call fw_fnc_deleteVehicle;"];
};

// Waypoint exclusivity
if (_exclusiv) then {
	{deleteWaypoint _x} forEach waypoints _group;
} else {
	_waypointNumber = (count (waypoints _group)) + 1;
};


// Create waypoint
private _waypoint = _group addWaypoint [_position, 0, _waypointNumber];
_waypoint setWayPointType _type;
_waypoint setWayPointSpeed _speed;
_waypoint setWayPointBehaviour _behaviour;
_waypoint setWayPointCombatMode _combatMode;
_waypoint setWaypointStatements _statement;

// Return
_waypoint