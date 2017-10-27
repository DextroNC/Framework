/*
	Parameters:
		<-- Box as Object
		<-- Type as Integer
		
	Description:
	Holds the code and with that the Content for various Supply Boxes.
	Type 1: Infantry Supply (regular)
	Type 2: Vehicle Supply (only interesting for BAF)
	Type 3: Special Supply 

*/

// Parameter Init
params ["_box","_type"];
if (isNil "_type") then {_type = 1};

// Infantry Supply
if (_type == 1) then {
	clearweaponcargoGlobal _box;  
	clearmagazinecargoGlobal _box;  
	clearitemcargoGlobal _box; 
	clearBackpackCargoGlobal _box; 
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 80];  
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 12];  
	_box addmagazinecargoGlobal ["RH_15Rnd_9x19_M9", 16];  
	_box addmagazinecargoGlobal ["rhs_200rnd_556x45_M_SAW", 10];    
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];  
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 20]; 
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 20];  
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 20];  
	_box addmagazinecargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 10];  
	_box addmagazinecargoGlobal ["RH_20Rnd_57x28_FN", 2];  
	_box addmagazinecargoGlobal ["rhsusf_mag_40Rnd_46x30_JHP", 4];  
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 3];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HEDP", 6];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HE", 6];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 4];
	_box additemcargoGlobal ["HandGrenade", 12];  
	_box additemcargoGlobal ["SmokeShell", 24];  
	_box additemcargoGlobal ["SmokeShellGREEN", 12];
	_box additemcargoGlobal ["SmokeShellRed", 12];    
	_box additemcargoGlobal ["1Rnd_HE_Grenade_shell", 32];  
	_box additemcargoGlobal ["UGL_FlareWhite_F", 8];  
	_box additemcargoGlobal ["UGL_FlareRed_F", 8];  
	_box additemcargoGlobal ["1Rnd_Smoke_Grenade_shell", 16];
	_box additemcargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 8];
	_box additemcargoGlobal ["ACE_M84", 12];
	_box additemcargoGlobal ["B_IR_Grenade", 2];   
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 40];  
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 5];  
	_box addmagazinecargoGlobal ["UK3CB_BAF_9_17Rnd", 10];  
	_box addmagazinecargoGlobal ["UK3CB_BAF_556_200Rnd", 8];    
	_box addmagazinecargoGlobal ["UK3CB_BAF_556_100Rnd", 8];  
	_box addmagazinecargoGlobal ["UK3CB_BAF_556_100Rnd", 12]; 
	_box addmagazinecargoGlobal ["UK3CB_BAF_12G_Pellets", 5];  
	_box addmagazinecargoGlobal ["UK3CB_BAF_12G_Slugs", 5];  
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 12];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HEDP", 3];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HE", 3];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
	_box addWeaponcargoGlobal ["UK3CB_BAF_NLAW_Launcher", 1];
	_box additemcargoGlobal ["HandGrenade", 6];  
	_box additemcargoGlobal ["SmokeShell", 18];  
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];    
	_box additemcargoGlobal ["1Rnd_HE_Grenade_shell", 16];  
	_box additemcargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
	_box additemcargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 2];
	_box additemcargoGlobal ["ACE_HuntIR_M203", 1];
	_box additemcargoGlobal ["ACE_M84", 6];
	_box additemcargoGlobal ["B_IR_Grenade", 1];   
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
	_box additemcargoGlobal ["ACE_CableTie", 24];  
	_box additemcargoGlobal ["Laserbatteries", 2];  
	_box additemcargoGlobal ["B_UavTerminal", 1];  
	_box additemcargoGlobal ["ACE_IR_Strobe_Item", 12];  
	_box addItemCargoGlobal ["SR_PAK", 14];  
	_box addItemCargoGlobal ["SR_Bandage_Pack", 8];   
	_box addItemCargoGlobal ["SR_Medicine_Pack", 8];   
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 8];   
	_box addItemCargoGlobal ["SR_PAK", 8];  
	_box addItemCargoGlobal ["SR_Bandage_Pack", 5];   
	_box addItemCargoGlobal ["SR_Medicine_Pack", 5];   
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 5];   
};

// Vehicle Supply
if (_type == 2) then {
	clearweaponcargoGlobal _box;  
	clearmagazinecargoGlobal _box;  
	clearitemcargoGlobal _box; 
	clearBackpackCargoGlobal _box; 
	_box addmagazinecargoGlobal ["UK3CB_BAF_762_200Rnd", 12];   
	_box addmagazinecargoGlobal ["UK3CB_BAF_127_100Rnd", 10];   
};

// Special Supply
if (_type == 3) then {
	clearweaponcargoGlobal _box;  
	clearmagazinecargoGlobal _box;  
	clearitemcargoGlobal _box; 
	clearBackpackCargoGlobal _box; 
	_box addWeaponCargoGlobal ["UK3CB_BAF_M6",1];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 16];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 8];
};