/*
	Parameters:
		<-- Shooting Range as Marker (Area)
		
	Removes all Targets and Cover Objects which have been spawned at one range.
		
	Example:
		nul = ["range1"] spawn fw_fnc_cleanUp;

	
*/

// Parameter Init
params ["_marker"];
_mSize = markerSize _marker;
_pos = markerPos _marker;

// Create Array with all Targets and Cover Objects
_list = [];
_list append (_pos nearObjects ["TargetBootcampHumanSimple_F",2000]);
_list append (_pos nearObjects ["SR_PopUpTarget_Big",2000]);
_list append (_pos nearObjects ["Land_fort_rampart",2000]);
_list append (_pos nearObjects ["Land_CncShelter_F",2000]);
_list append (_pos nearObjects ["Land_CncBlock",2000]);
_list append (_pos nearObjects ["SignAd_Sponsor_F",2000]);

// Deletes all objects from the generated List which are on the Range
{
	if (_x inArea _marker) then {
		deleteVehicle _x;
	};
} forEach _list;

// Clears content from the Lane Ammo Boxes
_boxes = [];
_boxes append (_pos nearObjects ["Box_NATO_Ammo_F",2000]);
{
	if (_x inArea _marker) then {
		clearweaponcargoGlobal _x;  
		clearmagazinecargoGlobal _x;  
		clearitemcargoGlobal _x; 
		clearBackpackCargoGlobal _x; 
	};
} forEach _boxes;

// Resets Lane Hit-Counter
_list = [];
_list append (_pos nearObjects ["ShootingMat_01_Olive_F",2000]);
{
	if (_x inArea _marker) then {
		_x setVariable ["SR_Hit", 0];
	};
} forEach _list;
