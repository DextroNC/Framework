/*
	Parameters:
		<-- Terminal as Object
		<-- Wall as Object
		<-- Remove Cover as Boolean (true == delete Cover)
		
	Description:
		Creates a Cover for the Reaction Shooting Course
		
	Example:
		nul = [r2_p1_t,r2_p1,false] spawn fw_fnc_rcCover;

*/
// Parameter init
params ["_terminal","_wall","_mode"];
_class = "Land_CncWall1_F";

// Mode Selection
if (!_mode) then {
	// Create and Attach Cover
	_cover = _class createVehicle [0,0,0];
	_cover setDir (getDir _wall);
	_cover attachTo [_wall, [0,-20,0]];
	_terminal setVariable ["SR_Cover", true, true];
} else {	
	// Delete Attached Cover
    {
      detach _x;
	  deleteVehicle _x;
    } forEach attachedObjects _wall;
	_terminal setVariable ["SR_Cover", false, true];
};

