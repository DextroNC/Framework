/*
	Parameters:
		<-- Unit as Object
		
	Description:
		Upsmon Addition to make Units charge players close to them if they are rogue.
*/

// Parameter Init
params ["_unit"];

_unit disableAI "SUPPRESSION";
_unit disableAI "AUTOCOMBAT";
_unit setBehaviour "AWARE";
_unit setCombatMode "RED";

[{
	Params ["_args","_handle"];
	_unit = _args select 0;
	if (!alive _unit) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
	_nearestPlayer = [position _unit, allPlayers, 250, {isTouchingGround (vehicle _x)}] call CBA_fnc_getNearest;
	if (isNull _nearestPlayer) then {
		[group _unit, position _unit] call BIS_fnc_taskAttack;
	} else {
		[group _unit, position _nearestPlayer] call BIS_fnc_taskAttack;
	};
} , 10, [_unit]] call CBA_fnc_addPerFrameHandler;