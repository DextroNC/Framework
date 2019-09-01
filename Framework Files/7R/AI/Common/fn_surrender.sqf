/*
	Parameters:
		<-- Unit as Object

	Return:
	--> None

	Description:
		Makes a Unit surrender, stops surrendering if not enemies are close or too much time passed

	Example:
		[_unit] spawn fw_fnc_surrender;
*/
// Parameter Init
params ["_unit"];

// Surrender Unit
[_unit, true] call ace_captives_setSurrendered;

// If unit is handcuffed do nothing, else unsurrender after timer and continue fighting
[
	// Condition
	{_this getVariable ["ace_captives_isHandcuffed", false]},
	// Statement
	{},
	// Args
	_unit,
	// Timeout
	random [30, 45, 60],
	// TimeoutCode
	{[_this, false] call ace_captives_setSurrendered;}
] call CBA_fnc_waitUntilAndExecute;
