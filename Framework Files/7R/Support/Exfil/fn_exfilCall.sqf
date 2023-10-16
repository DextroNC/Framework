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
params [["_targetMarker","EZ"],["_spawnMarker","STARTSPAWN"],["_type","RHS_CH_47F"],["_dopoffMarker","dropoff"],["_caller",objNull]];
_spawn = markerPos _spawnMarker;
_target = markerPos _targetMarker;
private _str = "";

// Check if Target Marker exists if not exit with error msg
if (_target isEqualto [0,0,0]) exitWith {
	_str = "Exfil: No EZ designated";
	[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _caller];
};

// Check if Exfiltration is locked
if (ExfilReady > CBA_MissionTime) exitWith {
	private _timeLeft = ExfilReady - CBA_MissionTime;
	[("Negative: Exfil not available. Try again in " + str(round _timeLeft) + " seconds."),("Exfil: Cooldown " + str(round _timeLeft) + " s")] remoteExec ["sr_support_fnc_infoMessage", _caller];
};

// Set Ready
ExfilReady = CBA_MissionTime + 90;
publicVariable "ExfilReady";

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
[_group, _target] spawn BIS_fnc_wpLand;

waitUntil {(!([_helo] call fw_fnc_checkStatus) || (isTouchingGround _helo))};
// Fail Safe
sleep 3;
if (!(isTouchingGround _helo)) then {
	_helo setVariable ["liftoff", true,true];
};

// Wait for Liftoff Command and lift off
waitUntil {(!(alive _helo) || !(canMove _helo)) || (({alive _x} count units _group) < 1) || (_helo getVariable ["liftoff", false])};
{deleteWaypoint _x} forEach waypoints _group;

// Assign recovered Variable
{
	_x setVariable ["SR_Recovered",true,true];
}forEach assignedCargo _helo;

// Evaluate Dropoff
 if (!(markerPos _dopoffMarker isEqualTo [0,0,0]) && {_x in allPlayers} count (crew _helo) > 0) then {
	[_group, (markerPos _dopoffMarker), "TR UNLOAD"] spawn fw_fnc_createWaypoint;
};

// Final WP to despawn
[_group, _spawn, "END"] spawn fw_fnc_createWaypoint;