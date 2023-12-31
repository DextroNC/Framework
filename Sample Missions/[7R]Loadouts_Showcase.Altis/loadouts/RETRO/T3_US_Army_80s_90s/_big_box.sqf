if(isServer) then {
	clearweaponcargoGlobal bigBox;
	clearmagazinecargoGlobal bigBox;
	clearitemcargoGlobal bigBox;
	clearBackpackCargoGlobal bigBox;
	bigBox addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	bigBox addmagazinecargoGlobal ["rhsusf_200rnd_556x45_M855_box", 60];
	bigBox addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
    bigBox addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 60];
    bigBox addweaponcargoGlobal ["rhs_weap_m136_HEDP", 20];
    bigBox addweaponcargoGlobal ["rhs_weap_m72a7", 10];
	bigBox addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 20];
	bigBox addmagazinecargoGlobal ["rhs_mag_maaws_HE", 10];
	bigBox additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	bigBox additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        bigBox additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Red", 40];
        bigBox additemcargoGlobal ["ACE_HandFlare_Green", 40];
        bigBox additemcargoGlobal ["Chemlight_green", 40];
        bigBox additemcargoGlobal ["B_IR_Grenade", 40];
    };
};