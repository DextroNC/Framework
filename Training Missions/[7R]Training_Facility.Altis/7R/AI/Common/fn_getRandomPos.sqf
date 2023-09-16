/*
	Parameters:
		<-- Marker as String or Group as Group
		<-- Optional: Ground as Boolean (if true only position on ground)
	
	Return:
	--> Position as Position
		
	Description:
		Selects a random Position inside the Patrol Zone
		
	Example:
		_return = ["P0"] call fw_fnc_getRandomPos;
*/
// Parameter Init
params ["_input",["_ground",false]];
_return = [];
_area = [];

// Check if Input is a String
if (typeName _input == "STRING") then {
	// Add Markername from Input as Area for Random Pos
	_area pushBack _input;
}
// Else Input is Group
 else {
	 // Get Group Patrol Zone
 	_area pushBack ((_input getVariable ["SR_PatrolModifier",[]]) select 0);
};

// If Marker is not an Area Marker -> Return Marker Position
if (!(markerShape (_area select 0) == "RECTANGLE")) exitWith {
		_return = markerPos (_area select 0); 
		_return
};

// Check if Position has to be on Ground
if (_ground) then {
	// Get Random Pos in Area on Ground
	_return = [_area, [],{!surfaceIsWater _this}] call BIS_fnc_randomPos;
} else {
	// Get Random Pos in Area
	_return = [_area] call BIS_fnc_randomPos;
};

// Return Position
_return