/*
	Parameters:
		<-- Group as Group
		<-- Optional (default: 200): Cooldown in seconds as Integer, varied by 20 either way
		<-- Optional (default: true): Fled as Boolean, whether to stop the group fleeing
	
	Return:
	--> None
		
	Description:
		Group will recover after cooldown
		SR_State is left to VCOM: a group still fighting rejoins the combat loop with a fresh loss baseline
		
	Example:
		[_group] spawn fw_fnc_depressedCooldown;
*/
// Parameter Init
params ["_group",["_cooldown",200],["_fled",true]];

// Cooldown and Reset, in one step so the group cannot rejoin the loops while it is still fleeing
[{
	params ["_group","_fled"];
	// Reset Depressed Status
	_group setVariable ["SR_Depressed", false];
	// Reset Groupsize for loss evaluation
	_group setVariable ["SR_GroupSize", (count (units _group))];
	_group setVariable ["SR_MoraleCheckAlive", nil];
	// Stop Fleeing, on the machine that owns the group (the HC for HC-spawned AI), like the flee in fn_patrolLoop.sqf
	if (_fled) then {[_group, 0] remoteExec ["allowFleeing", leader _group];};
	// Debug
	if (SR_Debug) then {systemChat format ["%1 reset depressed", _group];}; 
},[_group,_fled], random [(_cooldown-20),_cooldown,(_cooldown+20)]] call CBA_fnc_waitAndExecute;