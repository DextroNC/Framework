if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["100Rnd_65x39_caseless_khaki_mag_tracer", 40];
	this addmagazinecargoGlobal ["130Rnd_338_Mag", 40];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this addWeaponcargoGlobal ["rhs_weap_M136_hedp", 20];
	this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 6];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 12];
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    this addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    this additemcargoGlobal ["ACE_HandFlare_Red", 40];
    this additemcargoGlobal ["ACE_HandFlare_Green", 40];
    this additemcargoGlobal ["ACE_Chemlight_HiRed", 40];
    this additemcargoGlobal ["B_IR_Grenade", 40];
    };
};
