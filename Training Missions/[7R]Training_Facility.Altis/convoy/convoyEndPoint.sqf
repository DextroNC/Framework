// convoyRestart.sqf
// © v.1 NOVEMBER 2016 - Devastator_cm

// Parameters

_convoyArray = _this select 0;
_markerArray = _this select 1;
_return = false;

// Find End Point
_endPointer = (count _markerArray) - 1;
_destinationEnd = _markerArray select _endPointer;

// Check if Vehicle close to End Point
{
if (_x distance markerPos _destinationEnd < 20) then {_return = true;};
} forEach _convoyArray;

_return
