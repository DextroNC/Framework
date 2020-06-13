/*
	Parameters:
		<-- Group as Group
		<-- Treshhold as Integer (Percentage of Loss which is considered substancial)

	Return:
	--> Boolean (Substancial Loss)

	Description:
		Evaluate whether a group suffered substancial losses

	Example:
		[_group,] call fw_fnc_hasLosses;
*/
// Parameter Init
params ["_group","_tresh"];
private _return = false;

// Check Current and Original Group Size
private _original = _group getVariable ["SR_GroupSize", 1];
private _current = {alive _x} count (units _group);

// If Group is down to less than 45 percent of Original Size
if (((_current * 100) / _original) < 45) then {_return = true;};

// Debug
//if (SR_Debug) then {systemChat format ["%1 suffered substancial losses", _this];};

// Return
_return
