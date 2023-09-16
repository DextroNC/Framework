/*
	Parameters:
		<-- Unit as Object
	
	Description:
		<-- Checks if somebody is Platoon Sergeant

*/
// Parameter init
params ["_unit"];
_return = false;
if (leader _unit == _unit || [_unit] call fw_fnc_isSergeant) then {_return = true;} else {_return = false;};

_return
