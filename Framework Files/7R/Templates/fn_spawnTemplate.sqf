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

// Server only execute check
if (!isServer) exitWith{};

// Parameter init
params ["_marker","_type","_number","_params","_params2"];
private "_pos";
private _template = [];
private _units = [];
private _leader = objNull;
private _array = [];

// Spawn Pos Init
if (markerSize _marker isEqualTo [1,1]) then {
	_pos = markerPos _marker;
} else {
	_pos = [_marker, true] call CBA_fnc_randPosArea;
};
// =================================================================================================

// Patrol Template Spawn
if (_type isEqualTo "PATROL") Then {

	// Find Template Array
	{
		if (_number in _x) exitWith {
			_template = _x;
		};
	}forEach SR_Template;

	// Check if Template exists
	if (_template isEqualTo []) exitWith {hint "Error: Template does not exist."};

	// Pass Template data
	_side = _template select 1;
	_units = _template select 2;
	
	// Pre-Spawn Init
	_unitNumber = count _units;
	_grp = createGroup _side;
	if (isNil "_params2") then {_params2 = false;};
	
	// Spawn Loop
	for [{_i=0}, {_i<_unitNumber}, {_i=_i+1}] do
	{
		_type = _units select _i;
		_unit = _grp createUnit [_type, _pos, [], 0, "form"];
		[_unit] join _grp;
		If (_i == 0) then
		{
			_leader = _unit;
		};
	};
	// Assign Leader and Create UPSMON Array
	_grp selectLeader _leader;
	_upsmon = [_leader];
	_upsmon append _params;
	_array = units group _leader;
	
	if (_params2) then {
		_ins = [(_params select 0), true] call CBA_fnc_randPosArea;
		_wp = group _leader addWaypoint [_ins ,0,1];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCompletionRadius 100;
		_wp setWaypointStatements ["true", "group this setVariable ['arrived', true]"];
		[{(_this select 0) getVariable ['arrived', false]}, {nul = (_this select 1) execVM "scripts\UPSMON.sqf"; }, [_grp, _upsmon]] call CBA_fnc_waitUntilAndExecute;
	} else {
		// Init UPSMON on spawned Unit
		nul = _upsmon execVM "scripts\UPSMON.sqf";

	};
};

// =================================================================================================

// Garrison Template Spawn
if (_type isEqualTo "GARRISON") Then {

	// Find Template Array
	{
		if (_number in _x) exitWith {
			_template = _x;
		};
	}forEach SR_Template;

	// Check if Template exists
	if (_template isEqualTo []) exitWith {hint "Error: Template does not exist."};

	// Pass Template data
	_side = _template select 1;
	_units = _template select 2;

	// Pre-Spawn Init
	_unitNumber = count _units;
	_grp = createGroup _side;

	// Spawn Loop
	for [{_i=0}, {_i<_unitNumber}, {_i=_i+1}] do
	{
		_type = _units select _i;
		_unit = _grp createUnit [_type, _pos, [], 0, "form"];
		[_unit] join _grp;

		If (_i == 0) then
		{
			_leader = _unit;
		};
	};

	// Assign Leader and Create Garrison Array
	_grp selectLeader _leader;
	_units = units _grp;
	_garrison = [_pos, _units];
	_garrison append _params;
	_array = units group _leader;
	// Init Garrison on spawned Unit
	nul = _garrison execVM "scripts\Zen_OccupyHouse.sqf";

};

// =================================================================================================

// Vehicle Template Spawn
if (_type isEqualTo "VEHICLE") Then {

	// Find Template Array
	{
		if (_number in _x) exitWith {
			_template = _x;
		};
	}forEach SR_Template;

	// Check if Template exists
	if (_template isEqualTo []) exitWith {hint "Error: Template does not exist."};

	// Pass Template data
	_side = _template select 1;
	_units = _template select 2;

	// Pre-Spawn Init
	_dir  = markerDir _marker; 
	_grp = createGroup _side;
	
	// Spawn Empty Vehicle
	_veh = createVehicle [(_units select 0), _pos, [], 0, "NONE"];
	_veh setDir _dir;
	_units = _units - [(_units select 0)]; 

	// Unit Spawn Loop
	{
		private _type = _x select 0;
		private _slot = _x select 1;

		// Process Driver, Gunner, Commander, Cargo or Turret
		switch (_slot) do {
			case "driver": {
				_unit = _grp createUnit [_type, _pos, [], 0, "form"];
				[_unit] join _grp;
				_unit moveInDriver _veh;
				_unit assignAsDriver _veh;
				[_unit] orderGetIn true; 
				
			};
			case "gunner": {
				_unit = _grp createUnit [_type, _pos, [], 0, "form"];
				[_unit] join _grp;
				_unit moveInGunner _veh;
				_unit assignAsGunner _veh;
				[_unit] orderGetIn true; 
			};
			case "commander": {
				_unit = _grp createUnit [_type, _pos, [], 0, "form"];
				[_unit] join _grp;
				_unit moveInCommander _veh;
				_unit assignAsCommander _veh;
				[_unit] orderGetIn true; 
			};
			case "cargo": {
				_unit = _grp createUnit [_type, _pos, [], 0, "form"];
				[_unit] join _grp;
				_unit moveInCargo _veh;
				_unit assignAsCargo _veh;
				[_unit] orderGetIn true; 
			};
			case "Turret": {
				private _path = _x select 2;
				_unit = _grp createUnit [_type, _pos, [], 0, "form"];
				[_unit] join _grp;
				_unit moveInTurret [_veh, _path];
				_unit assignAsTurret [_veh, _path];
				[_unit] orderGetIn true; 
			};
		};
	} forEach _units;

	// Create Array to pass
	private _leader = leader _grp;
	private _pass = [_leader];
	_pass append _params;
	
	// Init Vehicle Spawn 
	nul = _pass spawn fw_fnc_spawnVehicleTemplate;
};


// =================================================================================================

// Air
if (_type isEqualTo "AIR") Then {

	// Find Template Array
	{
		if (_number in _x) exitWith {
			_template = _x;
		};
	}forEach SR_Template;

	// Check if Template exists
	if (_template isEqualTo []) exitWith {hint "Error: Template does not exist."};

	// Pass Template data
	_side = _template select 1;
	_units = _template select 2;

	// Pre-Spawn Init
	_dir  = markerDir _marker; 

	// Spawn Vehicle
	_veh = [_pos, _dir, (_units select 0), _side] call bis_fnc_spawnVehicle;

	// Initialise
	private _leader = leader (_veh select 2);
	_params params ["_tMarker","_wpType","_mode","_pZone"];
	hint format ["%1", _params];
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
		[(group _leader), _pa select 0, _pa select 1, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [0,0,0]] call CBA_fnc_taskPatrol;
	};	
};

