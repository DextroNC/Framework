/*
	Parameters:
		<-- Unit as Object
		<-- Panic as Boolean (default: true)
		
	Description:
		Applies a killed Eventhandler tracking civilian casualties.
		
	Example:
		nul = [_unit] spawn fw_fnc_civEventhandler;

*/

// Parameter Init
params ["_unit",["_panic",true]];

// Killed Eventhandler
[_unit] spawn fw_fnc_civKilledEH;

// Panic Eventhandler
if (_panic) then {
	[_unit] spawn fw_fnc_civPanicEH;
};
