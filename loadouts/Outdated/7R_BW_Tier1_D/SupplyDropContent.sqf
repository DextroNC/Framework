/*
	Parameters:
		<-- Box as Object
		<-- Type as Integer
	
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
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 40];  
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 5];  
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 10];  
	_box addmagazinecargoGlobal ["rhs_200rnd_556x45_M_SAW", 8];    
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 8];  
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 12]; 
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 12];  
	_box addmagazinecargoGlobal ["rhsusf_mag_40Rnd_46x30_FMJ", 20];  
	_box addmagazinecargoGlobal ["rhsusf_10Rnd_762x51_m118_special_Mag", 6];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HEDP", 3];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HE", 3];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_300winmag_xm2010", 4];
	_box addWeaponcargoGlobal ["BWA3_RGW90", 2];
	_box addWeaponcargoGlobal ["BWA3_Pzf3", 1];
	_box additemcargoGlobal ["HandGrenade", 6];  
	_box additemcargoGlobal ["SmokeShell", 28];  
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];  
	_box additemcargoGlobal ["SmokeShellBlue", 2];    
	_box additemcargoGlobal ["SmokeShellOrange", 2];      
	_box additemcargoGlobal ["SR_HE_Pack", 4];  
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["ACE_HuntIR_M203", 1];
	_box additemcargoGlobal ["rhs_mag_mk84", 6];
	_box additemcargoGlobal ["B_IR_Grenade", 1];   
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
	_box additemcargoGlobal ["ACE_CableTie", 24];  
	_box additemcargoGlobal ["Laserbatteries", 2];  
	_box additemcargoGlobal ["B_UavTerminal", 1];  
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
};

// Special Supply
if (_type == 3) then {
	clearweaponcargoGlobal _box;  
	clearmagazinecargoGlobal _box;  
	clearitemcargoGlobal _box; 
	clearBackpackCargoGlobal _box; 
};