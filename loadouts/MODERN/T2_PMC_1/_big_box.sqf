if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_coyote", 40];
	this addmagazinecargoGlobal ["UK3CB_MG3_100rnd_762x51_RM", 40];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this addWeaponcargoGlobal ["rhs_weap_M136_hedp", 20];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
	this additemcargoGlobal ["rhsusf_m112x4_mag", 6];
	this additemcargoGlobal ["rhsusf_m112_mag", 12];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    };
};
