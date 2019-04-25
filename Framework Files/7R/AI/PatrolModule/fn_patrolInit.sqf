/*
	Parameters:
		<-- None
		
	Description:
		Initialises Variable required for Patrol Script in preInit
		
*/

// Server Only Exec
if (!isServer) exitWith {};

// Variable Init
SR_PatrolUnits = []; 
SR_Debug = true;
SR_Flee = 10;
SR_Surrender = 10;
SR_Charge = 10;
SR_RAMPAGE_DISTANCE = 2000;