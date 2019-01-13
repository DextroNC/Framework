/*
	Parameters:
		<-- None

	Description:
		Patrol Script Main Loop

*/

// Server Only Exec
if (!isServer) exitWith {};

// Main Loop - State Machine
private _stateMachine = [{SR_PatrolUnits select {!(behaviour (leader _x) == "COMBAT")}}, true] call CBA_statemachine_fnc_create;
[_stateMachine, {

    // Remove Dead Groups from Loop
    if (count units _this == 0) exitWith {
        private _index = SR_PatrolUnits find _this;
        SR_PatrolUnits deleteAt _index;
    };

    // Check if unit requires Order
    if (count waypoints _this < 2) then {
        // Select Order based on Mode
        switch (_this getVariable ["SR_PatrolMode",""]) do {
            // Patrol Order
            case "P": {
                 [_this,[_this] call fw_fnc_getRandomPos, 25, "MOVE", "SAFE", "YELLOW", "LIMITED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "", [3,6,9]] call CBA_fnc_addWaypoint;
            };
            // Garrison Order
            case "G": {
                _this addWaypoint [[_this] call fw_fnc_getRandomPos, 0] setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";
                _this lockWP true;
            };
            // Reinforcement Order
            case "R": {
                private _position = [_this] call fw_fnc_getRandomPos;
                private _enemy = leader _this findNearestEnemy _position;
                if (isNull _enemy) then {_enemy = _position;};
                [leader _this, _enemy, 50] call CBA_fnc_taskAttack;
            };
        };
    };
}, {}, {}, "MainLoop"] call CBA_statemachine_fnc_addState;