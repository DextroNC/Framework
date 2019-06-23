/*
	Parameters:
		<-- None

	Description:
		Cleans up corpses after cooldown if no player is close

*/

// Server Only Exec
if (!isServer) exitWith {};

// Main Loop - State Machine
private _cleanUpStateMachine = [{allDeadMen select {!(_x getVariable ["SR_NoRemoval", false])}}, true] call CBA_statemachine_fnc_create;
[_cleanUpStateMachine, {

	// Check how long the unit is Dead (death for longer than 5 min)
	if (((_this getVariable ["SR_TimeOfDeath",0]) + 300) < CBA_missionTime) then {
		// Check if no player is close
		if ({_x distance2d _this < 50} count allPlayers == 0) then {
			// Remove Corps
			deleteVehicle _this;
		};
	};

}, {_this setVariable ["SR_TimeOfDeath",CBA_missionTime]}, {}, "cleanUpLoop"] call CBA_statemachine_fnc_addState;
