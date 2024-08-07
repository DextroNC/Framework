/*
	Parameters:
		<-- Target Positionas Array (Position Array)
		<-- Spawn Position as Array (Position Array)
		<-- DropWP Position as Array (Position Array)
		<-- End Position as Array (Position Array)
		<-- Spawn Direction as Integer
		<-- Units as Array 
		<-- Classname as String
		<-- Altitude as Integer (ABOVE SEE LEVEL)
		<-- Opt. Static-Line Drop as Boolean (default: false)
	
	Decription:
		Create the Paradrop Plane
		
*/

// Parameter Init
Params ["_target", "_spawn", "_drop", "_end", "_direction", "_units", "_class",  "_height", "_static"];
private _type = SR_Support_Assets select 0;

// Spawn Plane and Init
private _planeArray = [_spawn, _direction, _class, SR_Side] call bis_fnc_spawnVehicle;
_planeArray params ["_plane","_crew","_group"];

// Set Height
if (!_static) then {
	_plane flyInHeightASL [ _height,  _height,  _height];
};

// Set support AI and disable Damage
[_group] spawn sr_support_fnc_supportAI;
_plane allowDamage false;

// Create waypoints
private _type = "";
if(_static) then {
	_type = "STATICLINE"
} else {
	_type = "FREEFALL";	
};
[_group, _target, _type] call fw_fnc_createWaypoint;
[_group, _end, "END"] call fw_fnc_createWaypoint;
["Paradrop Plane dispatched."] spawn fw_fnc_info;
sleep 2;

// Teleport People into Plane
_slot = 2;
{
	["ParaPort", [_plane,_x,_slot], _x] call CBA_fnc_targetEvent;
	_slot = _slot + 1;
	_x assignAsCargo _plane;
	[_x] orderGetIn true;
} forEach _units;