/*
	Parameters:
		<-- Unit as Object

		
	Description:
		Applies a killed Eventhandler tracking civilian casualties.
		
	Example:
		nul = [_unit] spawn fw_fnc_civKilledEH;

*/

// Parameter Init
params ["_unit"];

// Killed Eventhandler
_unit addEventHandler ["Killed", {
	// Parameter Init
	params ["_dead"];

	// Find Killer and create info string
	private _killer = (_dead getVariable ["ace_medical_lastDamageSource", objNull]);

	// Check if player
	if (_killer in allPlayers) then {
	
	// Create String
	private _str = format [SR_CC + "<br/>" + name (_dead) + " has been killed by " + (name _killer) + "."];

	// Publish info string
	SR_CC = _str;
	publicVariable "SR_CC";

	};
}];