/*
	Parameters:
		<-- None

	Description:
		Patrol Script Main Loop

*/

// Server Only Exec
if (!isServer) exitWith {};

// Main Loop - State Machine
private _stateMachine = [{SR_PatrolUnits select {!behaviour leader _x == "COMBAT"}}, true] call CBA_statemachine_fnc_create;
[_stateMachine, {

    // Remove Dead Groups from Loop
    if (!alive _x) exitWith {
        private _index = SR_PatrolUnits find _x;
        SR_PatrolUnits deleteAt _index;
    };

    // Check if unit requires Order
    if (count waypoints _x == 0) then {
        // Select Order based on Mode
        switch (_x getVariable ["SR_PatrolMode",""]) do {
            // Patrol Order
            case "P": {
                private _area = (_x getVariable ["SR_PatrolModifier"]) select 0;
                private _position = [_area, ["ground"]] call BIS_fnc_randomPos;
                 [_x, _position, 25, "MOVE", "SAFE", "YELLOW", "LIMETED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "", [3,6,9]] call CBA_fnc_addWaypoint;
            };
            // Garrison Order
            case "G": {
                 private _position = (_x getVariable ["SR_PatrolModifier"]) select 0;
                _x addWaypoint [_position, 0] setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";
                _x lockWP true;
            };
            // Reinforcement Order
            case "R": {
                private _area = (_x getVariable ["SR_PatrolModifier"]) select 0;
                private _position = [_area, ["ground"]] call BIS_fnc_randomPos;
                private = _enemy _x findNearestEnemy _position;
                if (objNull _enemy) then {_enemy = _position};
                [_x, _enemy, 50] call CBA_fnc_taskAttack;
            };
        };
    };
}, {}, {}, "MainLoop"] call CBA_statemachine_fnc_addState;