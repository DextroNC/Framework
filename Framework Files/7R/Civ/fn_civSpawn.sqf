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
params ["_zone", "_classnames", "_civilians",["_bomber", 0],["_sleeper",0],["_shooter",0]];

// Inline Create Civilian Function
SR_Civ_Create = {
	// Parameter Init
	params ["_position","_classnames"];
	
	// Create Civ
	private _group = createGroup civilian;
	private _unit = _group createUnit [(selectRandom _classnames), _position,[],2,"NONE"];
	_group setVariable ["Vcm_Disable",true];
	_unit setBehaviour "SAFE";

	// Return
	_unit
};

// Spawn Civilians
for [{_i=1}, {_i <= _civilians}, {_i = _i + 1}] do {
	private _position = [_zone, true] call CBA_fnc_randPosArea;
	private _roll = round 5;
	private _roads = _position nearRoads 250;
	private _task = false;

	// Create Civilians
	private _unit = [_position,_classnames] call SR_Civ_Create;
	[_unit] spawn fw_fnc_civEventhandler;

	// Roadside 
	if (_roll < 2 && count _roads > 0) then {
		_unit setPos (selectRandom _roads);
		[_unit,selectRandom ["WATCH_1","WATCH_2","LISTEN_CIV","LISTEN_TO_RADIO","NAVIGATE"],true] spawn Achilles_fnc_ambientAnim;
		_task = true;
	};
		
	// Occupation
	if (_roll > 4 && _task) then {
		[_position, [_unit], 250] spawn fw_fnc_garrison;
		_task = true;
	};	

	if (!_task) then {
		[group _unit,_zone,5] spawn fw_fnc_civPatrol;
	};
};

// Suicide Bomber Spawn
if (_bomber > 0) then {
	for [{_i=1}, {_i <= _bomber}, {_i = _i + 1}] do {
		private _position = [_zone, true] call CBA_fnc_randPosArea;
		
		// Create Civilians
		private _unit = [_position,_classnames] call SR_Civ_Create;

		// Execute Bomber Actions
		_unit addItem "rhs_mag_rgd5";
		[group _unit,_zone,5] spawn fw_fnc_civPatrol;
		[_unit] spawn fw_fnc_civBomber;
	};
};

// Shooter Spawn
if (_shooter > 0) then {
	for [{_i=1}, {_i <= _shooter}, {_i = _i + 1}] do {
		private _position = [_zone, true] call CBA_fnc_randPosArea;
		
		// Create Civilians
		private _unit = [_position,_classnames] call SR_Civ_Create;

		// Execute Shooter Actions
		[group _unit,_zone,5] spawn fw_fnc_civPatrol;
		[_unit, 2] spawn fw_fnc_civSleeper;
	};
};

// Sleeper Spawn
if (_sleeper > 0) then {
	for [{_i=1}, {_i <= _sleeper}, {_i = _i + 1}] do {
		private _position = [_zone, true] call CBA_fnc_randPosArea;
		
		// Create Civilians
		private _unit = [_position,_classnames] call SR_Civ_Create;

		// Execute Sleeper Actions
		[group _unit,_zone,5] spawn fw_fnc_civPatrol;
		[_unit, 1] spawn fw_fnc_civSleeper;
	};
};