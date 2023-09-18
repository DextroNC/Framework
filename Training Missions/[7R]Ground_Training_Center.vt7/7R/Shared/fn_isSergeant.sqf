/*
	Parameters:
		<-- Unit as Object
	
	Description:
		<-- Checks if somebody is Platoon Sergeant

*/
// Parameter init
params ["_unit"];
_return = false;
if (rank _unit isEqualTo "SERGEANT" && groupid group _unit in ["P","P-1","P-2","PL"]) then {_return = true;} else {_return = false;};

_return
