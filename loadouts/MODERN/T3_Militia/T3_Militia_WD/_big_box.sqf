if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK_mixed", 40];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 5];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
	this addWeaponcargoGlobal ["rhs_weap_rpg26", 20];
	this addWeaponcargoGlobal ["rhs_weap_rshg2", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["rhs_ec400_mag", 12];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    };
};
