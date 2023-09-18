/*
	Parameters:
		<-- Flag as Object
		<-- Opt. Marker Array - if not present following parameters are not required
			<-- Marker Name as String
			<-- Marker Description as String
			<-- Opt. Marker Color as String - colorBLUFOR 
			<-- Opt. Marker Type as String - "hd_join"
		
		!!! Note: When only Flag parameter is given and no marker, it will not create a marker.
					If you decide to use a marker it will delete, if existing the marker with the same name
					and create a new one. 
					Marker Color and Type remain Optional if you opt for a marker in the first place.

	Example:
		nul=[flag1, ["farm", "Farm House"]] spawn fw_fnc_flag;
		
		Used onActivation of a trigger to create a rally point. Create a Marker Base teleport to utilize:
			this addAction ["Teleport to Farm House","7R\Teleporter\Teleporter.sqf", [1,"farm"], 0, true, true, "","getMarkerColor 'farm' == 'ColorBLUFOR'",3];

*/

// Server only exec
if(!isServer) exitWith {};

// Parameter init
params ["_flag","_array"];

// Creates new flag and save old flag position and direction
_new = "7R_flag" createVehicle [0,0,0];
_pos = getPos _flag;
_dir = getDir _flag;

// delete old flag
deleteVehicle _flag;

// place new flag
_new setPos _pos;
_new setDir _dir;

// Check if Marker Option has been taken
if (isNil "_array") exitWith {};

// Init Marker Parameters
_array params ["_name","_desc","_color","_type"];

// Init default value on opt. params, if not given
if (isNil "_color") then {_color = "ColorBLUFOR"};
if (isNil "_type") then {_type = "hd_join"};

// deletes marker with same name if existing
deleteMarker _name;

// Creates new Marker at flag location
_marker = createMarker [_name, _pos];
_marker setMarkerText _desc;
_marker setMarkerType _type;
_marker setMarkerColor _color;

