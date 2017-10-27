/*
	Parameters:
	<-- Marker Name as String
	<-- Marker Description as String
	<-- Color as String (Marker Colors)
	<-- Sign as String
	<-- Opt. Landing Pad as Boolean - default: false
	<-- Opt. Size as Array [a-axis,b-axis] - default [1,1] e.g. 100%
	
*/

// Parameter Init
params ["_markerName","_markerDescription","_color","_sign","_landingPad","_size"];
// Default Value for Optionals
if (isNil "_landingPad") then {
	_landingPad  = false;
};
if (isNil "_size") then {
	_size  = [1,1];
};

hint ("Click on Map to assign " + _markerDescription);

// On Map Click
[_markerName,_markerDescription,_color,_sign,_landingPad,_size] onMapSingleClick  {
	params ["_markerName","_markerDescription","_color","_sign","_landingPad","_size"];

	// Find and delete old landing pads at previous marker location
	_old = nearestObjects [getmarkerPos _markerName,["HeliHEmpty"],2];  
	{
		deletevehicle _x;
	}forEach _old;

	// Delete Old Marker
	deleteMarker _markerName;

	// New Marker creation
	_marker = createMarker [_markerName,_pos];
	_marker setMarkerColor _color;
	_marker setMarkerText _markerDescription;
	_marker setMarkerType _sign;
	_marker setMarkerSize _size;

	//Landing Pad creation
	if (_landingPad) then {
		_veh = "HeliHEmpty" createVehicle _pos; _veh attachto [_marker]; 
	};

	// Final Info
	hint (_markerDescription + " designated");
	
onMapSingleClick "";
};

