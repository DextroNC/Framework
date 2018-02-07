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
	_box addmagazinecargoGlobal ["RH_18Rnd_9x19_VP", 10];  
	_box addmagazinecargoGlobal ["150Rnd_556x45_Drum_Mag_F", 16];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 12]; 
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 12];  
	_box addmagazinecargoGlobal ["30Rnd_9x21_Mag", 6];  
	_box addmagazinecargoGlobal ["rhsusf_10Rnd_762x51_m118_special_Mag", 6];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HEDP", 3];  
	_box addmagazinecargoGlobal ["tf47_m3maaws_HE", 3];
	_box addWeaponcargoGlobal ["BWA3_Pzf3", 3];
	_box additemcargoGlobal ["HandGrenade", 6];  
	_box additemcargoGlobal ["SmokeShell", 28];  
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];  
	_box additemcargoGlobal ["SmokeShellBlue", 2];    
	_box additemcargoGlobal ["SmokeShellOrange", 2];      
	_box additemcargoGlobal ["SR_HE_Pack", 4];  
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["ACE_M84", 6];
	_box additemcargoGlobal ["B_IR_Grenade", 1];   
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
	_box additemcargoGlobal ["ACE_CableTie", 24];  
	_box additemcargoGlobal ["Laserbatteries", 2];  
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
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_81mm_Mo_Shells", 30];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_81mm_Mo_Smoke_White", 8];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_81mm_Mo_Flare_White", 8];
	
};