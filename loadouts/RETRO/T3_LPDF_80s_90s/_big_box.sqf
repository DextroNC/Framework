if(isServer) then {
	clearweaponcargoGlobal bigBox;
	clearmagazinecargoGlobal bigBox;
	clearitemcargoGlobal bigBox;
	clearBackpackCargoGlobal bigBox;
	bigBox addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK_mixed", 40];
	bigBox addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
	bigBox addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 10];
	bigBox addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 5];
	bigBox addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	bigBox addWeaponcargoGlobal ["rhs_weap_rpg18", 20];
	bigBox addWeaponcargoGlobal ["rhs_weap_rshg2", 10];
	bigBox additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	bigBox additemcargoGlobal ["rhs_ec400_mag", 12];
	if (isNil "SR_Night") then {SR_Night = false};s
};
