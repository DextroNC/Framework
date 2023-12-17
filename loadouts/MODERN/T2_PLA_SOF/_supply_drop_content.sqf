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
	_box addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 10];
	_box addmagazinecargoGlobal ["tsp_stickCharge_auto_mag", 2];
	_box addmagazinecargoGlobal ["tsp_frameCharge_mag", 1];
	_box addmagazinecargoGlobal ["30Rnd_580x42_Mag_F", 90];
	_box addmagazinecargoGlobal ["50Rnd_570x28_SMG_03", 10];
	_box addmagazinecargoGlobal ["16Rnd_9x21_Mag", 24];
	_box addmagazinecargoGlobal ["100Rnd_580x42_Mag_F", 40];
    _box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR_green", 8];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 16];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 16];
	_box addmagazinecargoGlobal ["30Rnd_762x39_AK12_Mag_F", 20];
	_box addmagazinecargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 20];
	_box addWeaponCargoGlobal ["rhs_weap_M136", 4];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 2];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 6];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 4];
	_box additemcargoGlobal ["HandGrenade", 8];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["SmokeShell", 28];
	_box additemcargoGlobal ["SmokeShellGreen", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];
	_box additemcargoGlobal ["SmokeShellBlue", 2];
	_box additemcargoGlobal ["SmokeShellOrange", 2];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_mk84", 10];
	_box additemcargoGlobal ["rhsusf_m112x4_mag", 2];
	_box additemcargoGlobal ["rhsusf_m112_mag", 4];
	_box additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
	_box additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
	_box additemcargoGlobal ["Laserbatteries", 2];
	_box addItemCargoGlobal ["SR_PAK", 10];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 5];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 5];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 5];
};

// Vehicle Supply
if (_type == 2) then {

};

// Sierra Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_300winmag_xm2010", 10];
	_box addmagazinecargoGlobal ["5Rnd_127x108_Mag", 4];
	_box addmagazinecargoGlobal ["5Rnd_127x108_APDS_Mag", 2];
	_box addmagazinecargoGlobal ["30Rnd_580x42_Mag_F", 12];
	_box addmagazinecargoGlobal ["16Rnd_9x21_Mag", 8];
	_box additemcargoGlobal ["Laserbatteries", 2];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 5];
	_box addmagazinecargoGlobal ["tsp_stickCharge_auto_mag", 2];
	_box addmagazinecargoGlobal ["tsp_frameCharge_mag", 1];
	_box addmagazinecargoGlobal ["30Rnd_580x42_Mag_F", 36];
	_box addmagazinecargoGlobal ["50Rnd_570x28_SMG_03", 12];
	_box addmagazinecargoGlobal ["100Rnd_580x42_Mag_F", 6];
    _box addmagazinecargoGlobal ["30Rnd_762x39_AK12_Mag_F", 10];
	_box addmagazinecargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 20];
	_box addmagazinecargoGlobal ["16Rnd_9x21_Mag", 8];
	_box addWeaponCargoGlobal ["rhs_weap_M136", 2];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 1];
	_box additemcargoGlobal ["HandGrenade", 6];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["SmokeShell", 16];
	_box additemcargoGlobal ["SmokeShellGreen", 2];
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
};

// Small Special Supply
if (_type == 5) then {
	_box addmagazinecargoGlobal ["30Rnd_762x39_AK12_Mag_F", 5];
	_box addmagazinecargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR_green", 5];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 3];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 3];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 6];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box additemcargoGlobal ["rhsusf_m112_mag", 2];
	_box additemcargoGlobal ["rhsusf_m112x4_mag", 1];
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
	_box addWeaponcargoGlobal ["Titan_AT", 4];
};
