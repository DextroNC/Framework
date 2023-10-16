/*
	Parameters:
		<-- Box Type as Integer

	Return:
		--> Box as Object

	Description:
		Spawns the respective supply box (invinsible).

	Example (Spawn Infantry Supply Box):
		_return = [0] call fw_fnc_supplySpawn;

*/

// Parameter Init
params [["_type",0]];

// Get Box details
private _array = SR_SupplyBoxes select _type;
_array params ["_class","_description",["_loadout",-1]];

// Create Supply Box
private _box = createVehicle [_class, [0,0,0], [], 0, "NONE"];
_box allowDamage false;

// Apply Loadout
[_box, _loadout] execVM "loadouts\_supply_drop_content.sqf";

// Return Box
_box
