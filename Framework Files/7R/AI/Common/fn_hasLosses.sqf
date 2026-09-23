/*
	Parameters:
		<-- Group as Group
		<-- Optional (default: 45): Treshhold as Integer (Percentage of the original group still alive, below which the loss is substancial)

	Return:
	--> Boolean (Substancial Loss)

	Description:
		Evaluate whether a group suffered substancial losses

	Example:
		[_group,45] call fw_fnc_hasLosses;
*/
// Parameter Init
params ["_group",["_tresh",45]];
private _return = false;

// Check Current and Original Group Size
private _original = _group getVariable ["SR_GroupSize", 1];
private _current = {alive _x} count (units _group);

// If Group is down to less than _tresh percent of Original Size
if (((_current * 100) / _original) < _tresh) then {
	_return = true;
	// Debug
	if (SR_Debug) then {systemChat format ["%1 suffered substancial losses", _group];};
};

// Return
_return
