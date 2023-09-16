/*
	Parameters:
	<-- Trigger as Object
	<-- Annimation as Integer

	Description:
		Sets up popup targets.
	
	Example (Trigger onActivation):
		nul = [_targets,1] spawn fw_fnc_setTargets;

*/
// Server only execute
if(!isServer) exitWith {};

// Parameter Init
params ["_targets",["_annimation",1]];

// Set Targets
{
	_x setVariable ["SR_Hit",0];
	_x animate ["terc", _annimation];
}forEach _targets;