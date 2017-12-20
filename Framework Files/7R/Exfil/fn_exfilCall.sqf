/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- Type of Helicopter as String
		<-- Callsign as String
		<-- Traveltime as Integer (seconds) e.g. Spawn Delay
		<-- Optional: Dropoff Marker as String 

	Description:
	Handles AI based Exfiltration, spawning helicopter and picking up units. Optional drop off afterwards.
	
	Example:
	none
*/

// Parameter Init
params ["_tm","_sm","_type","_callsign","_traveltime","_do"];
_spawn = markerPos _sm;
_target = markerPos _tm;
private "_drop";

// Check if DropOff Marker exists
 if (isNil "_do") then {
	_drop = markerPos _sm;
} else {
	_drop = markerPos _do;
};

// Check if Target Marker exists if not exit with error msg
if (_target isEqualto [0,0,0]) exitWith {
	[[SR_Side, "HQ"],"No Extraction Zone designated."] remoteExec ["sideChat", -2];
};

// Check if Exfiltration is locked
if (ExfilHelolock) exitWith {
	[[SR_Side, "HQ"],"Negative: All Helicopters are in use. Other Mission in progress."] remoteExec ["sideChat", -2];
};

// Lock Exfiltration
ExfilHelolock = true;
publicVariable "ExfilHeloLock";

// Log entry and Confirmation Message
_str = "Exfil Helicopter dispatched to Grid " + (mapGridPosition _target) + ".";
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", -2];


// Travel Time
sleep _traveltime;

// Spawning Helicopter
_helo = [_spawn, -90, _type, SR_Side] call bis_fnc_spawnVehicle;
_heloGroup = _helo select 2;
_heloacc = _helo select 0;
_heloacc engineOn true;
_heloGroup setGroupIdGlobal [_callsign];
_heloGroup setBehaviour "CARELESS"; 

// Disable Units to react
{
	_x disableAi "AUTOCOMBAT";
	_x setVariable ["asr_ai_exclude", true];
}forEach units _heloGroup;

// Add Action for Lift Off
[_heloacc] remoteExec ["fw_fnc_exfilAction", -2, true];

// Add Waypoints at EZ
_wp1 = _heloGroup addWaypoint [ _target, 0, 1];
_wp1 setWayPointBehaviour "CARELESS";
_wp1 setWayPointSpeed "NORMAL";
_wp1 setWayPointType "TR UNLOAD";
_wp1 setWayPointCombatMode "WHITE";
_wp1 setWaypointStatements ["vehicle this getVariable ['liftoff',false]","this sideChat 'Moving out.'"];
 
 // Lift off and drop off cargo at DropOff Point
_wp2 = _heloGroup addWaypoint [_drop, 0, 2];
_wp2 setWayPointBehaviour "CARELESS";
_wp2 setWayPointSpeed "NORMAL";
_wp2 setWayPointType "TR UNLOAD";
_wp2 setWayPointCombatMode "WHITE";
_wp2 setWaypointStatements ["true",""];

// Final WP to despawn
_wp3 = _heloGroup addWaypoint [_spawn, 0, 3];
_wp3 setWayPointBehaviour "CARELESS";
_wp3 setWayPointType "MOVE";
_wp3 setWayPointSpeed "NORMAL";
_wp3 setWayPointCombatMode "WHITE";
_wp3 setWaypointStatements ["true","[this] call fw_fnc_deleteVehicle;"];

// Unlock
[{!alive (_this select 0)}, {
	ExfilHelolock = false;
	publicVariable "ExfilHelolock";
}, [_heloacc]] call CBA_fnc_waitUntilAndExecute;
