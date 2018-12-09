/*
	Parameters:
	<-- Group Leader of Vehicle

	Description:
		Deletes AI Vehicle including Crew

*/
// Parameter Init
params ["_leader"];
_vehicle = vehicle _leader;
_crew = units group _leader;

// Delete Crew
{
	deleteVehicle _x;
}forEach _crew;

// Deletee Vehicle
deleteVehicle _vehicle;
