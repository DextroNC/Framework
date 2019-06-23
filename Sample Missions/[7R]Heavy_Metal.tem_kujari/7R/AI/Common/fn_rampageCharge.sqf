/*
	Parameters:
		<-- Group as Group
		
	Description:
		Units charge players close to them.
*/

// Parameter Init
params ["_grp"];

// Find neareast Player
_nearestPlayer = [];
_nearestPlayer = [position leader _grp, allPlayers, SR_RAMPAGE_DISTANCE, {isTouchingGround (vehicle _x)}] call CBA_fnc_getNearest;

// Delete previous Waypoint
if (count(waypoints _grp) > 0) then {
	deleteWaypoint [_grp, 1];
};

// Create Waypoint position
_position = [];

if (count _nearestPlayer == 0) then {
	_position = position leader _grp;
	
} else {
	_position = position (selectRandom _nearestPlayer);	
};

// Create Waypoint
[_grp,_position, 50, "SAD", "AWARE", "RED", "FULL",selectRandom ["STAG COLUMN","DIAMOND","WEDGE","ECH LEFT","ECH RIGHT"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;

// Time based Reset
[{deleteWaypoint [_this, 1];}, _grp, 90] call CBA_fnc_waitAndExecute;

// Debug
if (SR_Debug) then {systemChat format ["%1 on a rampage to %2", _grp, (mapGridPosition _position)];};
