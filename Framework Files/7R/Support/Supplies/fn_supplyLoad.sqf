/*
	Parameters:
		<-- Vehicle As Object
		<-- Mode as Integer
		
	Description:
		Spawns the Box with appropriate cargo and loads it into a vehicle.

*/

// Parameter Init
params ["_vehicle","_mode"];

// Get Box details
private _array = SR_SupplyBoxes select _mode;
_array params ["_class","_description","_loadout"];

// Check if Box can be loaded
if (!([_class, _vehicle] call ace_cargo_fnc_canLoadItemIn)) exitWith {
	["","No Space for Cargo"] spawn fw_fnc_info;
};

// Create Box
private _box = [_mode] call fw_fnc_supplySpawn;

// Load Box
[_box, _vehicle, true] spawn ace_cargo_fnc_loadItem;

// Info
["",(_description + " Loaded")] spawn fw_fnc_info;


