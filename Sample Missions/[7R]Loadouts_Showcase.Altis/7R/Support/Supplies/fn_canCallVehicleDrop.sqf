/*
	Parameters:
		<-- Unit as Object

	Return:
		--> Leader as Boolean
		
	Description:
		Checks if a Unit fulfills the requirements to call a Vehicle Supply Drop

*/

// Parameter Init
params ["_unit"];
private _return = false;

// Check proximity to drop zone and unit is leader
if (count (_unit nearObjects ["ACE_DropZone",150]) > 0) then {
	if ([_unit] call fw_fnc_isLeader) then {
		_return = true;
	};
};

// Return
_return