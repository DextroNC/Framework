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
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull", 72];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 32];
	_box addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote", 12];
	_box addmagazinecargoGlobal ["rhs_mag_100Rnd_556x45_M855A1_cmag_mixed", 10];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 8];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 12];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 12];
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_SCAR_762x51_m80_ball", 14];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 1];
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
};

// Vehicle Supply
if (_type == 2) then {

};

// Special Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 2];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 1];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_AICS_m993_Mag", 2];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_AICS_m118_special_Mag", 6];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 6];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull", 36];
	_box addmagazinecargoGlobal ["rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote", 6];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 8];
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
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_SCAR_762x51_m80_ball", 8];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 5];
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
	_box addItemCargoGlobal ["SR_Atropine_Pack", 1];
};

// Mortar Supply Drop
If (_type == 8) then {
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 32];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
};

// HAT Supply Drop
If (_type == 9) then {
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 4];
};