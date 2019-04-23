/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Radius as Integer
	
	Return:
	--> None
		
	Description:
		Makes the unit garrison random buildings
		
	Example:
		[_position,_units,_radius] spawn fw_fnc_garrison;
*/
// Parameter Init
params ["_position","_units","_radius",["_mode",0]];

// Minimum Radius and Garrison Function
if (_radius < 0) then {
    [_position, nil, _units, 20, _mode, false, true] call ace_ai_fnc_garrison;
} else {
	[_position, nil, _units, _radius, _mode, false, true] call ace_ai_fnc_garrison;
};
