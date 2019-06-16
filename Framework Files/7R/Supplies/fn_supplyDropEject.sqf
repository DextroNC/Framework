/*
	Parameters:
		<-- Plane as Object

	Descriptions:
		Ejects attached objects from Plane

	
*/

// Parameter Init
params["_v"];

// All Attached Objects to Drop
_array = attachedObjects _v;

// Loop to Drop Objects
{
	// Prepare and Detach
	_x setOwner (owner _v);
	_x disableCollisionWith _v;
	detach _x;	
	
	// Create and Attach Parachute
	_para = "B_Parachute_02_F" createVehicle [0, 0, 100];
	_para setDir (direction _v);
	_para setposASL (getPosASL _x);
	_x attachTo [_para,[0,0,-.5]];
	[_x,_para] spawn fw_fnc_supplyDropLanding;
	sleep 0.25;
} forEach _array;



