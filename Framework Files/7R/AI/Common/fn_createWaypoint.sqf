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
		<-- Opt. CompletionRadius as Integer (default: 0)
		<-- Opt. Timeout as Array (default [0,0,0])

	Return:
		--> Waypoint Return [Group, index]

	Description:
		Creates a waypoint for AI
	
	Example:
		_return = [_group, _position, _type] call fw_fnc_createWaypoint;

*/
// Parameter Init
params ["_group","_position",["_type","MOVE"],["_exclusiv",false],["_speed","NORMAL"],["_behaviour","CARELESS"],["_combatMode","WHITE"],["_statement",["true", ""]],["_completionRadius",0],["_radius",0],["_timeout",[0,0,0]]];
private _waypointNumber = 1;

// Adjust position
if (typeName _position isEqualTo "STRING") then {
	_position = markerPos _position;
};

// Adjust for special parameters
// Special end statement
switch (_type) do
{
	// Delete vehicle on arrival
	case "END": {	
		_type = "MOVE";
		_statement = ["true", "nul = [this] spawn fw_fnc_deleteVehicle;"];
		_completionRadius = 50	;
	};
	// Drop cargo by parachute
	case "DROP": {
		_type = "MOVE";
		_statement = ["true", "nul = [this] spawn fw_fnc_supplyDropEject;"];
		_completionRadius = 100;
	};
	case "FREEFALL": {
		_type = "MOVE";
		// Wait until and execute
		[{
			(_this select 0) distance2d (_this select 1) < 50
		}, {
			nul = [_this select 0] spawn fw_fnc_freefallDrop;
		}, [vehicle leader _group,_position]] call CBA_fnc_waitUntilAndExecute;
	};
	case "STATICLINE": {
		_type = "MOVE";
		_statement = ["true", "nul = [vehicle this] spawn rhs_fnc_infantryParadrop;"];
		_completionRadius = 100;
		
	};
	default {};
};

// Waypoint exclusivity
if (_exclusiv) then {
	{deleteWaypoint _x} forEach waypoints _group;
} else {
	_waypointNumber = (count (waypoints _group)) + 1;
};


// Create waypoint
private _waypoint = _group addWaypoint [_position, _radius, _waypointNumber];
_waypoint setWayPointType _type;
_waypoint setWayPointSpeed _speed;
_waypoint setWayPointBehaviour _behaviour;
_waypoint setWayPointCombatMode _combatMode;
_waypoint setWaypointStatements _statement;
_waypoint setWaypointCompletionRadius _completionRadius;
_waypoint setWaypointTimeout _timeout;

// Return
_waypoint