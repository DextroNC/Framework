/*
	Parameters:
	<-- Group Leader of Vehicle

	Description:
		Deletes AI Vehicle including Crew

*/
// Parameter Init
params ["_leader"];
private _vehicle = vehicle _leader;

// Delete Crew
{
	deleteVehicle _x;
}forEach (units group _leader);

// Deletee Vehicle
deleteVehicle _vehicle;
