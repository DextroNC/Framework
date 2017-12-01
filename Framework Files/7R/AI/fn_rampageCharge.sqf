/*
	Parameters:
		<-- Group as Group
		
	Description:
		Upsmon Addition to make Units charge players close to them.
*/

// Parameter Init
params ["_grp"];

_grp setVariable ["UPSMON_Grpmission","RAMPAGE"];

{
	_x disableAI "SUPPRESSION";
	_x disableAI "AUTOCOMBAT";
} forEach (units _grp);

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";

[{
	Params ["_args","_handle"];
	_grp = _args select 0;
	_nearestPlayer = [];
	if (count(waypoints _grp) > 0) then {
		{
			deleteWaypoint ((waypoints _grp) select 0);
		}forEach (waypoints _grp);
	};
	if ({alive _x} count (units _grp) < 2 || !(_grp getvariable ["UPSMON_Grpmission",""] isEqualTo "RAMPAGE")) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
	_nearestPlayer = [position leader _grp, allPlayers, UPSMON_RAMPAGE_DISTANCE, {isTouchingGround (vehicle _x)}] call CBA_fnc_getNearest;
	if (count _nearestPlayer == 0) then {
		[_grp, position leader _grp] call BIS_fnc_taskAttack;
	} else {
		[_grp, position (selectRandom _nearestPlayer)] call BIS_fnc_taskAttack;
	};
} , 15, [_grp]] call CBA_fnc_addPerFrameHandler;