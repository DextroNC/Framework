if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhs_45Rnd_545X39_AK_Green", 60];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR_green", 40];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	this addweaponcargoGlobal ["rhs_weap_rpg18", 10];
	this additemcargoGlobal ["rhs_ec400_sand_mag", 6];
	this additemcargoGlobal ["rhs_ec200_sand_mag", 12];
	this addmagazinecargoGlobal ["Vorona_HE", 10];
	this addmagazinecargoGlobal ["Vorona_HEAT", 10];
};
