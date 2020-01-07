/*
	Parameters:
		<-- Group as Group

	Return:
	--> None

	Description:
		Makes a unit enter the AO as Reinforcements

	Example:
		[_group] spawn fw_fnc_reinforce;
*/
// Parameter Init
params ["_group"];

// Get Random Position within Patrol Zone
private _position = [_group] call fw_fnc_getRandomPos;

// Find Nearest Enemy
private _enemy = leader _group findNearestEnemy _position;

// If no enemy is present use Random Positon, create Waypoint
if (isNull _enemy) then {_enemy = _position;};

// Create Waypoint
[_group,_position, 50, "SAD", "AWARE", "RED", "FULL",selectRandom ["STAG COLUMN","DIAMOND","WEDGE","ECH LEFT","ECH RIGHT"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;

// Set Group to Patrol Mode
_group deleteGroupWhenEmpty true;
_group setVariable ["SR_PatrolMode","P"];

// Debug
if (SR_Debug) then {systemChat format ["%1 is reinforcing %2", _group, (mapGridPosition _position)];};
