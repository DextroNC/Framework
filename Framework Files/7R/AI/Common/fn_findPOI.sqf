/*
	Parameters:
		<-- Group as Group
		<-- Optional: Range as Integer - default: 750

	Return:
	--> Clostest Point of Interst as Object

	Description:
		Finds the clostest point of interst around a group with insufficient amount of Patrols in the area around.
		

	Example:
		_return = [group, 1000] call fw_fnc_findPOI;
*/
// Parameter Init
params ["_group", ["_range",750]];
private _leader = leader _group;
private _return = objNull;
// Get POIs around group leader within range
private _poiArray = nearestObjects [_leader, ["ACE_Construction_Base"], _range];

// Exit if no POI near
if (count _poiArray == 0) exitWith {_return};

// Check if other groups are assigned to POI
private _poi = objNull;
private _assignedGroups = [];

nul = {
	// Check assigned Groups
	_assignedGroups = _x getVariable ["SR_AssignedGroups",[]];
	
	if (count _assignedGroups >= 0) then {
		if ({count (units _x) > 0} count _assignedGroups < 4 || _group in _assignedGroups) exitWith {
			_poi = _x; 
			_assignedGroups pushBackUnique _group;
			_poi setVariable ["SR_AssignedGroups",_assignedGroups,true]; 
			_return = _poi;
			true
		}; 
	};
	false
} count _poiArray;


// Debug
if (SR_Debug) then {systemChat format ["%1 identified a POI at %2", _group, (mapGridPosition getPos _return)];};

// Return
_return