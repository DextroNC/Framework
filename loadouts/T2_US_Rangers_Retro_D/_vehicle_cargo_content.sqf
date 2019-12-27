/*
	Parameters:
		<-- vehicle as Object
		<-- Index as Integer

	Description:
		Applies Loadouts to Vehicles

*/

// Parameter Init
params ["_vehicle",["_index",0]];

// Clear Cargo
if (_index > -1) then {
	[_vehicle] call fw_fnc_clearVehicleCargo;
};

switch (_index) do {
	// Helicopter Loadout - Loadout 1
	case 1: {
		_vehicle addItemCargoGlobal ["SR_PAK", 4];
		_vehicle additemcargoGlobal ["SmokeShellPurple", 2]; 
		_vehicle additemcargoGlobal ["ACE_HandFlare_Green", 2]; 
	};
	// Ground Vehicle (Infantry) Loadout - Loadout 2
	case 2: {
		_vehicle additemcargoGlobal ["SR_PAK", 8];
		_vehicle addWeaponcargoGlobal ["rhs_weap_M136_hedp", 1];
	};
	// Ground Vehicle (Echo) Loadout - Loadout 3
	case 3: {
		_vehicle addItemCargoGlobal ["SR_PAK", 4];
		_vehicle addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 1];
	};
	// Armoured (Foxtrot) Vehicle Loadout - Loadout 4
	case 4: {
		["ACE_Track", _vehicle] call ace_cargo_fnc_loadItem;
		_vehicle addItemCargoGlobal ["SR_PAK", 4];
		_vehicle additemcargoGlobal ["SmokeShellPurple", 2]; 
		_vehicle additemcargoGlobal ["ACE_HandFlare_Green", 2]; 
	};
	// Default Case (Fallback)
	default {};
};
