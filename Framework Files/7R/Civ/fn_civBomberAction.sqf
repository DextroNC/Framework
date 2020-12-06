/*
	Parameters:
		<-- Unit as Object
		<-- Handler as String
		
	Description:
		Action for suicide bomber to blow himself up

*/
// Parameter Init
params ["_unit"];

// Check if Bomber has Ammunition				
if ("rhs_mag_rgd5" in (magazines _unit)) then { 
	
	// Get Target
	_target = _unit getVariable "sb_target";

	// Final Charge
	group _unit setSpeedMode "FULL"; 
	_unit doMove position _target;
	
	// Remove Killed EH
	_unit removeAllEventHandlers "killed";

	// Shout out
	[_unit, "akbar"] remoteExec ["say3D"];

	// Delay
	sleep (1.5 + random 1.5);

	// Trigger Bomb
	if (alive _unit) then {
		_unit removeMagazine "rhs_mag_rgd5";
		"M_PG_AT" createVehicle (position _unit);
	};
};


