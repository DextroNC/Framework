/*
	Parameters:
		<-- Leader as Object
		<-- Mode Parameter as String ("P","G","R")
		<-- Modifier Parameters (modifies Mode)
		
	Description:
		Adds a Unit to the Patrol Module and based on the Parameters
		
	Example (Patrol in Zone "A1"):
		nul = [leader,"P","A1"] spawn fw_fnc_patrol;
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
params [["_leader",objNull],["_mode","P"]];
private _modifier = [];

// Debug check (insuffiecent input cancel)
if (count _this < 3 || !(_mode in ["P","G","R"])) exitWith {
	hint format ["%1:Error - Insufficient Input", group objNull];
};

// Create Modifier Array
private _input = _this deleteAt 1;
{
	_modifier pushBack _x
}forEach _input;

// Push Group into Patrol script adding Mode and Modifier
_group = group _leader;
_group setVariable ["SR_PatrolMode",_mode];
_group setVariable ["SR_PatrolModifier",_modifier];
SR_PatrolUnits pushBackUnique _group; 