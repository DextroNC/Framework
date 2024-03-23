/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as String
		<-- Airplane Type as String
		<-- Callsign as String
		<-- Amount of Boxes/Vehicles as Integer (1-3 boxes)
		<-- Optional: Type of Supply Drop as Integer (based of _supply_drop_content.sqf), default : 1
		<-- Optional: Vehicle Array as Array [_vehicleType,_vehicleLoadout,_vehicleTexture] - input of [] means no vehicle - vehicle array means no supplies are dropped, only the vic
		<-- Optional: Forces as Boolean (overwrites the coded cooldown period between calls)

	Decription:
		Executes the supply or vehicle air drop.

		Drops two mrzr:
		["vicDrop", "paraStart", "RHS_C130J", "Pegasus 5-1", 2, 2, ["rhsusf_mrzr4_w", 2],true] spawn fw_fnc_supplyDropInit;

*/

// Parameter Init
params [["_targetMarker","SupplyDrop"],["_spawnMarker","STARTSPAWN"],["_type","RHS_C130J"],["_callsign",""],["_amount",1],["_mode",0],["_vehicle",[]],["_forced",false]];
private _target = [_targetMarker] call fw_fnc_findLocation;
private _spawn = [_spawnMarker] call fw_fnc_findLocation;
private _msg = "Supply";
_amount = _amount min 3;

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "SupplyDropLast") then {SupplyDropLast = -30; publicVariable "SupplyDropLast";};
if (isNil "SupplyDropAmmo") then {SupplyDropAmmo = 12; publicVariable "SupplyDropAmmo";};

// Check availability
// Cooldown check
if (CBA_MissionTime - SupplyDropLast < 30 && !_forced) exitWith {
	["Negative: No Supply Drop available. Other Missions in progress.","SD: Currently Busy"] spawn fw_fnc_info;
};
// Ammo check
if (SupplyDropAmmo <= 0 && !_forced) exitWith {
	["Negative: No Supply Drop available. Out of Resources.","SD: Out of Resources"] spawn fw_fnc_info;
};
// No target location check
if (_target isEqualto [0,0,0]) exitWith {
	["No Supply Drop Zone designated.","SD: No Drop Zone"] spawn fw_fnc_info;
};

// Create reference for lock
if (!_forced) then {
	SupplyDropLast = CBA_MissionTime;
	publicVariable "SupplyDropLast";
};

// Check if Vehicle Drop then excute vehicle instead of boxes
if (count _vehicle > 0) then {
	_vehicle params [["_vehicleClass",""],["_vehicleLoadout",-1],["_vehicleTexture",""]];
	_msg = "Vehicle";
};

// Confirmation messages and log entries
private _str = str(_amount) + "x " + _msg + " Drop to Grid " + (mapGridPosition _target);
[_str,_str] spawn fw_fnc_info;
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent;

// Calculating spawn point
private _dir = _spawn getDir _target;
private _spawnPos = [_spawn, 2000,(_dir - 180)] call BIS_fnc_relPos;

// Spawn and set up aircraft / crew 
private _aircraftReturn = [_spawnPos, _dir, _type, SR_Side] call bis_fnc_spawnVehicle;
_aircraftReturn params ["_aircraft","_crew","_group"];
_aircraft engineOn true;
_aircraft allowDamage false;
leader _group setGroupIdGlobal [_callsign];
[_group] spawn sr_support_fnc_supportAI;


// Supply drop cargo
if (count _vehicle == 0) then {
	// Spawn and attach boxes to memory points of the aircraft
	for [{_i= 1},{_i <= _amount},{_i = _i + 1}] do {
		_adj = _i + (_i * 0.8);
		_adj = 0.5;
		_off = [-1.5,_adj,1.1];
		[_aircraft, "cargo_mem_2", _off, _mode] spawn fw_fnc_supplyDropBox;
	};
} else {
	// Vehicle drop cargo
	// Spawn and attach vehicles to memory points of the aircraft
	for [{_i= 1},{_i <= _amount},{_i = _i + 1}] do {
		_adj = _i + (_i * 0.8);
		_adj = 0.5;
		_off = [-1.5,_adj,1.1];
		private _vehicle = createVehicle [_vehicleClass, [0,0,1000], [], 0, "NONE"];
		_vehicle disableCollisionWith _aircraft;
		_vehicle hideObject true;
		_vehicle attachTo [_aircraft,_off];
		// Load vehicle inventory
		if (_vehicleLoadout >= 0) then {
			[_vehicle, _vehicleLoadout] execVM "loadouts\_vehicle_cargo_content.sqf";
		};
		// Apply texture if required
		if (count "_vehicleTexture" > 0) then {
			[_vehicle, _vehicleTexture] call BIS_fnc_initVehicle;
		};	
	};
};

// Calculating waypoints drop and end
private _wpDrop = [_target, 150,_dir] call BIS_fnc_relPos;
private _wpEnd = [_target, 2000, _dir] call BIS_fnc_relPos;


// Send aircraft to drop waypoint
_aircraft doMove _wpDrop;

// Open ramp once close to drop
waitUntil {(_aircraft distance2D _wpDrop) < 800 || !(alive _aircraft)};
_aircraft animate ["ramp_bottom",1];
_aircraft animate ["ramp_top",1];
_aircraft doMove _wpDrop;

// Drop attached boxes or vehicles
waitUntil {(_aircraft distance2D _wpDrop) < 150};
[_aircraft] spawn fw_fnc_supplyDropEject;
["Supply Drop delivered."] spawn fw_fnc_info;

// Send aircraft to end waypoint
waitUntil {(_aircraft distance2D _wpDrop) < (20 + (15 * _amount)) || !(alive _aircraft)};
_aircraft doMove _wpEnd;

// Close ramp
_aircraft animate ["ramp_bottom",0];
_aircraft animate ["ramp_top",0];

// Move to end point
_aircraft doMove _wpEnd;

// Wait until aircraft reaches end point and then delete aircraft
waitUntil{(_aircraft distance2D  _wpEnd) < 500 || !(alive _aircraft) || (CBA_MissionTime - _startTime > 360)};
[leader _group] call fw_fnc_deleteVehicle;


// Update supply ammo
SupplyDropAmmo = SupplyDropAmmo - _amount;
publicVariable 'SupplyDropAmmo';

// End message
["Supply Drop Mission completed."] spawn fw_fnc_info;
