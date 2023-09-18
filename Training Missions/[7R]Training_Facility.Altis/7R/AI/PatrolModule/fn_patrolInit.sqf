/*
	Parameters:
		<-- None
		
	Description:
		Initialises Variable required for Patrol Script in preInit
		
*/

// Server Only Exec
if (!isServer) exitWith {};

// Variable Init (DO NOT CHANGE)
SR_PatrolUnits = []; 
SR_ArtilleryCooldown = false;

// Variable Init (TO EDIT)
SR_Debug = false;
SR_Flee = 10;
SR_Surrender = 15;
SR_Charge = 10;
SR_RAMPAGE_DISTANCE = 2000;
