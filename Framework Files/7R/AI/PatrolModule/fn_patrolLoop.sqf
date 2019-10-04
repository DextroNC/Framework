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
                 private _position = [];
                // Create Random Patrol Point
                private _poi = [_this] spawn fw_fnc_findPOI;
                if (!isNull _poi) then {
                    _position = [[getPos _poi, 150], [],{!surfaceIsWater _this}] call BIS_fnc_randomPos;
                } else {
                    _position = [_this] call fw_fnc_getRandomPos;
                };
                [_this,_position, 25, "MOVE", "SAFE", "YELLOW", "LIMITED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is patrolling %2", _this, (mapGridPosition _position)];};
            };
            // Garrison Order
            case "G": {
                // Create Garrison Waypoint and lock it
                private _position = [_this] call fw_fnc_getRandomPos;
                _this addWaypoint [_position, 0] setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";
                _this lockWP true;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is garrison %2", _this, (mapGridPosition _position)];};
            };
            // Hold Order
            case "H": {
                // Create Hold Waypoint and lock it
                private _position = [_this] call fw_fnc_getRandomPos;
                [_this,_position, 25, "HOLD", "SAFE", "YELLOW", "LIMITED",selectRandom ["STAG COLUMN", "COLUMN", "DIAMOND","FILE"], "deleteWaypoint [group this, 1]", [3,6,9]] call CBA_fnc_addWaypoint;
                _this lockWP true;
                // Debug
                if (SR_Debug) then {systemChat format ["%1 is holding %2", _this, (mapGridPosition _position)];};
            };
            // Reinforcement Order
            case "R": {
                // Exec Reinforcement Function
                [_this] spawn fw_fnc_reinforce;

           };
            // Rampage Order
            case "RP": {
                // Exec Rampage Function
                [_this] spawn fw_fnc_rampageCharge;

           };
        };

        // Force Flashlights
        if (SR_AI_forceFlashlight) then {
            _this enableGunLights "ForceOn";
        };
    };
}, {deleteWaypoint [_this, 1];}, {}, "OffCombatLoop"] call CBA_statemachine_fnc_addState;

// Combat State Loop
private _combatStateMachine = [{SR_PatrolUnits select {(_x getVariable ["SR_State", "PATROL"] isEqualTo "COMBAT") && !(_x getVariable ["SR_Depressed", false])}}, true] call CBA_statemachine_fnc_create;
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

// Artillery Support Loop
if (isNil "AI_ART_Units") then {AI_ART_Units = [];};
private _supportStateMachine = [{SR_PatrolUnits select {!(_x getVariable ["SR_Depressed", false]) && (!isNull ([_x] call fw_fnc_artilleryCheck))}}, true] call CBA_statemachine_fnc_create;
[_supportStateMachine, {

    // Leave Loop if on cooldown
    if (SR_ArtilleryCooldown) exitWith {};

    // Get Unit Target Querry
    private _leader = leader _this;
    private _group = _this;
  
    // Find Target
    _target = _leader findNearestEnemy position _leader;
    if (_target == objNull) exitWith {};
    private _targetKnowledge = _leader knowsAbout _target;

    // Minimum Target Knowledge require to call artillery
    if ( _targetKnowledge < 1.5) exitWith {};
    hint format ["%1", _targetKnowledge];
    // Get Available Artillery
    _artillery  = [_group] call fw_fnc_artilleryCheck;

    // Rather call for flares during night time (added Random Chance to compensate for high knowledge)
    if (sunOrMoon < 0.5 && random 1 > 0.3) then {

        // Request Flares
            [_artillery,2,_target] spawn fw_fnc_artilleryCall;
                
    // Daytime Evaluation
    } else {

        // If Target to close use smoke else HE
        if (leader _group distance2D _target < 150) then {

            // Request Smoke
            [_artillery,1,_target] spawn fw_fnc_artilleryCall;
        } else {
            // Request HE
            [_artillery,0,_target] spawn fw_fnc_artilleryCall;
        };
    };

    // Temporary Lock Artillery
    SR_ArtilleryCooldown = true;

    // Unlock Artillery
    [{
        SR_ArtilleryCooldown = false;
    },objNull, 5] call CBA_fnc_waitAndExecute;

    // Debug
    if (SR_Debug) then {systemChat format ["%1 providing artillery to %2", _artillery, (mapGridPosition _targetPos)];}; 

}, {}, {}, "SupportLoop"] call CBA_statemachine_fnc_addState;


