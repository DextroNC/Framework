/*
	Parameters:
	<-- Trigger as Object or Area Marker Name as String
	<-- Optional: Excluded Units as Array of Objects

	Description:
		Deletes all AI from an the area of the trigger excluding the units given in an optional array.
	
	Example (Trigger onActivation):
		nul = [thisTrigger] spawn fw_fnc_clearArea;

*/
// Server only execute
if(!isServer) exitWith {};

// Parameter Init
params ["_area",["_excl",[]]];
_units = allUnits - allPlayers;

// Filter out excluded units
_array = [_units, [_excl,_area], {_x}, "ASCEND",{!(_x in _input0) && (_x inArea _input1)}] call BIS_fnc_sortBy;

// Delete all units from array
{
	if (vehicle _x != _x) then {
		deleteVehicle vehicle _x;
	};
	deleteVehicle _x;
}forEach _array;