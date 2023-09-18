/*
	Parameters:
		<-- Vehicle as Object
	
	Description:
		Checks whether an AI controlled Vehicle is still considered operational. 
		Used in Exfil and Reinf AI functions.

	Return:
		--> Operational (true/false)


*/
// Parameter init
params ["_vic"];
_return = true;

// Check Vehicle alive
if (!alive _vic) then {_return = false;};

// Check for critical damage (engine destroyed)
if (!canMove _vic) then {_return = false;};

// Check Vehicle has driver
if (count (fullCrew [_vic, "driver", false]) == 0) then {_return = false;};

_return
