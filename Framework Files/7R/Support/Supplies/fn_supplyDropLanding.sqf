/*
	Parameters:
		<-- Box as Object
		<-- Parachute as Object
	
	Description:
		Remove Parachute and spawn Smoke
*/

// Parameter Init
params ["_box","_parachute"];

//sleep 3; 
// WaitUntil Box Reached Ground or is Stuck
//WaitUntil {((((position _b) select 2) < 0.7) || (isNil "_p"||((((position _b) select 2) < 20)&&((velocity _b select 2) > -1) )))};

// Detach function
private _detachFunction = {
	// Parameter Init
	params ["_box","_parachute"];

	// Detach parachute and protect from damage
	detach _box;   
	deleteVehicle _parachute;
	_box allowDamage false; 

	// Spawn Smoke or detached IR strobe
	if (sunOrMoon >= 0.6) then {
		"SmokeShellBlue" createVehicle (getPos _box);	
	} else {
		{
			detach _x;
		} forEach attachedObjects _box;
	};

	// Allow damage again
	[{_this allowDamage true;}, _box, 5] call CBA_fnc_waitAndExecute;
};



// Wait until and execute
[{
	// Condition
	// Parameter init
	params ["_box","_parachute"];
	// Height OR parachute despawned OR Negativ velocity (e.g. stuck in a tree)
	(
		isNil "_parachute" || ((((position _box) select 2) < 0.7) || (((((position _box) select 2) < 20) && ((velocity _box select 2) > -1) )))
	)
}, _detachFunction, _this, 45, _detachFunction] call CBA_fnc_waitUntilAndExecute;

