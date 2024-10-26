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
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 72];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 24];
	_box addmagazinecargoGlobal ["UK3CB_Bren_30Rnd_762x51_Magazine_RT", 36];
	_box addmagazinecargoGlobal ["UK3CB_Sten_34Rnd_Magazine", 36];
    _box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 8];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 16];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 16];
	_box addmagazinecargoGlobal ["uk3cb_l42_enfield_762_10Rnd_magazine", 20];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 6];
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
	_box addmagazinecargoGlobal ["uk3cb_l42_enfield_762_10Rnd_magazine", 10];
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_M193_Stanag", 12];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 8];
	_box additemcargoGlobal ["Laserbatteries", 2];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 36];
	_box addmagazinecargoGlobal ["UK3CB_Bren_30Rnd_762x51_Magazine_RT", 18];
	_box addmagazinecargoGlobal ["UK3CB_Sten_34Rnd_Magazine", 18];
    _box addmagazinecargoGlobal ["uk3cb_l42_enfield_762_10Rnd_magazine", 8];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 8];
	_box addWeaponCargoGlobal ["rhs_weap_m72a7", 2];
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
	_box addmagazinecargoGlobal ["uk3cb_l42_enfield_762_10Rnd_magazine", 8];
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
	_box addBackpackCargoGlobal ["rhs_Tow_Gun_Bag", 1];
	_box addBackpackCargoGlobal ["rhs_TOW_Tripod_Bag", 1];
};
