if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_mixed_soft_pouch", 40];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this addWeaponcargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher", 20];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
	this additemcargoGlobal ["B_UavTerminal", 12];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    };
};
