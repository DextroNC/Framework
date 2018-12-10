/*
	Parameters:
	<-- Trigger as Object or Area Marker Name as String
	<-- Optional: Excluded Units as Array of Objects

	Description:
		Deletes all AI from an the area of the trigger excluding the units given in an optional array.
	
	Example (Trigger onActivation):
		nul = [thisTrigger] spawn fw_fnc_clearArea;

*/
// Parameter Init
params ["_area","_excl"];
_units = allUnits - allPlayers;

// Filter out excluded units
_array = [_units, [], {_x}, "ASCEND",{!(_x in _input0)}] call BIS_fnc_sortBy;

// Delete all units from array
{
	deleteVehicle _x;
}forEach _array;