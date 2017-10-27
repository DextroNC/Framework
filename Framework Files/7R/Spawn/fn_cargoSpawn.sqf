/*
		
	Parameters:
		<-- Type as Integer
		<-- SpawnPos as Object (Helipad invisible)
	
	Description:
	Spawns Box on Cargo Load Point.
	
	Example:
	nul = [1,slingpad] spawn fw_fnc_cargoSpawn;
	
*/

// Parameter init
params ["_mode","_posObj"];

// Information Hint
hint format ["Sling-Load Box spawned."];

// Clear Landing Pad
_old = nearestObjects [_posObj,["AllVehicles","B_supplyCrate_F","CargoNet_01_box_F","CargoNet_01_barrels_F","rhsusf_spec_weapons_crate"],5];
{
	deleteVehicle _x;
}forEach _old;

sleep 1;

// Decide Case
switch _mode do {
	case 1: {
		[_posObj, objNull, 0, 1, true] spawn fw_fnc_supplyDropBox;
	};
	case 2: {
		[_posObj, objNull, 0, 2, true] spawn fw_fnc_supplyDropBox;
	};
	case 3: {
		[_posObj, objNull, 0, 3, true] spawn fw_fnc_supplyDropBox;
	};
	case 4: {
		[_posObj, objNull, 0, 4, true] spawn fw_fnc_supplyDropBox;	
	};
};