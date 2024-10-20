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
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 72];
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag", 18];
	_box addmagazinecargoGlobal ["rhs_mag_762x25_8", 16];
	_box addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK_mixed", 40];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 8];
	_box addmagazinecargoGlobal ["ACE_2Rnd_12Gauge_Pellets_No4_Buck", 20];
	_box addmagazinecargoGlobal ["2Rnd_12Gauge_Slug", 20];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 20];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 1];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 2];
	_box addWeaponcargoGlobal ["rhs_weap_rpg26", 4];
	_box addWeaponcargoGlobal ["rhs_weap_rshg2", 2];
	_box additemcargoGlobal ["rhs_mag_f1", 8];
	_box additemcargoGlobal ["rhs_grenade_khattabka_vog17_mag", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 28];
	_box additemcargoGlobal ["rhs_mag_nspn_green", 2];
	_box additemcargoGlobal ["rhs_mag_nspn_red", 2];
	_box additemcargoGlobal ["rhs_mag_nspd", 2];
	_box additemcargoGlobal ["ACE_Chemlight_HiGreen", 28];
	_box additemcargoGlobal ["ACE_Chemlight_HiRed", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_plamyam", 10];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["rhs_ec400_mag", 4];
	_box additemcargoGlobal ["rhs_mine_tm62m_mag", 4];
	_box additemcargoGlobal ["APERSTripMine_Wire_Mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
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

// Sierra Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m118_special_Mag", 10];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 12];
	_box addmagazinecargoGlobal ["rhs_mag_762x25_8", 8];
	_box additemcargoGlobal ["Laserbatteries", 2];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 36];
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag", 9];
	_box addmagazinecargoGlobal ["rhs_60Rnd_545X39_7N10_AK_mixed", 6];
	_box addmagazinecargoGlobal ["rhs_mag_762x25_8", 8];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box additemcargoGlobal ["rhs_mag_f1", 6];
	_box additemcargoGlobal ["rhs_grenade_khattabka_vog17_mag", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 16];
	_box additemcargoGlobal ["rhs_mag_nspn_green", 2];
	_box additemcargoGlobal ["rhs_mag_nspn_red", 2];
	_box additemcargoGlobal ["rhs_mag_nspn_green", 2];
	_box additemcargoGlobal ["rhs_mag_nspd", 2];
	_box additemcargoGlobal ["ACE_Chemlight_HiGreen", 16];
	_box additemcargoGlobal ["ACE_Chemlight_HiRed", 4];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_mag_plamyam", 6];
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
	_box addWeaponcargoGlobal ["rhs_weap_rpg26", 2];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 10];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 5];
	_box addmagazinecargoGlobal ["ACE_2Rnd_12Gauge_Pellets_No4_Buck", 10];
	_box addmagazinecargoGlobal ["2Rnd_12Gauge_Slug", 10];
	_box addmagazinecargoGlobal ["RPG32_F", 2];
	_box addmagazinecargoGlobal ["RPG32_HE_F", 1];
	_box additemcargoGlobal ["rhs_ec400_mag", 2];
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
	_box addmagazinecargoGlobal ["Titan_AT", 4];
};
