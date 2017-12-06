/*
	Parameters:
		<-- Target Marker Name as String
		<-- Spawn Marker Name as string
		<-- Airplane Type as String 
		<-- Callsign as String
		<-- Amount of Boxes as Integer (1-3 boxes)
		<-- Type of Supply Drop as Integer (1: Infantry, 2: Vehicle Supply, 3: Fortification Supplies)

*/

// Parameter Init
params ["_target","_spawn","_type","_callsign","_amount","_mode"];

_target = markerPos _target;
_spawn = markerPos _spawn;
if (isNil "_mode") then {_mode = 1};

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "SupplyDropLock") then {SupplyDropLock = false; publicVariable "SupplyDropLock";};
if (isNil "SupplyDropAmmo") then {SupplyDropAmmo = 5; publicVariable "SupplyDropAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (SupplyDropLock) exitWith {
	[[SR_Side, "HQ"],"Negative: No Supply Drop available. Other Missions in progress."] remoteExec ["sideChat", 0];
};
if (SupplyDropAmmo <= 0) exitWith {
	[[SR_Side, "HQ"],"Negative: No Supply Drop available. Out of Resources."] remoteExec ["sideChat", 0];
};
if (_target isEqualto [0,0,0]) exitWith {
	[[SR_Side, "HQ"],"No Supply Drop Zone designated."] remoteExec ["sideChat", 0];
};

// Lock
SupplyDropLock = true;
publicVariable "SupplyDropLock";

// Confirmation Message + Combat Log
_str = str(_amount) + "x Supply Drop to Grid " + (mapGridPosition _target) + ".";
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", 0];
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

// Spawn and Attach Boxes in Cargo
for [{_i= 1},{_i <= _amount},{_i = _i + 1}] do {
	_adj = _i + (_i * 0.8);
	_adj = 0.5;
	_off = [-1.5,_adj,1.1];
	[_planeacc, "cargo_mem_2", _off, _mode] spawn fw_fnc_supplyDropBox;
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

// Send Plane to End Pos
_dropdist = 20 + (15 * _amount); 
waitUntil {(_planeacc distance2D _wp) < _dropdist};
_planeacc doMove _wpPos;

[[SR_Side, "HQ"],"Supply Drop delivered."] remoteExec ["sideChat", 0];

// Close Ramp
_planeacc animate ["ramp_bottom",0];
_planeacc animate ["ramp_top",0];

_planeacc doMove _wpPos;

// Wait until End Pos Reached
waitUntil{(_planeacc distance2D  _wpPos) < 500 || !(alive _planeacc)};
[leader _planeGroup] call fw_fnc_deleteVehicle;

// Release Lock
waitUntil {!alive _planeacc};
SupplyDropLock = false;
publicVariable 'SupplyDropLock';

// Update Available Supply Amount
SupplyDropAmmo = SupplyDropAmmo - _amount; 
publicVariable 'SupplyDropAmmo';

// End Message
[[SR_Side, "HQ"],"Supply Drop Mission completed."] remoteExec ["sideChat", 0];