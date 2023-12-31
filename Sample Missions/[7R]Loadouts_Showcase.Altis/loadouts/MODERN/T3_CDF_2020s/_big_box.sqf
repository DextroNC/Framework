if(isServer) then {
	clearweaponcargoGlobal bigBox;
	clearmagazinecargoGlobal bigBox;
	clearitemcargoGlobal bigBox;
	clearBackpackCargoGlobal bigBox;
	bigBox addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	bigBox addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK", 160];
	bigBox addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
    bigBox addmagazinecargoGlobal ["rhsusf_mag_17Rnd_9x19_FMJ", 60];
    bigBox addweaponcargoGlobal ["rhs_weap_rpg26", 20];
    bigBox addweaponcargoGlobal ["rhs_weap_rshg2", 10];
	bigBox addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
	bigBox addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	bigBox additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	bigBox additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        bigBox additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Red", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Green", 40];
        bigBox additemcargoGlobal ["ACE_Chemlight_HiGreen", 40];
        bigBox additemcargoGlobal ["B_IR_Grenade", 40];
    };
};