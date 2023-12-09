/*
	Parameters:
	<-- Marker Name as String
	<-- Marker Description as String
	<-- Color as String (Marker Colors)
	<-- Sign as String
	<-- Opt. Landing Pad as Boolean - default: false
	<-- Opt. Size as Array [a-axis,b-axis] - default [1,1] e.g. 100%
	<-- Opt. Direction as Boolean - default: false
	
*/

// Parameter Init
params ["_markerName","_markerDescription","_color","_sign",["_landingPad",false],["_size", [1,1]],["_direction", false]];

// Hint Msg to Click on Map
["", ("Click on Map to assign " + _markerDescription)] spawn fw_fnc_info;

// Clean up old marker
deleteMarker _markerName;
_old = nearestObjects [getmarkerPos _markerName,["HeliHEmpty"],2];  
{
	deletevehicle _x;
}forEach _old;

// On Map Click
[_markerName,_markerDescription,_color,_sign,_landingPad,_size,_direction] onMapSingleClick  {
	params ["_markerName","_markerDescription","_color","_sign","_landingPad","_size","_direction"];

	// Adjust Marker Direction
	if (!(markerPos _markerName isEqualTo [0,0,0]) && _direction) then {
		_markerName setMarkerDir (markerPos _markerName getDir _pos);
		onMapSingleClick "";
	};

	// Create Marker
	if (markerPos _markerName isEqualTo [0,0,0]) then {
		// New Marker creation
		private _marker = createMarker [_markerName,_pos];
		_marker setMarkerColor _color;
		_marker setMarkerText _markerDescription;
		_marker setMarkerType _sign;
		_marker setMarkerSize _size;

		//Landing Pad creation
		if (_landingPad) then {
			_veh = "HeliHEmpty" createVehicle _pos; _veh attachto [_marker]; 
		};

		// Info Msg
		["", (_markerDescription + " designated")] spawn fw_fnc_info;
	};
	
	// Exit if no direction
	if (!_direction) then {
		onMapSingleClick "";
	};	
};