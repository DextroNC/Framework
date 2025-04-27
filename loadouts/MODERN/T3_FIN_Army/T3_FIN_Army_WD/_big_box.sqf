if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 60];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
    this addmagazinecargoGlobal ["rhsusf_mag_17Rnd_9x19_FMJ", 60];
    this addweaponcargoGlobal ["rhs_weap_m72a7", 20];
    this addweaponcargoGlobal ["launch_NLAW_F", 10];
	this addmagazinecargoGlobal ["MRAWS_HEAT_F", 20];
	this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
	this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
	this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        this additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        this additemcargoGlobal ["ACE_HandFlare_Red", 40];
        this additemcargoGlobal ["ACE_HandFlare_Green", 40];
        this additemcargoGlobal ["ACE_Chemlight_HiGreen", 40];
        this additemcargoGlobal ["B_IR_Grenade", 40];
    };
};