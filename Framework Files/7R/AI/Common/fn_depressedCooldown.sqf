/*
	Parameters:
		<-- Group as Group
		<-- Cooldown as Integer
	
	Return:
	--> None
		
	Description:
		Group will recover after cooldown
		
	Example:
		[_group] spawn fw_fnc_depressedCooldown;
*/
// Parameter Init
params ["_group","_cooldown"];

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
},_group, random [(_cooldown-20),_cooldown,(_cooldown+20)]] call CBA_fnc_waitAndExecute;

// Stop Fleeing
[{
	{
		_x allowFleeing 0;
	}forEach units _this;
},_group, random [60,90,120]] call CBA_fnc_waitAndExecute;