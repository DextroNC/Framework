if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["UK3CB_RPK_75Rnd_Drum", 60];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	this addweaponcargoGlobal ["rhs_weap_rpg26", 10];
	this addweaponcargoGlobal ["rhs_weap_rshg2", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};
