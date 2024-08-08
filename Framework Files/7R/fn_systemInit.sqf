/*
	Mission Parameters.
*/
SR_Unit_Cap = 200; // Maximum AI unit count, only change if absolutely necessary.

// Night mission settings
SR_AI_NVG = "";
SR_AI_removeNVG = false;
SR_AI_addFlashlight = false;
SR_AI_forceFlashlight = false; // Force AI to turn flashlight on.
SR_Night = false; // Set to 'true' when the mission is played entirely at night.
SR_Camo_Coef = 1; // For Night Missions, default: 1

// Respawn Management
SR_Respawn_Max = 600; // Maximum wait time for respawn.
SR_Wave_Size = 2; // Minimum players needed to start a respawn wave.
SR_Spawn_Height = 0; // Height above ground the player should respawn (for respawning on ships).

/*
	Available supply boxes.
    [Box Class, Display Name, Supply Loadout Number, Opt. Quantity Number (default:1)]
*/
SR_SupplyBoxes = [
 
    ["SR_Supply_Crate_Empty", "Infantry Supplies", 1, 3],
    ["ACE_Construction_Supplies", "Fortification Supplies"],
    ["SR_basic_Box_Empty", "Sniper Supplies", 3],
    ["SR_Explosives_Box_Empty", "Mortar Supplies", 8],
    ["SR_Special_Box_Empty", "HAT Supplies", 9],
    ["SR_Ammo_Box_Empty", "Infantry Supplies 1 (Small)", 4],
    ["SR_Special_Box_Empty", "Infantry Supplies 2 (Small)", 5],
    ["SR_Medical_Empty", "Medical Supplies", 7],
    ["SR_CSW_Supplies", "Crew Served Weapon Supplies", 10]
];

/*
	Support Asset Class Array.
    [Vehicle Class, Texture Array, Pylon Array]
*/
SR_Support_Assets = [
    /* ParaDropPlane */         "RHS_C130J", // Alternatives: "UK3CB_BAF_Hercules_C3" (BAF),"UK3CB_BAF_Hercules_C4" (German), "UK3CB_TKA_O_C130J" (Russian, USSR)
    /* SupplyDropPlane */       "RHS_C130J", // Alternatives: "UK3CB_BAF_Hercules_C3" (BAF), "UK3CB_BAF_Hercules_C4" (German), "UK3CB_TKA_O_C130J" (Russian, USSR)
    /* CASPlane */              "RHS_A10", // Alternatives: "RHS_Su25SM_vvs" (Russian/USSR)
    /* ExfilHelicopter */       "RHS_CH_47F", // Alternatives: "UK3CB_BAF_Merlin_HC3_32_MTP" (BAF), "RHS_Mi8AMT_vvs" (Russian/USSR)
    /* UAV*/                    "UK3CB_BAF_MQ9_Reaper_Generic" // Alternatives: "B_UAV_02_dynamicLoadout_F" / "UK3CB_BAF_MQ9_Reaper_Generic" (BLUEFOR), "rhs_pchela1t_vvs" (Russian/USSR), "O_UAV_02_dynamicLoadout_F" (OPFOR)
];
/*
    UAV alternativ syntax (for setPylonLoadout):
    [Vehicle Class, Pylon Array] 
    Example:
    ["B_UAV_02_dynamicLoadout_F",["PylonRack_3Rnd_ACE_Hellfire_AGM114K","PylonRack_3Rnd_ACE_Hellfire_AGM114N"]]

*/

/*
	Available vehicle drops.
    [Display Name, Vehicle Class, Vehicle Loadout Number, Texture Array]
*/
SR_Vehicle_Drop = [
    ["Quad", "B_Quadbike_01_F", 0]
];

/*
	Available support assets.
*/
SupplyDropAmmo = 12;
ArtilleryCallAmmo = 45;
CASCallAmmo = 6;
UAVCallAmmo = 3;
ace_trenches_trenchSupplies = 500;
