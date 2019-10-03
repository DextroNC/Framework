/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- Type of Helicopter as String
		<-- Callsign as String
		<-- Traveltime as Integer (seconds) e.g. Spawn Delay
		<-- Opt. Delay before leaving as Integer (in Seconds) - default 240 seconds

	Description:
		Dispatched a Helicopter which will land and take VIPs on board. Once Players tell him to leave, it will fly to a despawn point.
		Before despawning, VIPs will receive Variable (_unit setVarialbe ["SR_Recovered",true])

		If optional delay is been giving, helo will wait limited time on the ground before leaving regardless.
	
	Example:
	none
*/

// Parameter Init
params ["_tm","_sm","_type","_callsign","_traveltime",["_groundTime",240]];
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
[_helo,1] remoteExec ["fw_fnc_exfilAction", 0, true];

// Clear Inventory of Helo
clearweaponcargoGlobal _helo;  
clearmagazinecargoGlobal _helo;  
clearitemcargoGlobal _helo; 
clearBackpackCargoGlobal _helo; 
_helo addItemCargoGlobal ["SR_PAK", 10];


// Add Waypoints at EZ
_wp1 = _group addWaypoint [ _target, 0, 1];
_wp1 setWayPointType "LOAD";
_wp1 setWayPointBehaviour "CARELESS";
_wp1 setWayPointSpeed "NORMAL";
_wp1 setWayPointCombatMode "WHITE";

// Create Landing Pad
_pad = "HeliHEmpty" createVehicle _target;

// Clean up Function
[{!alive (_this select 0) || (({alive _x} count units (_this select 0)) < 1) || ((_this select 0) distance2D  (_this select 2) < 300)}, {
	[false] call FNC_END;
}, [_helo,_group,_spawn],(_groundTime + 300),{[false] call FNC_END;}] call CBA_fnc_waitUntilAndExecute;

// Slow down and lock to LZ
waitUntil {sleep 0.5; (!([_helo] call fw_fnc_checkStatus) || ((_helo distance _target) < 1000))};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_group lockWP true;
_group setSpeedMode "LIMITED"; 

// Landing
waitUntil {(!([_helo] call fw_fnc_checkStatus) || ((_helo distance _target) < 200))};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
[_group, _target, _pad] spawn BIS_fnc_wpLand;

// Ensure engine stays on and helo does not lift off when initially landed, delete helipad
waitUntil {(!([_helo] call fw_fnc_checkStatus) || (isTouchingGround _helo)) || !isEngineOn _helo};
if (!([_helo] call fw_fnc_checkStatus)) exitWith {[] call FNC_END;};
_helo engineOn true;
sleep 2;
_helo engineOn true;
deleteVehicle _pad;


// Liftoff Inline Function
SR_LiftOff = {	
	params ["_helo","_group","_spawn"];
	// Create Waypoint
	[_group] call CBA_fnc_clearWaypoints;
	_helo land "NONE";
	_helo doMove _spawn;
	_wp = _group addWaypoint [_spawn, 0, 2];
	_wp setWayPointBehaviour "CARELESS";
	_wp setWayPointType "MOVE";
	_wp setWayPointSpeed "NORMAL";
	_wp setWayPointCombatMode "WHITE";
	_wp setWaypointStatements ["true", "[this] call fw_fnc_deleteVehicle;"];
	// Assign recovered Variable
	{
		_x setVariable ["SR_Recovered",true,true];
	}forEach assignedCargo _helo;

};

// Wait for Liftoff
[{(!(alive (_this select 0)) || !(canMove (_this select 0))) || (({alive _x} count units (_this select 1)) < 1) || ((_this select 0) getVariable ["liftoff", false])}, SR_LiftOff, [_helo,_group,_spawn],_groundTime, SR_LiftOff] call CBA_fnc_waitUntilAndExecute;

