/*
	Parameters:
		<-- Box as Object
		<-- Index as Integer

*/

// Parameter Init
params ["_box",["_index",0]];

switch (_index) do {
	// Helicopter Loadout - Loadout 1
	case 1: {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
		_box addItemCargoGlobal ["SR_PAK", 4];  
		_box additemcargoGlobal ["SmokeShellPurple", 4]; 
		_box additemcargoGlobal ["ACE_HandFlare_Green", 4]; 
	};
// Ground Vehicle Loadout - Loadout 2
	case 2: {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
		_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 4];  
		_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 1];
		_box additemcargoGlobal ["SR_PAK", 8];  
	};
// Armoured Vehicle Loadout - Loadout 3
	case 3: {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
		_box addItemCargoGlobal ["SR_PAK", 4];  
		_box additemcargoGlobal ["SmokeShellGreen", 4]; 
		_box additemcargoGlobal ["ACE_HandFlare_Green", 4]; 
	};
// Default Case (Fallback)
	default {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
	};
};
