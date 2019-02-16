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
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 48];  
	_box addmagazinecargoGlobal ["RH_15Rnd_9x19_M9", 16];  
	_box addmagazinecargoGlobal ["rhs_200rnd_556x45_M_SAW", 10];    
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 10]; 
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_00Buck", 7];  
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_Slug", 7];  
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 10];  
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 4];  
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
	_box addWeaponcargoGlobal ["rhs_weap_m72a7", 1];
	_box additemcargoGlobal ["HandGrenade", 6];  
	_box additemcargoGlobal ["SmokeShell", 28];  
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];  
	_box additemcargoGlobal ["SmokeShellBlue", 2];    
	_box additemcargoGlobal ["SmokeShellOrange", 2];      
	_box additemcargoGlobal ["SR_HE_Pack", 4];  
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_mk84", 6];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
	_box additemcargoGlobal ["ACE_CableTie", 24];  
	_box additemcargoGlobal ["Laserbatteries", 2];   
	_box addItemCargoGlobal ["SR_PAK", 10];  
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