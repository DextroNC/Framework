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
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 72];
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 24];
	_box addmagazinecargoGlobal ["SR_60Rnd_545x39_rpk", 30];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 8];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 20];
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 10];
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 10];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 10];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 3];
	_box addWeaponcargoGlobal ["BWA3_PzF3_Tandem_Loaded", 2];
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 2];
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
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 24];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
	_box addbackpackcargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
	_box addmagazinecargoGlobal ["BWA3_10Rnd_86x70_G29", 8];
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 6];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 36];
	_box addmagazinecargoGlobal ["SR_60Rnd_545x39_rpk", 15];
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 8];
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 15];
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 8];
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
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 2];
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 10];
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 8];
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 5];
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 2];
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	_box addbackpackcargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
};

// Medical Drop
If (_type == 7) then {
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 3];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];
};
