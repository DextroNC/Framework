/*
	Parameters:
		<-- Target Position Marker as String
		<-- Spawn Position Marker as String
		<-- Class as String (default: "B_UAV_02_dynamicLoadout_F")
		<-- Weapons as Boolean (default: true)
		<-- Loiter Altitude as Integer (default: 1500)
		<-- Loiter Radius as Integer (default: 1500)
		<-- Time on Target in Seconds as Integer (default: 300)
		<-- Delay as Integer (default: 0)


	
	Decription:
		Create the Paradrop Plane

	Example:
		["UAVTarget","STARTSPAWN","UK3CB_BAF_MQ9_Reaper]spawn fw_fnc_uav;
		
*/
// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
Params ["_targetMarker","_spawnMarker",["_uavClassArray","UK3CB_BAF_MQ9_Reaper"],["_weaponized", true],["_altitude",1500],["_loiterRadius",1500],["_timeOnTarget",600],["_delay",0]];
private _targetPos = markerPos _targetMarker;
private _infoStr = "";

// Init Public variables if not initialized in init.sqf or else with default values
if (isNil "UAVFireMissionLock") then {UAVFireMissionLock = false; publicVariable "UAVFireMissionLock";};
if (isNil "UAVCallAmmo") then {UAVCallAmmo = 5; publicVariable "UAVCallAmmo";};

// Check if UAV is avaible
if (UAVFireMissionLock) exitWith {
	["Negative: ISR support unavailable. Other mission in progress.","ISR: Currently busy"] spawn fw_fnc_info;
	
};
if (CASCallAmmo == 0) exitWith {
	["Negative: ISR support unavailable. No UAVs on station.","ISR: No platforms left"] spawn fw_fnc_info;
};
if (_targetPos isEqualto [0,0,0]) exitWith {
	["No ISR target location designated.","ISR: No target"] spawn fw_fnc_info;
};

// Lock UAVs and reduce ammo
UAVFireMissionLock = true;
publicVariable "UAVFireMissionLock";
UAVCallAmmo = UAVCallAmmo - 1;
publicVariable "UAVCallAmmo";

// Calcualte Spawn Position
private _dirSpawn = _targetPos getDir (markerPos _spawnMarker);
private _spawnPos = [_targetPos, 3000,_dirSpawn] call BIS_fnc_relPos;


// Spawn UAV and set it up
private _uavClass = "";
private _pylons = [];
switch (typeName _uavClassArray) do
{
	// Default without pylon adjustment
	case "STRING": {
		_uavClass = _uavClassArray;
	};
	// Check if pylons to apply
	case "ARRAY": {
		_uavClass = _uavClassArray select 0;
		_pylons = _uavClassArray select 1;
	};
};

// Spawn UAV
private _uavSpawnReturn = [_spawnPos, (_dirSpawn)-180, (_uavClass), SR_Side] call bis_fnc_spawnVehicle;
_uavSpawnReturn params ["_uav", "_crew", "_group"];
[_uav, _altitude] call BIS_fnc_setHeight;
_uav flyInHeight _altitude;
_uav lockDriver true;
_uav enableuavwaypoints false;
[_group] spawn sr_support_fnc_supportAI;

systemChat str(_pylons);
// Adjust weaponry
if (count _pylons > 0 && _weaponized) then {
	[_uav, _pylons] spawn fw_fnc_changePylons;
};
if (!_weaponized) then {
	_uav setVehicleAmmo 0;
	_uav setAmmo ["UK3CB_BAF_Laserdesignator_mounted",1];
	_uav setAmmo ["Laserdesignator_mounted",1];
};

_uav setVariable ["arrivalOnTarget", CBA_MissionTime + 30];
_uav setVariable ["targetLocation",_targetPos];

// Info message
_infoStr = "ISR: On route to grid " + (mapGridPosition _targetPos) + ".";
[_infoStr,_infoStr] spawn fw_fnc_info;

// Set Waypoint
private _waypoint= [_group, _targetPos, "LOITER", true] call fw_fnc_createWaypoint;
_waypoint setWaypointLoiterRadius _loiterRadius;
_waypoint setWaypointLoiterAltitude _altitude;

private _handle = [{
	// Paramater init
	params ["_params","_handle"];
	_params params ["_uav", "_group", "_spawnPos", "_timeOnTarget", "_targetMarker", "_altitude","_loiterRadius"];
	private _targetMarkerPos = markerPos _targetMarker;
	private _currentTarget = _uav getVariable ["targetLocation", [0,0,0]];

	// On death remove EH
	if (!alive _uav) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	// Check time on target
		private _startTime = _uav getVariable "arrivalOnTarget";
		if (CBA_MissionTime - _startTime >= _timeOnTarget) exitWith {
		["ISR: Off station, returning to base."] spawn fw_fnc_info;
		[_group, _spawnPos, "END", true] call fw_fnc_createWaypoint;
		deleteMarker _targetMarker;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	// Time warning 
	if (CBA_MissionTime - _startTime >= _timeOnTarget - 60) then {
		[("ISR: " + str(round (_timeOnTarget - (CBA_MissionTime - _startTime ))) + " seconds left on station.")] spawn fw_fnc_info;
	};

	// Update target on marker movement
	if (_currentTarget distance2D _targetMarkerPos > 50 && !(_targetMarkerPos isEqualto [0,0,0])) then {
		private _waypoint= [_group, _targetMarkerPos, "LOITER", true] call fw_fnc_createWaypoint;
		_waypoint setWaypointLoiterRadius _loiterRadius;
		_waypoint setWaypointLoiterAltitude _altitude;
		_uav setVariable ["targetLocation", _targetMarkerPos];
		[("ISR: Relocating to grid " + (mapGridPosition _targetMarkerPos) + ".")] spawn fw_fnc_info;
	};
}, 10, [_uav, _group, _spawnPos,_timeOnTarget,_targetMarker, _altitude, _loiterRadius]] call CBA_fnc_addPerFrameHandler;

// Wait until deleted
[{!alive (_this select 0)}, {
	UAVFireMissionLock = false;
	publicVariable "UAVFireMissionLock";
	[(_this select 1)] call CBA_fnc_removePerFrameHandler;
}, [_uav,_handle]] call CBA_fnc_waitUntilAndExecute;