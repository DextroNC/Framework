/*
	Info:
	Parameters regulate available Support Options.

*/

// Mission Parameter

// Unit Cap (cap of AI)
SR_Unit_Cap = 200;
SR_AI_NVG = "";
SR_AI_removeNVG = false;
SR_AI_addFlashlight = false;
SR_AI_forceFlashlight = false;

// Night Mission (true/false)
SR_Night = false;
SR_Camo_Coef = 0.75; // for Night Missions, default: 0.75

// First GasMask Equip give Atropine (true/false)
ace_medical_poisonKit = true;
ace_medical_gasMask = "Mask_M50";


// ======================================================================================
/*
	Recommended if desired:
	- SupplyDropAmmo = 8;
	- CASCallAmmo = 6;
	- ArtilleryCallAmmo 45;
	- ace_trenches_trenchSupplies = 250; (Trench Supply Drop gives 250 as well)
*/
// Support System Availability Variables
ExfilHelolock = false;
ReifLock = false;
SupplyDropAmmo = 8;
ArtilleryCallAmmo = 0;
CASCallAmmo = 0;
ace_trenches_trenchSupplies = 250;


// ======================================================================================

// Additional Variable Init for Mission Triggers
phase = 0;