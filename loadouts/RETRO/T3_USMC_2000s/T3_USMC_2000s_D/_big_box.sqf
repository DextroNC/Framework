if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch_coyote", 60];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
    this addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 60];
    this addweaponcargoGlobal ["rhs_weap_m136_HEDP", 20];
    this addweaponcargoGlobal ["rhs_weap_m72a7", 10];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 20];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HE", 10];
	this additemcargoGlobal ["rhsusf_m112x4_mag", 6];
	this additemcargoGlobal ["rhsusf_m112_mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        this additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        this additemcargoGlobal ["ACE_HandFlare_Red", 40];
        this additemcargoGlobal ["ACE_HandFlare_Green", 40];
        this additemcargoGlobal ["Chemlight_green", 40];
        this additemcargoGlobal ["B_IR_Grenade", 40];
    };
};