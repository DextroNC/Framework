if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
	this addmagazinecargoGlobal ["RPG32_F", 10];
	this addmagazinecargoGlobal ["RPG32_HE_F", 10];
	this addweaponcargoGlobal ["rhs_weap_rpg26", 10];
	this addweaponcargoGlobal ["rhs_weap_rshg2", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};
