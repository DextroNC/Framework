/*
	Parameters:
		<-- Vehicle as Object

		
		
	Decription:
		Drops all cargo to freefall paradrop.
		
	Example:
		nul = [_vehicle] spawn fw_fnc_freefallDrop;
*/

// Parameter Init
params ["_vehicle"];
private _cargo = assignedCargo _vehicle;
systemChat "Start Drop";

// Exit if vehicle is not local
if(!local _vehicle) exitWith {};

// Calculate delay
private _delay =  (1 / (((speed _vehicle) max 55) / 100));

// Delete current Waypoint
private _group = group leader _vehicle;
deleteWaypoint [_group, currentWaypoint _group];
_group setSpeedMode "LIMITED";


// Open door
_vehicle animate ["Door_1_source",1];

// Drop all cargo units
{
	_x disableAI "MOVE";
	_x disableCollisionWith _vehicle;
	moveout _x;
	unassignVehicle _x;
	[_x] allowGetIn false;
	_x setDir (getDir _vehicle);
	sleep _delay;
	_x enableAI "MOVE";
} forEach _cargo;

// Close door
_group setSpeedMode "NORMAL";
_vehicle animate ["Door_1_source",0];
["Paradrop Plane  has dropped its units dropped."] spawn fw_fnc_info;
