/*
	Parameters:
		<-- Leader as Object
		<-- Zone as String (Marker Name)
		<-- Mode Parameter as String ("P","G","R","H")
		<-- Modifier Parameters (modifies Mode)

	Description:
		Adds a Unit to the Patrol Module and based on the Parameters

	Example (Patrol in Zone "A1"):
		nul = [leader,"A1","P"] spawn fw_fnc_patrol;
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
params [["_leader",objNull],["_zone",""],["_mode","P"]];

// UPSMON Legacy Modifier
switch (_mode) do {
	// Phase 0 - Initial
	case "SAFE": {
		_mode = "P";
	};
	case "AWARE": {
		_mode = "R";
	};
	case "FORTIFY": {
		_mode = "H";
	};
};

// Debug check (insuffiecent input cancel)
if (count _this < 3 || !(_mode in ["P","G","R","H","RP","D"]) || count _zone == 0) exitWith {
	systemChat format ["%1:Error - Insufficient Input", group objNull];
};

// Create Modifier Array
private _input = _this;
_input deleteRange [0,3];
_modifier = [_zone];
{
	_modifier pushBack _x
}forEach _input;

// Push Group into Patrol script adding Mode and Modifier
_group = group _leader;
_group deleteGroupWhenEmpty true;

// If Param = Defense, disable VCOM
if (_mode isEqualTo "D") then {
	_group setVariable ["Vcm_Disable",true,true];
	_group setVariable ["SR_PatrolMode","P"];
};

_group setVariable ["SR_PatrolMode",_mode];
_group setVariable ["SR_PatrolModifier",_modifier];
SR_PatrolUnits pushBackUnique _group;
