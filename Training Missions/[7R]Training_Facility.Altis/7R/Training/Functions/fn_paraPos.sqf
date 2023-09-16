/*
	Parameters:
		<-- Markername as String
		<-- Distance to Marker as Integer
		<-- Directrion from Marker as Integer

	Return:
		--> Array of Positions

	Description:
		Creates Array of Drop Position and Approach Position

*/

// Parameter Init
params ["_marker","_dist","_dir"];

// Create Array with DropPos and ApproachPos
_dropPos = [(markerPos _marker), _dist, _dir] call BIS_fnc_relPos;
_appPos = [_dropPos, 100, (_dir + 45)] call BIS_fnc_relPos;
_return = [_dropPos,_appPos];
_return
