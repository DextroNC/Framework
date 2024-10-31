/*
	Parameters:
		<-- Plane/Spawn Pad as Object
		<-- Memory Point as String
		<-- Offset as Array
		<-- Mode as Integer
		<-- Cargo Spawn Overwrite as Boolean

	Description:
		Spawns the Box and Loads it with appropriate cargo. Either provides them for Air Drop or Sling Loading.

*/

// Parameter Init
params["_plane","_mem","_off",["_mode", 0]];

// Create Supply Box
private _box = [_mode] call fw_fnc_supplySpawn;
_box hideObjectGlobal true;

// Attach Box to Plane
_box attachTo [_plane,_off,_mem];
