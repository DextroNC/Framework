/*
	Parameters:
		<-- Zone as Marker (String of Marker Name)
		<-- Civ Classnames as Array (may use Global-Variable instead)
		<-- Amount as Integer (max amount)
		<-- Opt: Suicide Bombers - default: 0
		
		Description:
		Spawn Civilians randomly in an area which they either patrol, occupy houses or idle near roads. 
		In addition it also allows the spawning of suicide bombers.
		
		Example:
		nul = ["civ1",["LOP_CHR_Civ_Random"],8,0] spawn fw_fnc_civSpawn;

*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Inline Function
SR_CIV_OCCUPATION = {
	// Parameter Init
	params ["_zone", "_civs", "_total",["_bomber", 0]];
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
			_killer = _dead getVariable ["ace_medical_lastDamageSource", "unknown"];
			_name = name _dead;
			_str = SR_CC;
			_str = format [_str + "<br/>" + str (_name) + " has been killed by " + str (_killer) + "."];
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
			[_grp,_zone,5] spawn fw_fnc_civPatrol;
			[_unit] spawn fw_fnc_civBomber;
		};
	};
};

// Exec Inline Function
[_this select 0, _this select 1, _this select 2,_this select 3] call SR_CIV_OCCUPATION;