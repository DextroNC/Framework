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
if (!isNil "HC") then {
	if (HC in allPlayers && isServer) exitWith {};
};

// Check Unit Cap
if (count (allUnits - allPlayers) > SR_Unit_Cap) exitWith {diag_log "Unit Cap reached."};

// Parameter Init
params ["_zone", "_classnames", "_civilians",["_bomber", 0],["_sleeper",0],["_shooter",0]];

// Spawn Units
{

	private _count  = _x;
	for [{_i = 1}, {_i <= _count}, {_i = _i + 1}] do {

		// Create Unit
		private _mode = ["civilian","bomber","sleeper","shooter"] select _forEachIndex;
		private _position = [_zone, true] call CBA_fnc_randPosArea;
		private _roll = round (random 4);
		private _unit = [selectRandom _classnames, _position] call fw_fnc_civUnitSpawn;
		switch (_mode) do {
			// Bomber
			case "bomber": {
				[_unit, _zone] spawn fw_fnc_civBomber;
			};
			// Sleeper
			case "sleeper": {
				[_unit, 2, _zone] spawn fw_fnc_civSleeper;
			};
			// Shooter
			case "shooter": {
				[_unit, 1, _zone] spawn fw_fnc_civSleeper;
			};
			// Civilian
			default {
				[_unit] spawn fw_fnc_civEventhandler;
				// Select civilian action
				switch (_roll) do {
					// Occupy buildings
					case 1: {
						[_position, [_unit], 250] spawn fw_fnc_garrison;
					};
					// Stand roadside
					case 2: {
						private _roads = _position nearRoads 250;
						// Check if roads nearby, if not patrol
						if (count _roads > 0) then {
							_unit setPos (getPos (selectRandom _roads));
							// Animate Civilian
							[_unit, selectRandom [3,8,15,16,18], true] spawn fw_fnc_ambientAnimation;
						} else {
							[group _unit, _zone, 4] spawn fw_fnc_civPatrol;
						};
					};
					// Patrol area
					default {
						[group _unit, _zone, 4] spawn fw_fnc_civPatrol;
					};
				};
			};
		};
	};
} forEach [_civilians, _bomber, _sleeper , _shooter];
