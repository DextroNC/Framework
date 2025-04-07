/*
	Parameters:
		<-- Spawn Marker as String
		<-- Destination Marker as String
		<-- Vehicle Class as String
		<-- Limited Speed as Boolean
		<-- Damage Required as Integer
		<-- Terminal as Object
		<-- Group as Group (for Message)
		<-- Only Msg to Initiator as Boolean

	Description:
		Spawns a vehicle which is driving to the destination. Returns success if vehicle is disabled or crew is killed.
		On success deletes all.

*/

// Parameter Init
params ["_spawnMarker","_wpMarker","_class","_speed","_required","_terminal","_group","_noMsg"];
terminal = _terminal;

// Create Vehicle
_grp = createGroup resistance;
_array = [(markerPos _spawnMarker),(markerDir _spawnMarker),_class,resistance] call BIS_fnc_spawnVehicle;
_array params ["_vehicle","_crew","_vGroup"];

// Adjust AI
{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
	_x disableAI "AUTOCOMBAT";
}forEach _crew;

// Send Vehicle to Waypoint
_wp = _vGroup addWaypoint [(markerPos _wpMarker) ,0,1];
_wp setWaypointType "MOVE";
// Check for Speed Limit and Enforce
if (_speed) then {
	_wp setWaypointSpeed "LIMITED";
} else {
	_wp setWaypointSpeed "NORMAL";
};
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointStatements ["true", "terminal setVariable ['SR_Test',false,true]"];

// Message Spawn
if (_noMsg) then {
	hint "Vehicle Spawned";
} else {
	"Vehicle Spawned" remoteExec ["hint",_group];
};

// Evaluate success
private _wheels = [_vehicle] call ace_common_fnc_getWheelHitPointsWithSelections;
private _damage = 0;
while {_terminal getVariable ["SR_Test",false] && _damage < _required} do {
 	_damage = 0;
	if (!alive _vehicle) then {_damage = _damage + 5;};
	if ({!alive _x} count _crew > 0) then {_damage = _damage + (({!alive _x} count _crew) * 1.75);};
	if ({_vehicle getHitPointDamage _x > 0.9} count (_wheels select 0) > 0) then {
		_damage = _damage + (({_vehicle getHitPointDamage _x > 0.9} count (_wheels select 0)) * 0.5);
	};
	if (_vehicle getHitPointDamage "HitEngine" > 0.9) then {_damage = _damage + 4;};
	if (_vehicle getHitPointDamage "HitTurret" > 0.9) then {_damage = _damage + 3;};
	if (_vehicle getHitPointDamage "HitGun" > 0.9) then {_damage = _damage + 4;};
	if ((_vehicle getHitPointDamage "HitEngine" > 0.9) && (_vehicle getHitPointDamage "HitTurret" > 0.9) && (_vehicle getHitPointDamage "HitGun" > 0.9)) then {_damage = _damage + 1;};
	sleep 2;
	hint format ["Damage %1 out of 5",_damage];
};

// Add Kill to Counter
private _s = _terminal getVariable ["SR_Hit",0];
_terminal setVariable ["SR_Hit",(_s + 1),true];

// Final Damage Assessment 
private _result = "Damage Report:";
if (!alive _vehicle) then {_result = _result + "\nVehicle fully Destroyed"};
if ({!alive _x} count _crew > 0) then {_result = _result + "\nCrew Killed: "+ str({!alive _x} count _crew )};
if ({_vehicle getHitPointDamage _x > 0.9} count (_wheels select 0) > 0) then {_result = _result + "\nWheels Destroyed: "+ str({_vehicle getHitPointDamage _x > 0.9} count (_wheels select 0))};
if (_vehicle getHitPointDamage "HitEngine" > 0.9) then {_result = _result + "\nEngine Destroyed"};
if (_vehicle getHitPointDamage "HitTurret" > 0.9) then {_result = _result + "\nTurret Destroyed"};
if (_vehicle getHitPointDamage "HitGun" > 0.9) then {_result = _result + "\nWeapon Destroyed"};

// Message End Report
if (_noMsg) then {
	hint _result;
} else {
	_result remoteExec ["hint",_group];
};

// Remove all Remains
sleep 5;
deleteVehicle _vehicle;
{deleteVehicle _x}forEach _crew;