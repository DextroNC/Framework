if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["UK3CB_Bren_30Rnd_762x51_Magazine_W", 40];
	this addmagazinecargoGlobal ["UK3CB_BAF_762_100Rnd", 40];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};