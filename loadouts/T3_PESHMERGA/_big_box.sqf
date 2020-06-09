if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["SR_60Rnd_545x39_rpk", 40];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	this addWeaponcargoGlobal ["BWA3_PzF3_Tandem_Loaded", 20];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};
