/*
	Parameters:
		<-- Unit as Object
		<-- Break as Boolean (default: true)

	Return:
	--> None

	Description:
		Makes a Unit surrender, stops surrendering if not enemies are close or too much time passed
		Callable on any machine: the ACE calls and the Killed EH are sent to where the unit is local, which is the HC for HC-spawned AI

	Example:
		[_unit] spawn fw_fnc_surrender;
*/
// Parameter Init
params ["_unit",["_break",true]];

// Surrender Unit
["ace_captives_setSurrendered", [_unit, true], [_unit]] call CBA_fnc_targetEvent;

// Set EH
[_unit] remoteExec ["fw_fnc_powKilledEH", _unit];

// If unit is handcuffed do nothing, else unsurrender after timer and continue fighting
if (_break) then {
	[
		// Condition
		{_this getVariable ["ace_captives_isHandcuffed", false]},
		// Statement
		{},
		// Args
		_unit,
		// Timeout
		random [30, 45, 60],
		// TimeoutCode, removing the EH on every machine since the unit may have changed owner since it was added
		{["ace_captives_setSurrendered", [_this, false], [_this]] call CBA_fnc_targetEvent; [_this, false] remoteExec ["fw_fnc_powKilledEH", 0]}
	] call CBA_fnc_waitUntilAndExecute;
};