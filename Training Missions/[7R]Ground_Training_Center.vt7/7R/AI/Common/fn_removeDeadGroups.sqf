/*
	Parameters:
		<-- Group as Group
	
	Return:
	--> None
		
	Description:
		Removes Dead Groups from Statemachine
		
	Example:
		[_group,] spawn fw_fnc_removeDeadGroups;
*/
// Parameter Init
params ["_group"];

// Remove Dead Groups from Loop
if (count units _group == 0) then {
	private _index = SR_PatrolUnits find _group;
	SR_PatrolUnits deleteAt _index;
	// Debug
	if (SR_Debug) then {systemChat format ["%1 removed from Loop", _group];};
};