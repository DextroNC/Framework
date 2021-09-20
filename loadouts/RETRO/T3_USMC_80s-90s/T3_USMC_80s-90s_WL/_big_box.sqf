if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhsusf_200rnd_556x45_mixed_box", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
	this addmagazinecargoGlobal ["rhs_mag_smaw_HEAA", 10];
	this addmagazinecargoGlobal ["rhs_mag_smaw_HEDP", 10];
	this addWeaponcargoGlobal ["rhs_weap_M136_hedp", 20];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
	this additemcargoGlobal ["rhsusf_m112x4_mag", 6];
	this additemcargoGlobal ["rhsusf_m112_mag", 12];
	this addBackpackCargoGlobal ["UK3CB_CW_US_B_LATE_B_RIF_02", 12];
};
