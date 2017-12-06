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
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_AK_no_tracers", 40];  
	_box addmagazinecargoGlobal ["rhs_30Rnd_545x39_AK_green", 5];  
	_box addmagazinecargoGlobal ["rhs_30Rnd_762x39mm", 12];  
	_box addmagazinecargoGlobal ["rhs_mag_9x18_8_57N181S", 10];  
	_box addmagazinecargoGlobal ["SR_60Rnd_545x39_rpk", 40];    
	_box addmagazinecargoGlobal ["rhs_100Rnd_762x54mmR", 12]; 
	_box addmagazinecargoGlobal ["rhs_mag_9x19mm_7n21_20", 4];  
	_box addmagazinecargoGlobal ["rhs_20rnd_9x39mm_SP5", 12]	
	_box addmagazinecargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 8];  
	_box addmagazinecargoGlobal ["rhs_5Rnd_338lapua_t5000", 4];  
	_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 4];  
	_box addmagazinecargoGlobal ["rhs_rpg7_OG7V_mag", 3];
	_box addWeaponcargoGlobal ["rhs_weap_rpg26", 3];
	_box additemcargoGlobal ["rhs_mag_rgd5", 6];  
	_box additemcargoGlobal ["SmokeShell", 28];  
	_box additemcargoGlobal ["SmokeShellGREEN", 2];
	_box additemcargoGlobal ["SmokeShellRed", 2];  
	_box additemcargoGlobal ["SmokeShellBlue", 2];    
	_box additemcargoGlobal ["SmokeShellOrange", 2]; 
	_box addmagazinecargoGlobal ["rhs_VOG25", 16];  
	_box addmagazinecargoGlobal ["rhs_GRD40_White", 8];  
	_box addmagazinecargoGlobal ["rhs_GRD40_Red", 8];  
	_box addmagazinecargoGlobal ["rhs_VG40OP_white", 8];  
	_box addmagazinecargoGlobal ["rhs_VG40OP_red", 4];  
	_box additemcargoGlobal ["ACE_M84", 6];
	_box additemcargoGlobal ["O_IR_Grenade", 1];   
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
	_box additemcargoGlobal ["ACE_CableTie", 24];  
	_box additemcargoGlobal ["Laserbatteries", 2];  
	_box additemcargoGlobal ["O_UavTerminal", 1];  
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