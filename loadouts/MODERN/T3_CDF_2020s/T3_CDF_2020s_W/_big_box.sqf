if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK", 160];
	this addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 40];
    this addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 60];
    this addweaponcargoGlobal ["rhs_weap_rpg26", 20];
    this addweaponcargoGlobal ["rhs_weap_rshg2", 10];
	this addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
	this addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 10];
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