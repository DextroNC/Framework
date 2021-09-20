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
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_7N22_AK", 72];
	_box addmagazinecargoGlobal ["RH_17Rnd_9x19_g17", 24];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 20];
	_box addmagazinecargoGlobal ["rhs_18rnd_9x21mm_7N28", 5];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm_polymer_89", 18];
	_box addmagazinecargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 10];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_Slug", 5];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_00Buck", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 3];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 2];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 3];
	_box addWeaponcargoGlobal ["rhs_weap_rpg26", 2];
	_box addWeaponcargoGlobal ["rhs_weap_rshg2", 1];
	_box additemcargoGlobal ["rhs_mag_rgd5", 8];
	_box additemcargoGlobal ["rhsgref_mag_rkg3em", 4];
	_box additemcargoGlobal ["rhs_mag_rgn", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 28];
	_box additemcargoGlobal ["rhs_mag_nspd", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_plamyam", 10];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];
	_box additemcargoGlobal ["rhs_mine_tm62m_mag", 4];
	_box additemcargoGlobal ["APERSTripMine_Wire_Mag", 4];
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
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 8];
	_box addmagazinecargoGlobal ["RH_17Rnd_9x19_g17", 5];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 3];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 5];
	_box additemcargoGlobal ["Laserbatteries", 2];
};


// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_7N22_AK", 36];
	_box addmagazinecargoGlobal ["RH_17Rnd_9x19_g17", 8];
	_box additemcargoGlobal ["rhs_mag_rgd5", 6];
	_box additemcargoGlobal ["rhs_mag_rgn", 2];
	_box additemcargoGlobal ["rhs_mag_rdg2_white", 16];
	_box additemcargoGlobal ["rhs_mag_nspd", 8];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_mag_plamyam", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_rpg26", 2];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm_polymer_89", 10];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 8];
	_box addmagazinecargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 5];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_Slug", 5];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_00Buck", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 2];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
	_box addbackpackcargoGlobal ["RHS_Kornet_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_Kornet_Tripod_Bag", 1];
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
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 4];
	_box addbackpackcargoGlobal ["RHS_Kornet_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_Kornet_Tripod_Bag", 1];
};
