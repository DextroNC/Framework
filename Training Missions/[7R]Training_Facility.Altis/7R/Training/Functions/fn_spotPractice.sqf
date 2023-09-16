/*
	Parameters:
	<-- Termial as Object
*/

// Parameter init
params ["_term"];
_pos = ([(selectRandom ["spt_1","spt_2","spt_3","spt_4"]), true] call CBA_fnc_randPosArea);
_term setVariable ["SR_Active",true,true];

// Spawn Target
_spot = createVehicle ["Land_BuoyBig_F", _pos, [], 0, "NONE"];


waitUntil {!(_term getVariable ["SR_Active",false])};
deleteVehicle _spot;

// Create Result Marker
private _mR = createMarker ["nav_train", position _spot];
_mR setMarkerColor "ColorBlue";
_mR setMarkerShape "ELLIPSE";
_mR setMarkerType "hd_dot";
_mR setMarkerAlpha 0.6;
_mR setMarkerSize [25,25];
_mR setMarkerBrush "Solid";

sleep 10;
deleteMarker _mR;
