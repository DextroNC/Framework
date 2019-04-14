/*
	Parameters:
		<-- Plane/Spawn Pad as Object
		<-- Memory Point as String
		<-- Offset as String
		<-- Mode as Integer
		<-- Cargo Spawn Overwrite as Boolean
		
	Description:
		Spawns the Box and Loads it with appropriate cargo. Either provides them for Air Drop or Sling Loading.

*/

// Parameter Init
params["_plane","_mem","_off",["_mode", 1],["_cargo", false]];
private "_box";

// Create Supply Box
switch (_mode) do {
    case 1: {
		_box = createVehicle ["B_supplyCrate_F", [0,0,0], [], 0, "NONE"];
		[_box, 1] execVM "loadouts\SupplyDropContent.sqf";
	};
    case 2: {
		_box = createVehicle ["CargoNet_01_box_F", [0,0,0], [], 0, "NONE"];
		[_box, 2] execVM "loadouts\SupplyDropContent.sqf";
		[_box] spawn fw_fnc_supplyDropVehicleInit;
	};
    case 3: {
		_box = createVehicle ["CargoNet_01_barrels_F", [0,0,0], [], 0, "NONE"];
		[_box] spawn fw_fnc_supplyDropFortInit;
	};
	case 4: {
		_box = createVehicle ["Box_NATO_AmmoOrd_F", [0,0,0], [], 0, "NONE"];
		[_box, 3] execVM "loadouts\SupplyDropContent.sqf";
	};
	case 5: {
		_box = createVehicle ["Box_NATO_Ammo_F", [0,0,0], [], 0, "NONE"];
		[_box, 4] execVM "loadouts\SupplyDropContent.sqf";
	};
	case 6: {
		_box = createVehicle ["Box_NATO_WpsSpecial_F", [0,0,0], [], 0, "NONE"];
		[_box, 5] execVM "loadouts\SupplyDropContent.sqf";
	};
};

// Cargo Spawn Overwrite
if (_cargo) exitWith {
		_box setPosASL (getPosASL _plane);
		_box setDir (getDir _plane);
};

// Attach Box to Plane
_box attachTo [_plane,_off,_mem];





