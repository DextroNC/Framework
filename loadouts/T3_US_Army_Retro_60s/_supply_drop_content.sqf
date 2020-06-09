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
	_box addmagazinecargoGlobal ["UK3CB_M16_20Rnd_Mag", 144];
	_box addmagazinecargoGlobal ["rhsusf_mag_7x45acp_MHP", 36];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 22];
	_box addmagazinecargoGlobal ["rhsgref_30rnd_1143x23_M1911B_SMG", 12];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_00Buck", 12];
	_box addmagazinecargoGlobal ["rhsusf_8Rnd_Slug", 12];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 12];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 3];
	_box additemcargoGlobal ["rhs_grenade_mkii_mag", 8];
	_box additemcargoGlobal ["rhs_grenade_m15_mag", 2];
	_box additemcargoGlobal ["rhs_mag_an_m14_th3", 2];
	_box additemcargoGlobal ["rhs_mag_an_m8hc", 28];
	_box additemcargoGlobal ["rhs_mag_m18_purple", 4];
	_box additemcargoGlobal ["rhs_mag_m18_green", 2];
	_box additemcargoGlobal ["rhs_mag_m18_red", 2];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_grenade_mkiiia1_mag", 10];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];
	_box additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
	_box additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
	_box addItemCargoGlobal ["SR_PAK", 10];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 5];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 5];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 5];
};

// Vehicle Supply
if (_type == 2) then {

};

// Special Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 24];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 2];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 1];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m118_special_Mag", 6];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m993_Mag", 8];
	_box addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 6];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 72];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 12];
	_box addmagazinecargoGlobal ["rhsusf_mag_7x45acp_MHP", 16];
	_box additemcargoGlobal ["rhs_grenade_mkii_mag", 6];
	_box additemcargoGlobal ["rhs_mag_an_m8hc", 16];
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["rhs_mag_m18_green", 2];
	_box additemcargoGlobal ["rhs_mag_m18_red", 2];
	_box additemcargoGlobal ["rhs_mag_m18_purple", 2];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_grenade_mkiiia1_mag", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 2];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 10];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 3];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 3];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 2];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
};

// Medical Drop
If (_type == 7) then {
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 3];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];
};
