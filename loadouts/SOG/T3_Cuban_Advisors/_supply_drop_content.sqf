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
	_box addmagazinecargoGlobal ["vn_type56_mag", 72];
	_box addmagazinecargoGlobal ["vn_ppsh41_35_mag", 54];
	_box addmagazinecargoGlobal ["vn_tt33_mag", 24];
	_box addmagazinecargoGlobal ["vn_rpd_125_mag", 24];
    _box addmagazinecargoGlobal ["vn_pk_100_mag", 8];
	_box addmagazinecargoGlobal ["vn_m1897_buck_mag", 30];
	_box addmagazinecargoGlobal ["vn_m1897_fl_mag", 30];
	_box addmagazinecargoGlobal ["vn_l1a1_20_mag", 20];
	_box addmagazinecargoGlobal ["vn_svd_mag", 15];
	_box addWeaponCargoGlobal ["rhs_weap_rpg18", 4];
	_box addWeaponCargoGlobal ["rhs_weap_rpg18", 2];
	_box addmagazinecargoGlobal ["vn_rpg2_mag", 10];
	_box additemcargoGlobal ["vn_f1_grenade_mag", 8];
	_box additemcargoGlobal ["vn_v40_grenade_mag", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 28];
	_box additemcargoGlobal ["rhs_mag_nspn_green", 2];
	_box additemcargoGlobal ["rhs_mag_nspn_red", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_black", 2];
	_box additemcargoGlobal ["rhs_mag_nspd", 2];
	_box additemcargoGlobal ["ACE_HandFlare_Green", 28];
	_box additemcargoGlobal ["ACE_HandFlare_Red", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["vn_f1_grenade_mag", 10];
	_box additemcargoGlobal ["vn_mine_satchel_remote_02_mag", 2];
	_box additemcargoGlobal ["vn_mine_m112_remote_mag", 4];
	_box additemcargoGlobal ["vn_mine_tm57_mag", 4];
	_box additemcargoGlobal ["vn_mine_tripwire_f1_04_mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
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
	_box addmagazinecargoGlobal ["vn_svd_mag", 10];
	_box addmagazinecargoGlobal ["vn_type56_mag", 12];
	_box addmagazinecargoGlobal ["vn_tt33_mag", 8];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["vn_type56_mag", 36];
	_box addmagazinecargoGlobal ["vn_ppsh41_35_mag", 27];
	_box addmagazinecargoGlobal ["vn_rpd_125_mag", 12];
    _box addmagazinecargoGlobal ["vn_l1a1_20_mag", 8];
	_box addmagazinecargoGlobal ["vn_tt33_mag", 8];
	_box addWeaponCargoGlobal ["rhs_weap_rpg18", 2];
	_box addWeaponCargoGlobal ["rhs_weap_rpg18", 1];
	_box additemcargoGlobal ["vn_f1_grenade_mag", 6];
	_box additemcargoGlobal ["vn_v40_grenade_mag", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 16];
	_box additemcargoGlobal ["rhs_mag_nspn_green", 2];
	_box additemcargoGlobal ["rhs_mag_nspn_red", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_black", 2];
	_box additemcargoGlobal ["rhs_mag_nspd", 2];
	_box additemcargoGlobal ["ACE_HandFlare_Green", 16];
	_box additemcargoGlobal ["ACE_HandFlare_Red", 4];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["vn_f1_grenade_mag", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addmagazinecargoGlobal ["vn_l1a1_20_mag", 8];
	_box addmagazinecargoGlobal ["vn_ppsh41_35_mag", 9];
	_box addmagazinecargoGlobal ["vn_pk_100_mag", 5];
	_box addmagazinecargoGlobal ["vn_m1897_buck_mag", 15];
	_box addmagazinecargoGlobal ["vn_m1897_fl_mag", 15];
	_box addmagazinecargoGlobal ["vn_rpg2_mag", 9];
	_box additemcargoGlobal ["vn_mine_m112_remote_mag", 2];
	_box additemcargoGlobal ["vn_mine_satchel_remote_02_mag", 1];
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
    if (SR_Night) then {};
};

// HAT Supply Drop
If (_type == 9) then {
};
