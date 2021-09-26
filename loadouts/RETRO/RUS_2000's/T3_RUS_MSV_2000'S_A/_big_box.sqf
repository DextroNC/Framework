if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhs_45Rnd_545X39_7N22_AK", 60];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	this addweaponcargoGlobal ["rhs_weap_rpg26", 10];
	this addweaponcargoGlobal ["rhs_weap_rshg2", 10];
	this additemcargoGlobal ["rhs_ec400_mag", 6];
	this additemcargoGlobal ["rhs_ec200_mag", 12];
};
