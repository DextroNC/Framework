/*
	Parameters:
		<-- Array of Units
	
	Description:
		Sorts an Array of Units by Group (reverse Alphabet)

	Return:
	--> Array of Units sorted by Group

	Example:
	_sortedArray = [_units] call fw_fnc_sortUnitsByGroup;

*/
// Parameter init
params ["_units"];
_return = [];
_groups = [];
	
// Find Groups
{
	_groups pushBackUnique (group _x);
}forEach _units;

// Decending Group Order
_groups sort false;

// Sort Player by Group
{
	{
		if (_x in _units) then {
			_return pushBack _x;
		};
	}forEach units _x;
}forEach _groups;

_return
