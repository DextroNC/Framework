if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhsusf_200rnd_556x45_M855_mixed_box", 60];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
    this addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 60];
    this addweaponcargoGlobal ["rhs_weap_m136_HEDP", 20];
    this addweaponcargoGlobal ["rhs_weap_m72a7", 10];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 20];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HE", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        this additemcargoGlobal ["ACE_HandFlare_Red", 40];
        this additemcargoGlobal ["ACE_HandFlare_Green", 40];
        this additemcargoGlobal ["ACE_Chemlight_HiGreen", 40];
    };
};