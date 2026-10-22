/*

	Parameters:
		<-- Convoy Logic as Object
		<-- Marker as String
		<-- Array of Convoy Vehicle Templates as Array of Integers

	Return:
		--> Nothing

	Description:
		Spawns a convoy of vehicles at the specified marker location based on the convoy logic and template settings.

	Example:
		_return = [_logic, _initialMarker, _convoyVics] call fw_fnc_spawnConvoy;

*/

// Parameter Init
params ["_logic","_initialMarker","_convoyVics",["_spacing", 35]];

_groupVehicles = [];

// Get Spawn Pos
private _spawnArray = [[0,0,0], 0];
_spawnPos = _spawnArray select 0;
_spawnDir = _spawnArray select 1;

// Get Spawn Pos
if (markerSize _initialMarker isEqualTo [1,1]) then {
    _spawnPos = markerPos _initialMarker;
    _spawnDir = markerDir _initialMarker;
} else {
    _spawnPos = [_initialMarker, true] call CBA_fnc_randPosArea;
    _spawnDir = markerDir _initialMarker;
};

{
    // Find Template
    private _template  = [_x] call fw_fnc_findTemplate;
    if (count _template == 0) exitWith {systemChat "Error: Template does not exist!"};
    _template params ["_nbr","_side","_units"];

    // Create Group
    _group = createGroup _side;
    
	// Spawn Vehicle
	_leader = [_group,_units,_spawnPos,_spawnDir] call fw_fnc_spawnTemplateUnits;
    _groupVehicles pushBack (vehicle _leader);

    // Reset Spawn Pos for next vehicle
    _spawnArray = [_leader, _spacing] call fw_fnc_posAlongRoad;
    _spawnPos = _spawnArray select 0;
    _spawnDir = _spawnArray select 1;

    sleep 0.1;
} forEach _convoyVics;

// Set convoy vehicles and lead vehicle as variables on the logic entity
_logic setVariable ["convVehicles", _groupVehicles, true];
_logic setVariable ["leadVic", (_groupVehicles select 0), true];
