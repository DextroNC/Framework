/*
	Parameters:
		<-- Group as Group

	Description:
		Removes all Tasks from Units in the Group

*/

// Parameter Init
params ["_group"];

// Remove existing Tasks
private _u = objNull;
{
	_u = _x;
	{
		_u removeSimpleTask _x;
	} forEach simpleTasks _x;
} forEach (units _group);