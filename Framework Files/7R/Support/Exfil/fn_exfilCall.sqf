/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- Type of Helicopter as String
		<-- Optional: Dropoff Marker as String  
		<-- Caller as Object

	Description:
	Handles AI based Exfiltration, spawning helicopter and picking up units. Optional drop off afterwards.
	In case a dropoff marker is present after picking up units at the exfil, 
	it will fly to the dropoff to unload all people before returning to his spawn to despawn.
	
	Example:
	none
*/

// Parameter Init
params [["_targetMarker","EZ"],["_spawnMarker","STARTSPAWN"],["_type","RHS_CH_47F"],["_dropoffMarker","dropoff"],["_caller",objNull]];

if !(isServer) exitWith{};

_spawn = markerPos _spawnMarker;
_target = markerPos _targetMarker;
private _str = "";

// Check if Target Marker exists if not exit with error msg
if (_target isEqualto [0,0,0]) exitWith {
	_str = "Exfil: No EZ designated";
	[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _caller];
};

// Check if Exfiltration is locked
if (SR_HeliLiftoff) exitWith {
	["Negative: Exfil not available. Other mission in progress.","Exfil: Currently busy"] remoteExec ["sr_support_fnc_infoMessage", _caller];
};

// Check if Exfiltration is locked
if (ExfilReady > CBA_MissionTime) exitWith {
	private _timeLeft = ExfilReady - CBA_MissionTime;
	[("Negative: Exfil not available. Try again in " + str(round _timeLeft) + " seconds."),("Exfil: Cooldown " + str(round _timeLeft) + " s")] remoteExec ["sr_support_fnc_infoMessage", _caller];
};

// Set Ready & Liftoff
ExfilReady = CBA_MissionTime + 90;
publicVariable "ExfilReady";

SR_HeliLiftoff = false;
publicVariable "SR_HeliLiftoff";

// Log entry and Confirmation Message
_str = "Exfil Helicopter dispatched to Grid " + (mapGridPosition _target) + ".";
[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _caller];
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 

// Spawning Helicopter
_helo = [_spawn, -90, _type, SR_Side] call bis_fnc_spawnVehicle;
_group = _helo select 2;
_helo = _helo select 0;

// Disable AI in Parts
[_group] spawn sr_support_fnc_supportAI;

// Add Action for Lift Off
[_helo] remoteExec ["fw_fnc_exfilAction", 0, true];

// Clear Inventory of Helo
clearweaponcargoGlobal _helo;  
clearmagazinecargoGlobal _helo;  
clearitemcargoGlobal _helo; 
clearBackpackCargoGlobal _helo; 
_helo addItemCargoGlobal ["SR_PAK", 10];

// Add Waypoints at EZ
[_group, _target, "TR UNLOAD"] call fw_fnc_createWaypoint

waitUntil {(!([_helo] call fw_fnc_checkStatus) || (isTouchingGround _helo))};
// Fail Safe
sleep 3;
if (!(isTouchingGround _helo)) then {

	SR_HeliLiftoff = true;
	publicVariable "SR_HeliLiftoff";
};

// Wait for Liftoff Command and lift off
waitUntil {(!(alive _helo) || !(canMove _helo)) || (({alive _x} count units _group) < 1) || SR_HeliLiftoff};
{deleteWaypoint _x} forEachReversed waypoints _group;

// Assign recovered Variable
{
	_x setVariable ["SR_Recovered",true,true];
}forEach assignedCargo _helo;

fnc_checkPlayerCrewCount = {
	params ["_group"];
	_crew = [];
	{
		_crew = _crew + crew vehicle _x;
		_crew
	} forEach _group;
	private _count = {_x in allPlayers && alive _x} count (_crew);
	_count == 0;
};

private _wpScript = toString {
	if !(local this) exitWith{};
	waitUntil {[thisList] call fnc_checkPlayerCrewCount;};

	SR_HeliLiftoff = false;
	publicVariable "SR_HeliLiftoff";

	private _wpEnd = [markerPos "STARTSPAWN", 2000, this getDir markerPos "STARTSPAWN"] call BIS_fnc_relPos;
	_wpEnd set [2, 50];	
	{deleteWaypoint _x} forEachReversed waypoints _group;
	[group this, _wpEnd, "END"] call fw_fnc_createWaypoint;
};

// Evaluate Dropoff - Check where we should send the helo. If defined, go to dropoff marker, else back to spawn.
if !(markerPos _dropoffMarker isEqualTo [0,0,0]) then {
	if ({_x in allPlayers || side _x == civilian} count (crew _helo) > 0) then { // Check if helo has players or civvies in it
		{deleteWaypoint _x} forEachReversed waypoints _group;
		_wp = [_group, (markerPos _dropoffMarker), "TR UNLOAD"] call fw_fnc_createWaypoint;
		_wp setWaypointStatements ["true", _wpScript];
	} else { // If not, go away and despawn
		{deleteWaypoint _x} forEachReversed waypoints _group;
		private _wpEnd = [markerPos "STARTSPAWN", 2000, _helo getDir markerPos "STARTSPAWN"] call BIS_fnc_relPos;
		_wpEnd set [2, 50];	
		[_group, _wpEnd, "END"] call fw_fnc_createWaypoint;
	};
} else {
	if ({_x in allPlayers || side _x == civilian} count (crew _helo) > 0) then { // Check if helo has players or civvies in it
		{deleteWaypoint _x} forEachReversed waypoints _group;
		_wp = [_group, _spawn, "TR UNLOAD"] call fw_fnc_createWaypoint;
		_wp setWaypointStatements ["true", _wpScript];
	} else { // If not, go away and despawn
		{deleteWaypoint _x} forEachReversed waypoints _group;
		private _wpEnd = [markerPos "STARTSPAWN", 2000, _helo getDir markerPos "STARTSPAWN"] call BIS_fnc_relPos;
		_wpEnd set [2, 50];	
		[_group, _wpEnd, "END"] call fw_fnc_createWaypoint;
	};
};