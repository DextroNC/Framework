/*
	Parameters:
		<-- Plane as Object
		<-- Parachute as Object
	
	Description:
		Remove Parachute and spawn Smoke
*/

// Parameter Init
params ["_b","_p"];

sleep 3; 
// WaitUntil Box Reached Ground or is Stuck
WaitUntil {((((position _b) select 2) < 0.7) || (isNil "_p"||((((position _b) select 2) < 20)&&((velocity _b select 2) > -1) )))};

// Detach Chute
detach _b;   
_b allowDamage false; 
sleep 2;

// Spawn Smoke on Final Pos
"SmokeShellPurple" createVehicle (getPos _b);
_b allowDamage true; 