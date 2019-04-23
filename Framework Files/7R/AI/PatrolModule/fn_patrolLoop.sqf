/*
	Parameters:
		<-- None

	Description:
		Patrol Script Main Loop

*/

// Server Only Exec
if (!isServer) exitWith {};

// Main Loop - State Machine
private _offCombatStateMachine = [{SR_PatrolUnits select {!(_x getVariable ["SR_State", "PATROL"] isEqualTo "COMBAT")}}, true] call CBA_statemachine_fnc_create;
[_offCombatStateMachine, {

    // Remove Dead Groups
    [_this] spawn fw_fnc_removeDeadGroups;

    // Check if unit requires Order
    if (count waypoints _this < 2) then {
        // Store Unit size
        _this setVariable ["SR_GroupSize", (count (units _this))];

        // Select Order based on Mode
        switch (_this getVariable ["SR_PatrolMode",""]) do {
            // Patrol Order
            case "P": {
                // Create Random Patrol Point
                [_this,[_this] call fw_fnc_getRandomPos, 25, "MOVE", "SAFE", "YELLOW", "LIMITED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is patrolling %2", _this, (mapGridPosition _position)];};
            };
            // Garrison Order
            case "G": {
                // Create Garrison Waypoint and lock it
                _this addWaypoint [[_this] call fw_fnc_getRandomPos, 0] setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";
                _this lockWP true;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is garrison %2", _this, (mapGridPosition _position)];};
            };
            // Hold Order
            case "H": {
                // Create Garrison Waypoint and lock it
                [_this,[_this] call fw_fnc_getRandomPos, 25, "HOLD", "SAFE", "YELLOW", "LIMITED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;
                _this lockWP true;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is holding %2", _this, (mapGridPosition _position)];};
            };
            // Reinforcement Order
            case "R": {
                // Exec Reinforcement Function
                [_this] spawn fw_fnc_reinforce;

           };
        };
    };
}, {deleteWaypoint [_this, 1];}, {}, "OffCombatLoop"] call CBA_statemachine_fnc_addState;

private _combatStateMachine = [{SR_PatrolUnits select {(behaviour (leader _x) == "COMBAT") && !(_x getVariable ["SR_Depressed", false])}}, true] call CBA_statemachine_fnc_create;
[_combatStateMachine, {

    // If Group has suffered substancial losses then...
    if ([_this, 45] call fw_fnc_hasLoss) then {
        if (random 100 < SR_Charge) exitWith {
            _this setVariable ["SR_Depressed", true];
            // Each Group member supressive the nearest enemy
            {
                [_x] spawn fw_fnc_suppress;
            }forEach units _this;
            // Group does not flee
            _this allowFleeing 0; 
            // Debug
            if (SR_Debug) then {systemChat format ["%1 is charging", _this];};
        };
        if (random 100 < SR_Flee) exitWith {
            _this setVariable ["SR_Depressed", true];
            _this allowFleeing 1;
            // Debug
            if (SR_Debug) then {systemChat format ["%1 is fleeing", _this];};
        };
        if (random 100 < SR_Surrender) exitWith {
            _this setVariable ["SR_Depressed", true];
            // If enemies are close than surrender else free
            if (((leader _this) findNearestEnemy (leader _this)) distance2d (position leader _this) < 65) then {
                {   
                    [_x] spawn fw_fnc_surrender;
                }forEach (units _this);
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is surrendering", _this];};
            } else {
                _this allowFleeing 1;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is failed surrender", _this];};
            };
        };
    };
}, {}, {
    // Once Depressed, reset after 4 min
    [this] spawn fw_fnc_depressedCooldown;

}, "CombatLoop"] call CBA_statemachine_fnc_addState;