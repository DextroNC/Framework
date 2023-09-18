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
Params ["_target", "_spawn", "_drop", "_end", "_direction", "_units", "_class",  "_height", "_static","_track"];
private _type = SR_Support_Assets select 0;

// Spawn Plane and Init
private _planeArray = [_spawn, _direction, _class, SR_Side] call bis_fnc_spawnVehicle;
_planeArray params ["_plane","_crew","_group"];

// Set Height
if (!_static) then {
	_plane flyInHeightASL [ _height,  _height,  _height];
};

// Disable Damage
_plane allowDamage false;

// Set Plane Crew Behavior to not Reactive to Threats
_group setBehaviour "CARELESS"; 
{
	_x disableAi "FSM";
	_x disableAi "TARGET";
	_x disableAi "AUTOTARGET";
	_x disableAi "AUTOCOMBAT";
	_x disableAi "COVER";
	_x disableAi "SUPPRESSION";
}forEach _crew;

// Send to waypoint
_plane doMove _target;
sleep 3;

// Cargo Slot offset for C-130
_slot = 2;

// Start Message
["Paradrop Plane dispatched."] spawn fw_fnc_info;

// Teleport People into Plane
{
	["ParaPort", [_plane,_x,_slot], _x] call CBA_fnc_targetEvent;
	_slot = _slot + 1;
	_x assignAsCargo _plane;
	[_x] orderGetIn true;
} forEach _units;

// Loop Target update and Ramp opening
while {_plane distance2D _target > 150} do {
	_plane doMove _target;
	if (_plane distance2D _target < 1500) then {
		_plane animate ["Door_1_source",1];
	}; 
	sleep 1;
};
_plane doMove _drop;

// Drop all Units in Cargo
if (_static) then {
	[_plane] spawn rhs_fnc_infantryParadrop;
} else {
	{
		private _delay =  (1 / (((speed _plane) max 55) / 100));
		_x disableAI "MOVE";
		_x disableCollisionWith _plane;
		moveout _x;
		unassignVehicle _x;
		[_x] allowGetIn false;
		_x setDir (getDir _plane);
		sleep _delay;
		_x enableAI "MOVE";
		[_x,_track] remoteExec ["fw_fnc_trackParadrop",_x];
		_plane doMove _drop;
	} forEach _units;
};

// Check if all Cargo is dropped and send Plane to End Pos
[{([typeOf (_this select 0), false] call BIS_fnc_crewCount) == (count crew (_this select 0))}, {
	Params ["_plane", "_end"];
	["Paradrop Plane  has dropped its units dropped."] spawn fw_fnc_info;
	_plane animate ["Door_1_source",0];
	_plane doMove _end;
}, [_plane,_end]] call CBA_fnc_waitUntilAndExecute;

// Clean up and delete Plane
[{((_this select 0) distance2D  (_this select 1)) < 500 || !alive (_this select 0)}, {
	Params ["_plane","_end"];
	[leader driver _plane] call fw_fnc_deleteVehicle;
}, [_plane, _end]] call CBA_fnc_waitUntilAndExecute;