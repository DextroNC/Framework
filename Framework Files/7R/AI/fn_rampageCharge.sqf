/*
	Parameters:
		<-- Group as Group
		
	Description:
		Upsmon Addition to make Units charge players close to them.
*/

// Parameter Init
params ["_grp"];

{
	_x disableAI "SUPPRESSION";
	_x disableAI "AUTOCOMBAT";
} forEach (units _grp);

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";

[{
	Params ["_args","_handle"];
	_grp = _args select 0;
	if (!alive _grp) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
	_nearestPlayer = [position leader _grp, allPlayers, 350, {isTouchingGround (vehicle _x)}] call CBA_fnc_getNearest;
	if (isNull _nearestPlayer) then {
		[_grp, position leader _grp] call BIS_fnc_taskAttack;
	} else {
		[_grp, position leader _nearestPlayer] call BIS_fnc_taskAttack;
	};
} , 5, [_grp]] call CBA_fnc_addPerFrameHandler;