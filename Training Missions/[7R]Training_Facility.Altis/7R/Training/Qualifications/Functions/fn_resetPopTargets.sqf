/*
	Parameters:
		<-- Targets as Array of Target-Objects

	Description:
		Pop-down Targets and Remove Eventhandlers

*/

// Parameter init
params ["_targets"];

// Remove all EH and pop-down targets
{
	{
		_x animate ["terc", 1];
		_x removeAllEventHandlers "hit";
		_x removeAllEventHandlers "HandleDamage";
		_x addEventHandler ["HandleDamage", {false}];
		_x setVariable ["SR_Hit",0];
	}forEach _x;
}forEach _targets;