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
		_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 1];
		_box additemcargoGlobal ["SR_PAK", 4];  
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
		[_box,2] call ace_repair_fnc_addSpareParts;
	};
// Echo
	case 4: {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
		_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 1];
		_box additemcargoGlobal ["SR_PAK", 4];  
	};
// Default Case (Fallback)
	default {
		clearweaponcargoGlobal _box;  
		clearmagazinecargoGlobal _box;  
		clearitemcargoGlobal _box; 
		clearBackpackCargoGlobal _box; 
	};
};
