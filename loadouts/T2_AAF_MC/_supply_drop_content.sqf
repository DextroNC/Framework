/*
	Parameters:
		<-- Box as Object
		<-- Type as Integer

*/

// Parameter Init
params ["_box",["_type",0]];

// Clear Box
clearweaponcargoGlobal _box;
clearmagazinecargoGlobal _box;
clearitemcargoGlobal _box;
clearBackpackCargoGlobal _box;

// Infantry Supply
if (_type == 1) then {
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull", 72];
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 36];
	_box addmagazinecargoGlobal ["UK3CB_BHP_9_13Rnd", 36];
	_box addmagazinecargoGlobal ["UK3CB_MG3_250rnd_762x51_R", 10];
	_box addmagazinecargoGlobal ["UK3CB_MG3_100rnd_762x51_R", 5];
	_box addmagazinecargoGlobal ["UK3CB_MG3_50rnd_762x51_R", 5];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 12];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 12];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 14];
	_box addmagazinecargoGlobal ["RPG32_F", 5];
	_box addmagazinecargoGlobal ["RPG32_HE_F", 3];
	_box addWeaponcargoGlobal ["BWA3_RGW90_Loaded", 2];
	_box additemcargoGlobal ["HandGrenade", 8];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["SmokeShell", 28];
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];
	_box additemcargoGlobal ["SmokeShellBlue", 2];
	_box additemcargoGlobal ["SmokeShellOrange", 2];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_mk84", 10];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];
	_box additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
	_box additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
	_box additemcargoGlobal ["Laserbatteries", 2];
	_box addItemCargoGlobal ["SR_PAK", 10];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 5];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 5];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 5];
	if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    _box addItemCargoGlobal ["ACE_IR_Strobe_Item", 50];
    };
};

// Vehicle Supply
if (_type == 2) then {

};

// Special Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["BWA3_10Rnd_86x70_G29", 8];
	_box additemcargoGlobal ["Laserbatteries", 2];
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 8];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull", 36];
	_box addmagazinecargoGlobal ["UK3CB_MG3_100rnd_762x51_R", 6];
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 8];
	_box addmagazinecargoGlobal ["UK3CB_BHP_9_13Rnd", 8];
	_box additemcargoGlobal ["HandGrenade", 6];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["SmokeShell", 16];
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];
	_box additemcargoGlobal ["SmokeShellBlue", 2];
	_box additemcargoGlobal ["SmokeShellOrange", 2];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_mag_mk84", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
	    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    _box addItemCargoGlobal ["ACE_IR_Strobe_Item", 25];
    };
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["BWA3_RGW90_Loaded", 2];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 3];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 3];
	_box addmagazinecargoGlobal ["RPG32_F", 2];
	_box addmagazinecargoGlobal ["RPG32_HE_F", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
};

// Medical Drop
If (_type == 7) then {
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 3];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];
};

// Mortar Supply Drop
If (_type == 8) then {
    if (isNil "SR_Night") then {SR_Night = false};
    if (SR_Night) then {
    _box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 20];
    _box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 10];
    _box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White", 10];
    }
     else {
    _box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 32];
    _box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
    };
};

// HAT Supply Drop
    If (_type == 9) then {
	_box addWeaponcargoGlobal ["Vorona_HEAT", 4];
	_box addbackpackcargoGlobal ["RHS_Kornet_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_Kornet_Tripod_Bag", 1];
    };
