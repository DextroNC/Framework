if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhs_200rnd_556x45_M_SAW", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
	this addmagazinecargoGlobal ["UK3CB_MG3_100rnd_762x51_RM", 40];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this addWeaponcargoGlobal ["BWA3_PzF3_Tandem_Loaded", 20];
	this addWeaponcargoGlobal ["BWA3_RGW90_Loaded", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
	this additemcargoGlobal ["B_UavTerminal", 12];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
	this addItemCargoGlobal ["BWA3_optic_NSV600", 20];
	this addItemCargoGlobal ["BWA3_optic_IRV600", 20];
    };
};
