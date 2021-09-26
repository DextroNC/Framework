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
		_vehicle additemcargoGlobal ["rhs_mag_nspd", 2]; 
		_vehicle additemcargoGlobal ["rhs_mag_nspn_green", 2]; 
	};
	// Ground Vehicle (Infantry) Loadout - Loadout 2
	case 2: {
		_vehicle additemcargoGlobal ["SR_PAK", 8];
		_vehicle addWeaponCargoGlobal ["rhs_weap_rpg18", 2];
	};
	// Ground Vehicle (Echo) Loadout - Loadout 3
	case 3: {
		_vehicle addItemCargoGlobal ["SR_PAK", 4];
		_vehicle addbackpackcargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	    _vehicle addbackpackcargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
		_vehicle addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 20];
        _vehicle addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 10];
        _vehicle addWeaponcargoGlobal ["UK3CB_BAF_M6", 1];
		if (isNil "SR_Night") then {SR_Night = false};
        if (SR_Night) then {
	    _vehicle addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White", 10];
        };
	};
	// Armoured (Foxtrot) Vehicle Loadout - Loadout 4
	case 4: {
		["ACE_Track", _vehicle] call ace_cargo_fnc_loadItem;
		_vehicle addItemCargoGlobal ["SR_PAK", 4];
		_vehicle additemcargoGlobal ["rhs_mag_nspd", 2]; 
		_vehicle additemcargoGlobal ["rhs_mag_nspn_green", 2]; 
	};
	// Default Case (Fallback)
	default {};
};
