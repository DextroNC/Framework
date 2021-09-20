if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 80];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 10];
	this addmagazinecargoGlobal ["rhs_mag_maaws_HE", 10];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 20];
	this additemcargoGlobal ["rhsusf_m112x4_mag", 6];
	this additemcargoGlobal ["rhsusf_m112_mag", 12];
};
