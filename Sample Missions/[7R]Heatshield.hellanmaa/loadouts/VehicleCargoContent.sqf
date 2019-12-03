/*
	Parameters:
		<-- vehicle as Object
		<-- Index as Integer

	Description:
		Applies Loadouts to Vehicles

*/

// Parameter Init
params ["_vehicle",["_index",0]];

switch (_index) do {
	// Helicopter Loadout - Loadout 1 
	case 1: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addItemCargoGlobal ["SR_PAK", 4];  
		_vehicle additemcargoGlobal ["SmokeShellPurple", 4]; 
		_vehicle additemcargoGlobal ["ACE_HandFlare_Green", 4]; 
	};
	// Ground Vehicle (Infantry) Loadout - Loadout 2
	case 2: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addWeaponcargoGlobal ["rhs_weap_M136_hedp", 1];
		_vehicle additemcargoGlobal ["SR_PAK", 8];  
	};
	// Ground Vehicle (Echo) Loadout - Loadout 3
	case 3: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addItemCargoGlobal ["SR_PAK", 4];  
		_vehicle addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 2];
	};
	// Armoured (Foxtrot) Vehicle Loadout - Loadout 4
	case 4: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addItemCargoGlobal ["SR_PAK", 4];  
		_vehicle additemcargoGlobal ["SmokeShellGreen", 4]; 
		_vehicle additemcargoGlobal ["ACE_HandFlare_Green", 4]; 
		["ACE_Track", _vehicle] call ace_cargo_fnc_loadItem;
	};
	case 5: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 72];  
		_vehicle addmagazinecargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 24];  
		_vehicle addmagazinecargoGlobal ["rhs_200rnd_556x45_M_SAW", 12];    
		_vehicle addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 8]; 
		_vehicle addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 12];  
		_vehicle addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 12];  
		_vehicle addmagazinecargoGlobal ["20Rnd_762x51_Mag", 10];  
		_vehicle addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];  
		_vehicle addmagazinecargoGlobal ["MRAWS_HE_F", 3];
		_vehicle addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
		_vehicle addWeaponcargoGlobal ["rhs_weap_m72a7", 1];
		_vehicle additemcargoGlobal ["HandGrenade", 8];  
		_vehicle additemcargoGlobal ["MiniGrenade", 2];  
		_vehicle additemcargoGlobal ["SmokeShell", 28];  
		_vehicle additemcargoGlobal ["SmokeShellGREEN", 2];
		_vehicle additemcargoGlobal ["SmokeShellRed", 2];  
		_vehicle additemcargoGlobal ["SmokeShellBlue", 2];    
		_vehicle additemcargoGlobal ["SmokeShellOrange", 2];      
		_vehicle additemcargoGlobal ["SR_HE_Pack", 4];  
		_vehicle additemcargoGlobal ["SR_Smoke_Pack", 4];
		_vehicle additemcargoGlobal ["SR_Flare_Pack", 4];
		_vehicle additemcargoGlobal ["rhs_mag_mk84", 10];
		_vehicle additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];  
		_vehicle additemcargoGlobal ["DemoCharge_Remote_Mag", 4];  
		_vehicle additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];  
		_vehicle additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];  
		_vehicle additemcargoGlobal ["ACE_CableTie", 24];  
		_vehicle additemcargoGlobal ["Laserbatteries", 2];   
		_vehicle addItemCargoGlobal ["SR_PAK", 10];  
		_vehicle addItemCargoGlobal ["SR_Bandage_Pack", 5];   
		_vehicle addItemCargoGlobal ["SR_Medicine_Pack", 5];   
		_vehicle addItemCargoGlobal ["SR_BloodIV_Pack", 5];  
	};
	case 6: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 24];  
		_vehicle addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
		_vehicle addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 2];
		_vehicle addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 2];
		_vehicle addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 1];
		_vehicle addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m993_Mag", 8];
	};	
	case 7: {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
		_vehicle addItemCargoGlobal ["SR_Bandage_Pack", 2];   
		_vehicle addItemCargoGlobal ["SR_Medicine_Pack", 3];   
		_vehicle addItemCargoGlobal ["SR_BloodIV_Pack", 8];   
	};
	// Default Case (Fallback)
	default {
		clearweaponcargoGlobal _vehicle;  
		clearmagazinecargoGlobal _vehicle;  
		clearitemcargoGlobal _vehicle; 
		clearBackpackCargoGlobal _vehicle; 
	};
};
