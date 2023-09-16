/*
	Parameters:
		<-- Unit as Object
		
	Description:
		Applies a killed Eventhandler tracking civilian casualties.
		
	Example:
		nul = [_unit] spawn fw_fnc_civEventhandler;

*/

// Parameter Init
params ["_unit"];

// Killed Eventhandler
_unit addEventHandler ["Killed", {
	// Parameter Init
	params ["_dead"];

	// Find Killer and create info string
	private _killer = name (_dead getVariable ["ace_medical_lastDamageSource", objNull]);
	private _victim = name _dead;
	private _str = format [SR_CC + "<br/>" + _victim + " has been killed by " + _killer + "."];

	// Publish info string
	SR_CC = _str;
	publicVariable "SR_CC";
}]; 