/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as string
		<-- Airplane Type as String
		<-- Callsign as String
		<-- Amount of Boxes as Integer (1-3 boxes)
		<-- Optional: Type of Supply Drop as Integer (1: Infantry, 2: Vehicle Supply, 3: Fortification Supplies), default : 1
		<-- Optional: Vehicle Array [_vehicleType,_vehicleLoadout]
	Decription:
		Init Supply Drop Function

*/

// Parameter Init
params [["_targetMarker","SupplyDrop"],["_spawnMarker","STARTSPAWN"],["_type","RHS_C130J"],["_callsign",""],["_amount",1],["_mode",0],["_vehicle",[]]];
private _target = [_targetMarker] call fw_fnc_findLocation;
private _spawn = [_spawnMarker] call fw_fnc_findLocation;
private _msg = "Supply";
private _vehicleClass = "";
private _vehicleLoadout = -1;
// Check if Vehicle Drop
if (count _vehicle > 0) then {
	//_type = "globemaster_c17_altus";
	_vehicleClass = _vehicle select 0;
	_vehicleLoadout = _vehicle select 1;
	_msg = "Vehicle";
};

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "SupplyDropLast") then {SupplyDropLast = -30; publicVariable "SupplyDropLast";};
if (isNil "SupplyDropAmmo") then {SupplyDropAmmo = 12; publicVariable "SupplyDropAmmo";};

if (CBA_MissionTime - SupplyDropLast < 30) exitWith {
	["Negative: No Supply Drop available. Other Missions in progress.","SD: Currently Busy"] spawn fw_fnc_info;
};
if (SupplyDropAmmo <= 0) exitWith {
	["Negative: No Supply Drop available. Out of Resources.","SD: Out of Resources"] spawn fw_fnc_info;
};
if (_target isEqualto [0,0,0]) exitWith {
	["No Supply Drop Zone designated.","SD: No Drop Zone"] spawn fw_fnc_info;
};

// Lock
private _startTime = CBA_MissionTime;
SupplyDropLast = _startTime;
publicVariable "SupplyDropLast";

// Confirmation Message + Combat Log
_str = str(_amount) + "x " + _msg + " Drop to Grid " + (mapGridPosition _target);
[_str,_str] spawn fw_fnc_info;
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent;

// Calculating Spawn Point
_dir = _spawn getDir _target;
_dirSpawn = _dir - 180;
_spawnPos = [_spawn, 2000,_dirSpawn] call BIS_fnc_relPos;

// Calculating Drop Point WP
_wp = [_target, 150,_dir] call BIS_fnc_relPos;

// Spawn and Init Aircraft
_plane = [_spawnPos, _dir, _type, SR_Side] call bis_fnc_spawnVehicle;
_planeGroup = _plane select 2;
_planeacc = _plane select 0;
_planeacc engineOn true;
_planeacc allowDamage false;
_planeGroup setBehaviour "CARELESS";
leader _planeGroup setGroupIdGlobal [_callsign];
{
	_x disableAi "FSM";
	_x disableAi "TARGET";
	_x disableAi "AUTOTARGET";
	_x disableAi "AUTOCOMBAT";
	_x disableAi "COVER";
	_x disableAi "SUPPRESSION";
	_x setVariable ["asr_ai_exclude", true]
}forEach units _planeGroup;

// Cargo Supply Drop
if (count _vehicle == 0) then {
	// Spawn and Attach Boxes in Cargo
	for [{_i= 1},{_i <= _amount},{_i = _i + 1}] do {
		_adj = _i + (_i * 0.8);
		_adj = 0.5;
		_off = [-1.5,_adj,1.1];
		[_planeacc, "cargo_mem_2", _off, _mode] spawn fw_fnc_supplyDropBox;
	};
} else {
	// Vehicle Drop
	_veh = createVehicle [_vehicleClass, [0,0,1000], [], 0, "NONE"];
	_veh disableCollisionWith _planeacc;
	if (_vehicleLoadout >= 0) then {
		[_veh, _vehicleLoadout] execVM "loadouts\_vehicle_cargo_content.sqf";
	};
	_veh attachTo [_planeacc,[0,0,4]];
};

// Calculate Waypoint and send Aircraft
_wpPos = [_target, 2000, _dir] call BIS_fnc_relPos;
_planeacc doMove _wp;

// Open Ramp
waitUntil {(_planeacc distance2D _wp) < 800};
_planeacc animate ["ramp_bottom",1];
_planeacc animate ["ramp_top",1];
_planeacc doMove _wp;

// Drop
waitUntil {(_planeacc distance2D _wp) < 150};
[_planeacc] spawn fw_fnc_supplyDropEject;
["Supply Drop delivered."] spawn fw_fnc_info;

// Send Plane to End Pos
_dropdist = 20 + (15 * _amount);
waitUntil {(_planeacc distance2D _wp) < _dropdist};
_planeacc doMove _wpPos;

// Close Ramp
_planeacc animate ["ramp_bottom",0];
_planeacc animate ["ramp_top",0];

// Move to end point
_planeacc doMove _wpPos;

// Wait until End Pos Reached
waitUntil{(_planeacc distance2D  _wpPos) < 500 || !(alive _planeacc) || (CBA_MissionTime - _startTime > 360)};
[leader _planeGroup] call fw_fnc_deleteVehicle;


// Update Available Supply Amount
SupplyDropAmmo = SupplyDropAmmo - _amount;
publicVariable 'SupplyDropAmmo';

// End Message
["Supply Drop Mission completed."] spawn fw_fnc_info;
