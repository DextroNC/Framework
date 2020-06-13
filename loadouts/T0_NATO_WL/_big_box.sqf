if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["100Rnd_65x39_caseless_black_mag", 40];
	this addmagazinecargoGlobal ["130Rnd_338_Mag", 40];
	this addmagazinecargoGlobal ["200Rnd_65x39_cased_Box", 40];
	this addWeaponcargoGlobal ["rhs_weap_M136_hedp", 20];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};
