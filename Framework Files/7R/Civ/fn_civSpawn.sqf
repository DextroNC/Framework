/*
	Parameters:
		<-- Zone as Marker (String of Marker Name)
		<-- Civ Classnames as Array (may use Global-Variable instead)
		<-- Amount as Integer (max amount)
		<-- Opt: Suicide Bombers as Integer - default: 0
		<-- Opt: Sleeper as Integer - default : 0
		<-- Opt: Shooter as Integer - default : 0
		
		Description:
		Spawn Civilians randomly in an area which they either patrol, occupy houses or idle near roads. 
		In addition it also allows the spawning of suicide bombers.
		
		Example:
		nul = ["civ1",["LOP_CHR_Civ_Random"],8,0] spawn fw_fnc_civSpawn;

*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Check Unit Cap
if (count (allUnits-allPlayers) > SR_Unit_Cap) exitWith {diag_log "Unit Cap reached."};

// Parameter Init
params ["_zone", "_civs", "_total",["_bomber", 0],["_sleeper",0],["_shooter",0]];

// Inline Function
SR_CIV_OCCUPATION = {
	// Parameter Init
	params ["_zone", "_civs", "_total",["_bomber", 0],["_sleeper",0],["_shooter",0]];
	_zone setMarkerAlpha 0;
	private "_unit";
	private "_v";
	
	// Civilian Spawn
	 for [{_i=0}, {_i < _total}, {_i = _i + 1}] do {
		_type = _civs call BIS_fnc_selectRandom;
		_pos = [_zone, true] call CBA_fnc_randPosArea;
		_grp = createGroup civilian;
		_unit = _grp createUnit [_type, _pos,[],2,"NONE"];
		_unit setBehaviour "SAFE";
		// add Eventhandler to count Civilian Casulties
		_unit addEventHandler ["Killed", {
			params ["_dead"];
			_killer = _dead getVariable ["ace_medical_lastDamageSource", objNull];
			_murderer = name _killer;
			_name = name _dead;
			_str = SR_CC;
			_str = format [_str + "<br/>" + _name + " has been killed by " + _murderer + "."];
			SR_CC = _str;
			publicVariable "SR_CC";
		}]; 
		// Civ either Patrols, occupies Building or Idles
		switch (round random 5) do {
			case 1: {
				[_grp,_zone,5] spawn fw_fnc_civPatrol;
			};
			case 2: {
				_list = (position _unit) nearRoads 500;
				if (isNil "_list") exitWith {
					[_grp,_zone,5] spawn fw_fnc_civPatrol;
				};
				_v = _list call BIS_fnc_selectRandom;
				if (isNil "_v") exitWith {
					[_grp,_zone,5] spawn fw_fnc_civPatrol;
				};
				_pos = [position _v, 5, random 360] call BIS_fnc_relPos;
				_unit setPos _pos;
				};
			default {
				nul = [_pos, [_unit], 500, true, true] execVM "scripts\Zen_OccupyHouse.sqf"
			};
		};
	};
	// Suicide Bomber Spawn
	iF (_bomber > 0) then {
		for [{_i=0}, {_i < _bomber}, {_i = _i + 1}] do {
			_type = _civs call BIS_fnc_selectRandom;
			_pos = [_zone, true] call CBA_fnc_randPosArea;
			_grp = createGroup civilian;
			_unit = _grp createUnit [_type, _pos,[],2,"NONE"];
			_unit setBehaviour "SAFE";
			_unit addItem "HandGrenade";
			[_grp,_zone,5] spawn fw_fnc_civPatrol;
			[_unit] spawn fw_fnc_civBomber;
		};
	};
	// Shooter Spawn
	iF (_shooter > 0) then {
		for [{_i=0}, {_i < _shooter}, {_i = _i + 1}] do {
			_type = _civs call BIS_fnc_selectRandom;
			_pos = [_zone, true] call CBA_fnc_randPosArea;
			_grp = createGroup civilian;
			_unit = _grp createUnit [_type, _pos,[],2,"NONE"];
			_unit setBehaviour "SAFE";
			[_grp,_zone,5] spawn fw_fnc_civPatrol;
			[_unit, 2] spawn fw_fnc_civSleeper;
		};
	};
	// Sleeper Spawn
	iF (_sleeper > 0) then {
		for [{_i=0}, {_i < _sleeper}, {_i = _i + 1}] do {
			_type = _civs call BIS_fnc_selectRandom;
			_pos = [_zone, true] call CBA_fnc_randPosArea;
			_grp = createGroup civilian;
			_unit = _grp createUnit [_type, _pos,[],2,"NONE"];
			_unit setBehaviour "SAFE";
			[_grp,_zone,5] spawn fw_fnc_civPatrol;
			[_unit, 1] spawn fw_fnc_civSleeper;
		};
	};
};

// Exec Inline Function
[_zone, _civs, _total,_bomber,_sleeper,_shooter] call SR_CIV_OCCUPATION;