/*
	Parameters:
		<-- Classname as String
		<-- Position as Position

	Return:
		--> Unit as Object
		
		Description:
			Spawns a civilian or sleeper unit at a given position.
		
		Example:
			_return = ["LOP_CHR_Civ_Random",[0,0,0],true] call fw_fnc_civUnitSpawn;

*/
// Parameter Init
params ["_classname", "_position"];

// Check Unit Cap
if (count (allUnits - allPlayers) > SR_Unit_Cap) exitWith {diag_log "Unit Cap reached."};

// Create Civilian
private _group = createGroup civilian;
private _unit = (_group) createUnit [_classname, _position,[],2,"NONE"];

// Adjust behaviour
_group setVariable ["Vcm_Disable",true];
_unit setBehaviour "SAFE";

// Return
_unit