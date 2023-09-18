/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Radius as Integer
	
	Return:
	--> None
		
	Description:
		Patrol Legacy
*/
// Parameter Init
params [["_leader",objNull],["_zone",""],["_mode","P"]];

// New Function
[_leader,_zone,_mode] spawn fw_fnc_patrol;