/*
	Info:
	Parameters regulate available Support Options.

*/

// Mission Parameter

// Unit Cap (cap of AI)
SR_Unit_Cap = 250;
SR_AI_removeNVG = false;
SR_AI_addFlashlight = false;

// Night Mission (true/false)
SR_Night = false;
SR_Camo_Coef = 0.75; // for Night Missions, default: 0.75

// First GasMask Equip give Atropine (true/false)
ace_medical_poisonKit = true;
ace_medical_gasMask = "Mask_M50";


// ======================================================================================
/*
	Recommended if desired:
	- SupplyDropAmmo = 6;
	- CASCallAmmo = 6;
	- ArtilleryCallAmmo 45;
	- ace_trenches_trenchSupplies = 100; (Trench Supply Drop gives 100 as well)
*/
// Support System Availability Variables
ExfilHelolock = false;
ReifLock = false;
SupplyDropAmmo = 6;
ArtilleryCallAmmo = 0;
CASCallAmmo = 0;
UAV_Ammo = 0;
ace_trenches_trenchSupplies = 0;


// ======================================================================================

// Additional Variable Init for Mission Triggers
phase = 0;
start = false;
end = false;
bridge = false;
town = false;
mortar = false;
airfield = false;