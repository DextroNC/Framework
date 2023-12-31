if(isServer) then {
	clearweaponcargoGlobal bigBox;
	clearmagazinecargoGlobal bigBox;
	clearitemcargoGlobal bigBox;
	clearBackpackCargoGlobal bigBox;
	bigBox addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	bigBox addmagazinecargoGlobal ["200Rnd_65x39_cased_Box", 60];
	bigBox addmagazinecargoGlobal ["130Rnd_338_Mag", 40];
    bigBox addmagazinecargoGlobal ["16Rnd_9x21_Mag", 60];
    bigBox addweaponcargoGlobal ["rhs_weap_M136", 20];
    bigBox addweaponcargoGlobal ["rhs_weap_m72a7", 10];
	bigBox addmagazinecargoGlobal ["MRAWS_HEAT_F", 20];
	bigBox addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	bigBox additemcargoGlobal ["rhsusf_m112x4_mag", 6];
	bigBox additemcargoGlobal ["rhsusf_m112_mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        bigBox additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Red", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Green", 40];
        bigBox additemcargoGlobal ["ACE_Chemlight_HiGreen", 40];
        bigBox additemcargoGlobal ["B_IR_Grenade", 40];
    };
};