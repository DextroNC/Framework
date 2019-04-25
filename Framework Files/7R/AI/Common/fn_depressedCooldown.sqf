/*
	Parameters:
		<-- Group as Group
	
	Return:
	--> None
		
	Description:
		Group will recover after cooldown
		
	Example:
		[_group] spawn fw_fnc_depressedCooldown;
*/
// Parameter Init
params ["_group"];

// Cooldown and Reset
[{
	// Reset Depressed Status
	_this setVariable ["SR_Depressed", false];
	// Reset Groupsize for loss evaluation
	_this setVariable ["SR_GroupSize", (count (units _this))];
	// Reset to offCombat
	_this setVariable ["SR_State", "PATROL"];
	// Debug
	if (SR_Debug) then {systemChat format ["%1 reset depressed", _this];}; 
},_group, random [200,220,240]] call CBA_fnc_waitAndExecute;

