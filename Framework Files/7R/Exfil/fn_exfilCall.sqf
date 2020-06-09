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
	In case a dropoff marker is present after picking up units at the exfil, 
	it will fly to the dropoff to unload all people before returning to his spawn to despawn.
	
	Example:
	none
*/

// Parameter Init
params ["_tm","_sm","_type","_callsign","_traveltime","_do"];
_spawn = markerPos _sm;
_target = markerPos _tm;
private "_drop";



// Check if Target Marker exists if not exit with error msg
if (_target isEqualto [0,0,0]) exitWith {
	["Exfil: No EZ designated", 1.5] call ace_common_fnc_displayTextStructured;
	[[SR_Side, "HQ"],"No Extraction Zone designated."] remoteExec ["sideChat", -2];
};

// Check if Exfiltration is locked
if (ExfilHelolock) exitWith {
	["Exfil: No Helo available", 1.5] call ace_common_fnc_displayTextStructured;
	[[SR_Side, "HQ"],"Negative: All Helicopters are in use. Other Mission in progress."] remoteExec ["sideChat", -2];
};

// Lock Exfil
ExfilHelolock = false;
publicVariable "ExfilHeloLock";


// Log entry and Confirmation Message
_str = "Exfil Helicopter dispatched to Grid " + (mapGridPosition _target) + ".";
[_str, 1.5] call ace_common_fnc_displayTextStructured;
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", -2];

// Inline End Function
FNC_END = {
	ExfilHelolock = false;
	publicVariable "ExfilHeloLock";
};

// Travel Time
sleep _traveltime;

// Spawning Helicopter
_helo = [_spawn, -90, _type, SR_Side] call bis_fnc_spawnVehicle;
_group = _helo select 2;
_helo = _helo select 0;
_helo engineOn true;
_group setGroupIdGlobal [_callsign];
_group setBehaviour "CARELESS"; 

/*
// Disable Units to react
{
	_x disableAi "AUTOCOMBAT";
	_x setVariable ["asr_ai_exclude", true];
}forEach units _group;
*/
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
_wp1 = _group addWaypoint [ _target, 0, 1];
_wp1 setWayPointBehaviour "CARELESS";
_wp1 setWayPointType "MOVE";
_wp1 setWayPointSpeed "NORMAL";
_wp1 setWayPointCombatMode "WHITE";

// Slow down and lock to LZ
waitUntil {sleep 0.5; (!([_helo] call fw_fnc_checkStatus) || ((_helo distance _target) < 1000))};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_group lockWP true;
_group setSpeedMode "LIMITED"; 

// Landing
waitUntil {(!([_helo] call fw_fnc_checkStatus) || ((_helo distance _target) < 200))};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_helo land 'land';
doStop _helo;

// Ensure engine stays on and helo does not lift off when initially landed
waitUntil {(!([_helo] call fw_fnc_checkStatus) || (isTouchingGround _helo)) || !isEngineOn _helo};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_helo engineOn true;
_helo flyInHeight 0;
_group lockWP false;
sleep 2;
_helo engineOn true;

// Wait for Liftoff Command and lift off
waitUntil {(!(alive _helo) || !(canMove _helo)) || (({alive _x} count units _group) < 1) || (_helo getVariable ["liftoff", false])};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_helo land 'NONE';
force = true;
publicVariable "force";
_group setSpeedMode "NORMAL"; 
_helo flyInHeight 100;
{deleteWaypoint _x}forEach waypoints _group;




[{!alive (_this select 0) || (({alive _x} count units (_this select 0)) < 1) || ((_this select 0) distance2D  (_this select 2) < 300)}, {
	[false] call FNC_END;
}, [_helo,_group,_spawn]] call CBA_fnc_waitUntilAndExecute;

// Evaluate Dropoff
 if (!isNil "_do" && !(markerPos _do isEqualTo [0,0,0])) then {
	_drop = markerPos _do;
	_wp2 = _group addWaypoint [_drop, 0, 1];
	_wp2 setWayPointBehaviour "CARELESS";
	_wp2 setWayPointSpeed "NORMAL";
	_wp2 setWayPointType "TR UNLOAD";
	_wp2 setWayPointCombatMode "WHITE";
};

// Final WP to despawn
_wp3 = _group addWaypoint [_spawn, 0, 2];
_wp3 setWayPointBehaviour "CARELESS";
_wp3 setWayPointType "MOVE";
_wp3 setWayPointSpeed "NORMAL";
_wp3 setWayPointCombatMode "WHITE";
_wp3 setWaypointStatements ["true", "[this] call fw_fnc_deleteVehicle;"];