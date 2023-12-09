/*
	Parameters:
		<-- Unit as Object
	

	Description:
		Applies a killed Eventhandler tracking waypointCompletionRadius crimes.
		
	Example:
		nul = [_unit] spawn fw_fnc_powKilledEH;

*/

// Parameter Init
params ["_unit"];

// Killed Eventhandler
private _index = _unit addEventHandler ["Killed", {
	// Parameter Init
	params ["_dead"];

	// Find Killer and create info string
	private _killer = name (_dead getVariable ["ace_medical_lastDamageSource", objNull]);

	// Check if player
	if (_killer in allPlayers) then {
		// Create String
		private _str = format [SR_WC + "<br/>" + (name _dead) + " has been killed by " + (name _killer) + "."];

		// Publish info string
		SR_WC = _str;
		publicVariable "SR_WC";
	};
}];