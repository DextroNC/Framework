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
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 72];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 24];
	_box addmagazinecargoGlobal ["UK3CB_BAF_762_100Rnd", 12];
	_box addmagazinecargoGlobal ["UK3CB_Bren_30Rnd_762x51_Magazine_W", 8];
	_box addmagazinecargoGlobal ["UK3CB_Sten_34Rnd_Magazine_W", 8];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 1];
	_box additemcargoGlobal ["rhs_grenade_mkii_mag", 8];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShell", 28];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellGREEN", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellRed", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellBlue", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellOrange", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];
	_box additemcargoGlobal ["ATMine_Range_Mag", 2];
	_box additemcargoGlobal ["APERSBoundingMine_Range_Mag", 4];
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
	_box addmagazinecargoGlobal ["UK3CB_Enfield_10rnd_Mag", 12];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 6];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 36];
	_box addmagazinecargoGlobal ["UK3CB_BAF_762_100Rnd", 6];
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_13Rnd", 8];
	_box additemcargoGlobal ["rhs_grenade_mkii_mag", 6];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShell", 16];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellGREEN", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellRed", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellBlue", 2];
	_box additemcargoGlobal ["UK3CB_BAF_SmokeShellOrange", 2];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 2];
	_box addmagazinecargoGlobal ["UK3CB_Bren_30Rnd_762x51_Magazine_W", 8];
	_box addmagazinecargoGlobal ["UK3CB_Sten_34Rnd_Magazine_W", 8];
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
	_box addWeaponcargoGlobal ["ace_dragon_super", 4];
};
