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
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_7N6M_AK", 72];
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 24];
	_box addmagazinecargoGlobal ["UK3CB_AK47_45Rnd_Magazine_GT", 60];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR_green", 8];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm_bakelite", 18];
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 10];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 3];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 2];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 3];
	_box addWeaponcargoGlobal ["rhs_weap_rpg18", 2];
	_box additemcargoGlobal ["rhs_mag_rgd5", 8];
	_box additemcargoGlobal ["rhsgref_mag_rkg3em", 4];
	_box additemcargoGlobal ["rhs_mag_rgn", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 28];
	_box additemcargoGlobal ["rhs_mag_nspd", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_ec400_sand_mag", 2];
	_box additemcargoGlobal ["rhs_ec200_sand_mag", 4];
	_box additemcargoGlobal ["rhs_mine_tm62m_mag", 4];
	_box additemcargoGlobal ["APERSTripMine_Wire_Mag", 4];
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
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 8];
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 5];
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_7N6M_AK", 12];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_7N6M_AK", 36];
	_box addmagazinecargoGlobal ["UK3CB_AK47_45Rnd_Magazine_GT", 25];
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 8];
	_box additemcargoGlobal ["rhs_mag_rgd5", 6];
	_box additemcargoGlobal ["rhs_mag_rgn", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 16];
	_box additemcargoGlobal ["rhs_mag_nspd", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_rpg18", 2];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm_bakelite", 10];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR_green", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 2];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 1];
	_box additemcargoGlobal ["rhs_ec200_sand_mag", 2];
	_box additemcargoGlobal ["rhs_ec400_sand_mag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
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
	_box addbackpackcargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
};