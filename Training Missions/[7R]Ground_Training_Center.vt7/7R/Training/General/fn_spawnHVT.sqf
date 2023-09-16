/*
	Parameters:
	<-- Spawn as Object
	<-- Sleeper as Boolean
	<-- Class as String

	Description:
		Spawns a Civilian/HVT.
	
	Example (Trigger onActivation):
		nul = [_spawn,false] spawn fw_fnc_setTargets;

*/
// Server only execute
if(!isServer) exitWith {};

// Parameter Init
params ["_spawn",["_sleeper",0],["_class","C_man_w_worker_F"]];

// Spawn Civilian
private _unit = (createGroup civilian) createUnit [_class, [0,0,0], [],0,"NONE"];
_unit disableAi "ALL";

// Sleeper
if (_sleeper > 0) then {
	[_unit, _sleeper] spawn fw_fnc_civSleeper;
};

// Set Position
_unit setDir (direction _spawn);
_unit setPos (position _spawn);

_unit