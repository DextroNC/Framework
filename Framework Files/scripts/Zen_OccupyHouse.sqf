/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Radius as Integer
	
	Return:
	--> None
		
	Description:
		Legacy Compatibility
*/
// Parameter Init
params ["_position","_units","_radius"];

// New Function
[_position,_units,_radius] spawn fw_fnc_garrison;
