if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 60];
	this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 40];
    this addmagazinecargoGlobal ["11Rnd_45ACP_Mag", 60];
    this addWeaponWithAttachmentsCargoGlobal [["7r_weap_pzf3","","","",["7r_mag_dm12",1],[],""], 20];
    this addWeaponWithAttachmentsCargoGlobal [["7r_weap_pzf3_mp","","","",["7r_mag_dm32",1],[],""], 10];
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