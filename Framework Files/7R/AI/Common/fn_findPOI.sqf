/*
	Parameters:
		<-- Group as Group
		<-- Optional: Range as Integer - default: 750

	Return:
	--> Clostest Point of Interst as Object

	Description:
		Finds the clostest point of interst around a group with insufficient amount of Patrols in the area around.
		

	Example:
		_return = [group, 1000] spawn fw_fnc_findPOI;
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
private _assignedGroups = _x getVariable ["SR_AssignedGroups",[]];
if (count _assignedGroups > 0) then {
	{
		// Check assigned Groups
		if ({!alive _x} count _assignedGroups < 4) exitWith {
			_poi = _x; 
			_poi setVariable ["SR_AssignedGroups",(_assignedGroups pushBackUnique _group)]; 
			true
		}; 
		false
	} count _poiArray;
};

// Debug
if (SR_Debug) then {systemChat format ["%1 identified a POI at %2", _group, (mapGridPosition _return)];};

// Return
_return