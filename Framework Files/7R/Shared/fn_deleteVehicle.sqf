/*
	Parameters:
	<-- Group Leader of Vehicle

*/
_groupLeader = _this select 0;
_vehicle = vehicle _groupLeader;
{
_vehicle deleteVehicleCrew _x;
}forEach units group _groupLeader;
deleteVehicle _vehicle;
