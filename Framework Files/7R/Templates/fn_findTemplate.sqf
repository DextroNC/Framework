/*

	Parameters:
		<-- Number as Integer  / Numbers as Array

	Return:
		--> Template as Array

	Description:
		Returns the Template Array for a given Template Number.

	Example:
		_return = [1] fw_fnc_findTemplate;

*/

// Parameter Init
params ["_entry"];
private "_number";
private _return = [];

// Check if Array provided
if (typeName _entry == "ARRAY" ) then {
	_number = selectRandom _entry;
} else {
	_number = _entry;
};

// Find Template
{
	if (_number in _x) exitWith {
		_return = _x;
	};
}forEach SR_Template;

// Return
_return