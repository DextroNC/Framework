if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["UK3CB_MG3_50rnd_762x51_R", 40];
	this addmagazinecargoGlobal ["UK3CB_MG3_100rnd_762x51_R", 40];
	this addmagazinecargoGlobal ["UK3CB_MG3_250rnd_762x51_R", 40];
	this addmagazinecargoGlobal ["RPG32_F", 10];
	this addmagazinecargoGlobal ["RPG32_HE_F", 10];
	this addWeaponcargoGlobal ["BWA3_RGW90_Loaded", 20];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    };
};
