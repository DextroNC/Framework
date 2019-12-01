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

// Supply Boxes
SR_SupplyBoxes = [["SR_Supply_Crate_Empty","Infantry Supplies",1,3],["ACE_Construction_Supplies","Fortification Supplies"],["SR_Explosives_Box_Empty","Special Weapons Supplies",3],["SR_Ammo_Box_Empty","Infantry Supplies 1 (Small)",4],["SR_Special_Box_Empty","Infantry Supplies 2 (Small)",5],["SR_Medical_Empty","Medical Supplies",7]];

// ======================================================================================
/*
	Support Asset Class Array
	SR_Support_Assets = ["ParaDropPlane1","ParaDropPlane2","SupplyDropPlane","CASPlane","ExfilHelicopter"];
	
	// Recommended Options
	ParaDropPlane1 & SupplyDropPlane - "RHS_C130J" (Default), "UK3CB_BAF_Hercules_C3" (BAF),"UK3CB_BAF_Hercules_C4" (German), "UK3CB_TKA_O_C130J" (Russian, USSR) 
	ParaDropPlane2 - "globemaster_c17" (Default)
	CASPlane - "JS_JC_FA18E" (Default, "RHS_A10" (Alternative US/NATO), "RHS_Su25SM_vvs" (Russian/USSR)
	ExfilHelicopter - "RHS_CH_47F" (Default), "UK3CB_BAF_Merlin_HC3_32_MTP" (BAF), "RHS_Mi8AMT_vvs" (Russian/USSR)

*/
SR_Support_Assets = ["RHS_C130J","globemaster_c17","RHS_C130J","JS_JC_FA18E","RHS_CH_47F"];

// Vehicle Supply Drop Setup [Display Name, Vehicle Class, Loadout Number]
SR_Vehicle_Drop = [["Quad","B_Quadbike_01_F",0]];

// ======================================================================================
/*
	Recommended if desired:
	- SupplyDropAmmo = 12;
	- CASCallAmmo = 6;
	- ArtilleryCallAmmo 45;
	- ace_trenches_trenchSupplies = 250; (Trench Supply Drop gives 250 as well)
*/
// Support System Availability Variables
ExfilHelolock = false;
ReifLock = false;
SupplyDropAmmo = 12;
ArtilleryCallAmmo = 45;
CASCallAmmo = 6;
ace_trenches_trenchSupplies = 250;


// ======================================================================================

// Additional Variable Init for Mission Triggers
phase = 0;