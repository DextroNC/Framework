/*
	Parameters:
		<-- Units as Array of Objects

	Description:
		Removes all Units given.

*/

// Parameter Init
Params ["_units"];

// Deletion Loop
{
	deleteVehicle _x;
}forEach _units;