/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- Type of Helicopter as String
		<-- Callsign as String
		<-- Traveltime as Integer (seconds) e.g. Spawn Delay
		<-- Opt. Delay before leaving as Integer (in Seconds) - default 600 seconds

	Description:
		Dispatched a Helicopter which will land and take VIPs on board. Once Players tell him to leave, it will fly to a despawn point.
		Before despawning, VIPs will receive Variable (_unit setVarialbe ["SR_Recovered",true])

		If optional delay is been giving, helo will wait limited time on the ground before leaving regardless.
	
	Example:
	none
*/

// Parameter Init
params ["_tm","_sm","_type","_callsign","_traveltime",["_groundTime",600]];
_spawn = markerPos _sm;
_target = markerPos _tm;
// Init Lock Variable if not existing
if(isNil "RecoverLock") then {RecoverLock = false};


// Check if Exfiltration is locked
if (RecoverLock) exitWith {
	["Recovery: No Helo available", 1.5] call ace_common_fnc_displayTextStructured;
	[[SR_Side, "HQ"],"Negative: All Recovery Helicopters are in use. Other Mission in progress."] remoteExec ["sideChat", -2];
};

// Lock Exfil
RecoverLock = true;
publicVariable "RecoverLock";


// Log entry and Confirmation Message
_str = "Recovery Helicopter dispatched to Grid " + (mapGridPosition _target) + ".";
[_str, 1.5] call ace_common_fnc_displayTextStructured;
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", -2];

// Inline End Function
FNC_END = {
	RecoverLock = false;
	publicVariable "RecoverLock";
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


// Disable Units to react
{
	_x disableAi "AUTOCOMBAT";
	_x setVariable ["asr_ai_exclude", true];
}forEach units _group;

// Add Action for Lift Off
[_helo] remoteExec ["fw_fnc_recoverAction", 0, true];

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

_timer = CBA_MissionTime;
// Wait for Liftoff Command and lift off
waitUntil {(!(alive _helo) || !(canMove _helo)) || (({alive _x} count units _group) < 1) || (_helo getVariable ["liftoff", false]) || CBA_MissionTime - _timer > _groundTime};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
force = true;
publicVariable "force";
_group setSpeedMode "NORMAL"; 
_helo flyInHeight 100;
{deleteWaypoint _x}forEach waypoints _group;


[{!alive (_this select 0) || (({alive _x} count units (_this select 0)) < 1) || ((_this select 0) distance2D  (_this select 2) < 300)}, {
	[false] call FNC_END;
}, [_helo,_group,_spawn]] call CBA_fnc_waitUntilAndExecute;

// Assign Recover Variable
{
	_x setVariable ["SR_Recovered",true,true];
}forEach assignedCargo  _helo;

// Final WP to despawn
_wp3 = _group addWaypoint [_spawn, 0, 2];
_wp3 setWayPointBehaviour "CARELESS";
_wp3 setWayPointType "MOVE";
_wp3 setWayPointSpeed "NORMAL";
_wp3 setWayPointCombatMode "WHITE";
_wp3 setWaypointStatements ["true", "[this] call fw_fnc_deleteVehicle;"];