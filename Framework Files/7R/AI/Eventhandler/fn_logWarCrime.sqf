/*
	Parameters:
		<-- Entry as String
	

	Description:
		Appends an entry to the war crimes debriefing section (SR_WC) and publishes it.
		Server only, so entries logged on the server and the HC at the same time cannot overwrite each other.
		
	Example:
		[_str] remoteExecCall ["fw_fnc_logWarCrime", 2];

*/

// Parameter Init
params ["_entry"];

// Server Only Exec
if (!isServer) exitWith {};

// Publish info string
SR_WC = SR_WC + "<br/>" + _entry;
publicVariable "SR_WC";