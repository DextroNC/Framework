/*

	Parameters:
		<-- Spawn Position as Marker
		<-- Template Type as String (either PATROL, GARRISON or VEHICLE)
		<-- Template Number as Integer
		<-- Parameters as Array
		<-- Opt. Parameters

	Description:
	Spawns a unit of the Templates.

	Example:
	nul = ["spawn1","PATROL",1,[params]] spawn fw_fnc_spawnTemplate;

*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Check Unit Cap
if (count (allUnits-allPlayers) > SR_Unit_Cap) exitWith {systemChat "Unit Cap reached."};

// Parameter init
params ["_marker","_type","_number","_params"];
private ["_template","_leader","_group","_array","_spawnPos"];

// Find Template
private _template  = [_number] call fw_fnc_findTemplate;
if (count _template == 0) exitWith {systemChat "Error: Template does not exist!"};
_template params ["_side","_units"];


// Get Spawn Pos
if (markerSize _marker isEqualTo [1,1]) then {
	_spawnPos = markerPos _marker;
} else {
	_spawnPos = [_marker, true] call CBA_fnc_randPosArea;
};

// Create Group
_group = createGroup _side;


// =================================================================================================
// INFANTRY PATROLS
// =================================================================================================

if (_type isEqualTo "PATROL") Then {

	// Spawn Units
	_leader = [_group,_units,_spawnPos] call fw_fnc_spawnTemplateUnits;

	// Modify Group
	_group deleteGroupWhenEmpty true;
	_group selectLeader _leader;

	// Init Patrol Script on Spawn Units
	([_leader] + _params) remoteExec ["fw_fnc_patrol",2];
};

// =================================================================================================
// AREA GARRISON
// =================================================================================================

if (_type isEqualTo "GARRISON") Then {

	// Spawn Units
	_leader = [_group,_units,_spawnPos] call fw_fnc_spawnTemplateUnits;

	// Modify Group
	_group deleteGroupWhenEmpty true;
	_group selectLeader _leader;

	// Pass to Garrison Script
	([_spawnPos, units _group] + _params) remoteExec ["fw_fnc_garrison",2];
};
// =================================================================================================
// SINGLE BUILDING GARRISON
// =================================================================================================

// ZEI Garrison
if (_type isEqualTo "ZEI") Then {

	// Pass to Garrison Script (ZEI)
	[_spawnPos, _units, _group] remoteExec ["fw_fnc_garrisonZEI",2];

};

// =================================================================================================
// VEHICLE SPAWN
// =================================================================================================

// Vehicle Template Spawn
if (_type isEqualTo "VEHICLE") Then {

	// Spawn Units
	_leader = [_group,_units,_spawnPos,(markerDir _marker)] call fw_fnc_spawnTemplateUnits;

	// Modify Group
	_group deleteGroupWhenEmpty true;
	_group selectLeader _leader;
	_group setVariable ["Vcm_Disable",true,true];

	// Pass to Vehicle diag_activeScripts
	([_leader] + _params) spawn fw_fnc_spawnVehicleTemplate;
};

// =================================================================================================

// Bunkers
if (_type isEqualTo "BUNKER") Then {
	private _bunkerClasses = ["Land_fortified_nest_big","Land_BagBunker_Large_F","Land_Bunker_01_big_F","Land_Bunker_01_HQ_F","Land_Bunker_01_tall_F","Bunker_02_base_F","Fortress2","Land_Bunker_01_small_F","Land_fortified_nest_small","Fortress1","Land_BagBunker_Small_F"];
	_params params [["_radius",200]];

	// Find and Populate Bunkers
	{
		private _bunkers = _spawnPos nearObjects [_x, _radius];
		
		// Populate Bunkers
		{
			// Find Slots available
			private _count = count (_x call BIS_fnc_buildingPositions);
			private _garrison = _units;

			// Adjust Template
			if (count _units > _count) then {
				_garrison resize _count;
			};
			// Garrison Bunker (ZEI)
			[_spawnPos, _garrison, _group] remoteExec ["fw_fnc_garrisonZEI",2];
		}forEach _bunkers;
	}forEach _bunkerClasses;
};

// =================================================================================================
// Air Units
// =================================================================================================

if (_type isEqualTo "AIR") Then {

	// Spawn Vehicle
	_vehicle = [_spawnPos, (markerDir _marker), (_units select 0), _side] call bis_fnc_spawnVehicle;

	// Modify Vehicle
	(_vehicle select 0) disableTIEquipment true;

	// Initialise Group
	private _leader = leader (_veh select 2);
	_grp = group _leader;
	_grp deleteGroupWhenEmpty true;
	_params params ["_tMarker","_wpType","_mode","_pZone"];
	private "_tPos";
	if (isNil "_pZone") then {
		if (markerSize _tMarker isEqualTo [1,1]) then {
			_tPos = markerPos _tMarker;
		} else {
			_tPos = [_tMarker, true] call CBA_fnc_randPosArea;
		};
		// Add Waypoint
		_wp = group _leader addWaypoint [_tPos ,0,1];
		_wp setWaypointType _wpType;
		_wp setWaypointBehaviour _mode;
		_wp setWaypointCompletionRadius 100;
	} else {
		_pa = [_pZone] call CBA_fnc_getArea;
		[_grp, _pa select 0, _pa select 1, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [0,0,0]] call CBA_fnc_taskPatrol;
	};
};