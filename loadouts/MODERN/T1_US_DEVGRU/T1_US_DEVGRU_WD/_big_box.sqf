if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch", 60];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 40];
    this addmagazinecargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 60];
    this addweaponcargoGlobal ["rhs_weap_M136", 20];
    this addweaponcargoGlobal ["rhs_weap_m72a7", 10];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 20];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
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