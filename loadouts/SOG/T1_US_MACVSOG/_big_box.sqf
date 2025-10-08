if(isServer) then {
	clearweaponcargoGlobal this;
	clearmagazinecargoGlobal this;
	clearitemcargoGlobal this;
	clearBackpackCargoGlobal this;
	this addmagazinecargoGlobal ["vn_rpd_125_mag", 60];
	this addmagazinecargoGlobal ["vn_m60_100_mag", 40];
    this addmagazinecargoGlobal ["vn_hp_mag", 60];
    this addWeaponWithAttachmentsCargoGlobal [["vn_m72","","","",["vn_m72_mag",1],[],""], 20];
    this addWeaponWithAttachmentsCargoGlobal [["vn_m72","","","",["vn_m72_mag",1],[],""], 10];
	this addmagazinecargoGlobal ["vn_rpg2_mag", 20];
	this addmagazinecargoGlobal ["vn_rpg2_mag", 10];
	this additemcargoGlobal ["vn_mine_satchel_remote_02_mag", 6];
	this additemcargoGlobal ["vn_mine_m112_remote_mag", 12];
    
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
        this additemcargoGlobal ["ACE_IR_Strobe_Item", 40];
        this additemcargoGlobal ["ACE_HandFlare_Red", 40];
        this additemcargoGlobal ["ACE_HandFlare_Green", 40];
        this additemcargoGlobal ["ACE_HandFlare_Green", 40];
        this additemcargoGlobal ["B_IR_Grenade", 40];
    };
};