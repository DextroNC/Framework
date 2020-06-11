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
	_box addmagazinecargoGlobal ["30Rnd_65x39_caseless_black_mag", 72];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 32];
	_box addmagazinecargoGlobal ["100Rnd_65x39_caseless_black_mag", 12];
	_box addmagazinecargoGlobal ["200Rnd_65x39_cased_Box", 10];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 10];
	_box addmagazinecargoGlobal ["130Rnd_338_Mag", 10];
	_box addmagazinecargoGlobal ["16Rnd_9x21_Mag", 10];
	_box addmagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 10];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
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
	_box addmagazinecargoGlobal ["30Rnd_65x39_caseless_black_mag", 20];
	_box addmagazinecargoGlobal ["7Rnd_408_Mag", 10];
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 2];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 6];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["30Rnd_65x39_caseless_black_mag", 36];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 18];
	_box addmagazinecargoGlobal ["100Rnd_65x39_caseless_black_mag", 6];
	_box addmagazinecargoGlobal ["200Rnd_65x39_cased_Box", 5];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 5];
	_box addmagazinecargoGlobal ["130Rnd_338_Mag", 5];
	_box addmagazinecargoGlobal ["16Rnd_9x21_Mag", 5];
	_box addmagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 5];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 2];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 1];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 1];
	_box additemcargoGlobal ["HandGrenade", 4];
	_box additemcargoGlobal ["MiniGrenade", 1];
	_box additemcargoGlobal ["SmokeShell", 14];
	_box additemcargoGlobal ["SmokeShellGREEN", 1];
	_box additemcargoGlobal ["SmokeShellRed", 1];
	_box additemcargoGlobal ["SmokeShellBlue", 1];
	_box additemcargoGlobal ["SmokeShellOrange", 1];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 2];
	_box additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 2];
	_box additemcargoGlobal ["ACE_CableTie", 12];
	_box additemcargoGlobal ["Laserbatteries", 1];
	_box addItemCargoGlobal ["SR_PAK", 5];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addmagazinecargoGlobal ["30Rnd_65x39_caseless_black_mag", 10];
	_box addmagazinecargoGlobal ["7Rnd_408_Mag", 5];
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 1];
	_box addmagazinecargoGlobal ["9Rnd_45ACP_Mag", 3];
};

// Medical Drop
If (_type == 7) then {
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 3];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];
};
