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
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 72];
	_box addmagazinecargoGlobal ["30Rnd_9x21_Mag", 12];
	_box addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 24];
	_box addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_ucp", 12];
    _box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 8];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 16];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 16];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 20];
	_box addWeaponCargoGlobal ["rhs_weap_m136_HEDP", 4];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 2];
	_box addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 6];
	_box addmagazinecargoGlobal ["rhs_mag_maaws_HE", 4];
	_box additemcargoGlobal ["HandGrenade", 8];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["rhs_mag_an_m8hc", 28];
	_box additemcargoGlobal ["rhs_mag_m18_green", 2];
	_box additemcargoGlobal ["rhs_mag_m18_red", 2];
	_box additemcargoGlobal ["SmokeShellBlue", 2];
	_box additemcargoGlobal ["SmokeShellOrange", 2];
	_box additemcargoGlobal ["ACE_Chemlight_HiGreen", 28];
	_box additemcargoGlobal ["ACE_Chemlight_HiRed", 8];
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
	_box addItemCargoGlobal ["CBRN_gasmaskFilter", 12];
};

// Vehicle Supply
if (_type == 2) then {

};

// Sierra Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m118_special_Mag", 10];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 4];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 2];
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 12];
	_box addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 8];
	_box additemcargoGlobal ["Laserbatteries", 2];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["tsp_popperCharge_auto_mag", 5];
	_box addmagazinecargoGlobal ["tsp_stickCharge_auto_mag", 2];
	_box addmagazinecargoGlobal ["tsp_frameCharge_mag", 1];
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 36];
	_box addmagazinecargoGlobal ["30Rnd_9x21_Mag", 6];
	_box addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_ucp", 6];
    _box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 8];
	_box addWeaponCargoGlobal ["rhs_weap_m136_HEDP", 2];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 1];
	_box additemcargoGlobal ["HandGrenade", 6];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["rhs_mag_an_m8hc", 16];
	_box additemcargoGlobal ["rhs_mag_m18_green", 2];
	_box additemcargoGlobal ["rhs_mag_m18_red", 2];
	_box additemcargoGlobal ["SmokeShellBlue", 2];
	_box additemcargoGlobal ["SmokeShellOrange", 2];
	_box additemcargoGlobal ["ACE_Chemlight_HiGreen", 16];
	_box additemcargoGlobal ["ACE_Chemlight_HiRed", 4];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_mag_mk84", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
	_box addItemCargoGlobal ["CBRN_gasmaskFilter", 6];
};

// Small Special Supply
if (_type == 5) then {
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 5];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 3];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 3];
	_box addmagazinecargoGlobal ["rhs_mag_maaws_HEAT", 6];
	_box addmagazinecargoGlobal ["rhs_mag_maaws_HE", 3];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
};

// Medical Drop
If (_type == 7) then {
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 3];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];
	_box addItemCargoGlobal ["CBRN_gasmaskFilter", 8];
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
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 4];
};
