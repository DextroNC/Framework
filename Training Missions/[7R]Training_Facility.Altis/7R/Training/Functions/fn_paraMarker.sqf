/*
	Parameters:
		<-- Position as Position
		<-- Name as String
		<-- Text as String
		<-- Type as String
		<-- Color as String
		<-- Direction as Integer

	Description:
		Creates Markers for Paradrop.

*/

// Parameter Init
params ["_pos","_name","_text","_type","_color","_dir"];

// Create Marker
_marker = createMarker [_name,_pos];
_marker setMarkerText _text;
_marker setMarkerType _type;
_marker setMarkerColor _color;
_marker setMarkerDir _dir;
