/*
	Parameters:
		<-- Input as String/Object (Markername or Object)

	Description:
		Finds a location to an marker or object.


	Example:
	["markername"] call fw_fnc_findLocation;

*/
	
// Parameter Init
params ["_input"];
private _position = [0,0,0];

// Check if Marker else Object
if (typeName  _input == "STRING") then {
	_position = markerPos _input;
} else {
	_position = getPos _input;
};

_position