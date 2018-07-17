/*
	Parameters:
		<-- Group as Group
		
	Description:
		Upsmon Addition to make Units charge players close to them.
*/

// Parameter Init
params ["_grp"];
_last = _grp getVariable ["UPSMON_LastOrder",0];
_grp setVariable ["UPSMON_Grpmission","RAMPAGE"];

// Check if last run is more than 30sec ago.
if (CBA_MissionTime - _last < 30) exitWith {};
_grp setVariable ["UPSMON_LastOrder",CBA_MissionTime];

// Disable what may hold their charge back
{
	//_x disableAI "SUPPRESSION";
	_x disableAI "AUTOCOMBAT";
} forEach (units _grp);
_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";

// Find neareast Player
_nearestPlayer = [];
if (count(waypoints _grp) > 0) then {
	{
		deleteWaypoint ((waypoints _grp) select 0);
	}forEach (waypoints _grp);
};

// Create Waypoint
_nearestPlayer = [position leader _grp, allPlayers, UPSMON_RAMPAGE_DISTANCE, {isTouchingGround (vehicle _x)}] call CBA_fnc_getNearest;
if (count _nearestPlayer == 0) then {
	[_grp, position leader _grp] call BIS_fnc_taskAttack;
} else {
	[_grp, position (selectRandom _nearestPlayer)] call BIS_fnc_taskAttack;
};
