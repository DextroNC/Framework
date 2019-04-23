// convoyMaxSpeed.sqf 
// © v.1 NOVEMBER 2016 - Devastator_cm
private ["_vcl","_last_marker","_convoyArray","_c","_count","_vcl_behind","_vcl_ahead","_dir",
		 "_destinationEnd", "_enemy", "_distance"];
_vcl 			= _this select 0;
_last_marker 	= _this select 1;
_convoyArray	= _this select 2;
_c 				= _this select 3;
_count 			= count _convoyArray;
_vcl_behind 	= objNull;  // Vehicle behind
_vcl_ahead 		= objNull;  // Vehicle ahead
_destinationEnd = getMarkerPos _last_marker;
_enemy 			= objNull;
_distance		= objNull;

if (!local _vcl) exitWith {};;
if (_c < (_count -1)) then {_vcl_behind = _convoyArray select (_c + 1)};
if (_c > 0) then {_vcl_ahead = _convoyArray select (_c - 1)};    		
while {alive _vcl && !(_vcl getVariable "DEVAS_ConvoyAmbush")} do 
{ 	
	_aliveConvoy	= [];
	{
		_enemy    = _x findNearestEnemy (getPos _x);
		_distance = _x distance _enemy;
		if (canMove _x && (isnull _enemy || _distance > DEVAS_SearchRange)) then {_aliveConvoy = _aliveConvoy + [_x];};
	} forEach _convoyArray;
	if ((count _aliveConvoy) < _count) exitWith {_vcl setVariable ["DEVAS_ConvoyAmbush",true, false]};
	if (!isNull _vcl_behind) then {
		while {_vcl distance _vcl_behind > 60 && _vcl distance _destinationEnd <  _vcl_behind distance _destinationEnd} do {	
			_dir = getDir _vcl;
			if (_vcl distance _vcl_behind <= 100) then {
				if (((sin _dir) * (velocity _vcl select 0)) > 3) then {_vcl setVelocity [(velocity _vcl select 0) - (1 * (sin _dir)), (velocity _vcl select 1), velocity _vcl select 2]};
				if (((cos _dir) * (velocity _vcl select 1)) > 3) then {_vcl setVelocity [(velocity _vcl select 0), (velocity _vcl select 1) - (1 * (cos _dir)), velocity _vcl select 2]};
			} else {
				if (((sin _dir) * (velocity _vcl select 0)) > 1) then {_vcl setVelocity [(velocity _vcl select 0) - (2 * (sin _dir)), (velocity _vcl select 1), velocity _vcl select 2]};
				if (((cos _dir) * (velocity _vcl select 1)) > 1) then {_vcl setVelocity [(velocity _vcl select 0), (velocity _vcl select 1) - (2 * (cos _dir)), velocity _vcl select 2]};
			};
			sleep 0.1;
		};
	};
	if (!isNull _vcl_ahead) then	{
		while { (_vcl distance _vcl_ahead < 40 && _vcl distance _destinationEnd >=  _vcl_ahead distance _destinationEnd) || _vcl distance _destinationEnd <  _vcl_ahead distance _destinationEnd} do {	
			_dir = getDir _vcl;
			if (((sin _dir) * (velocity _vcl select 0)) > 1) then {_vcl setVelocity [(velocity _vcl select 0) - (2 * (sin _dir)), (velocity _vcl select 1), velocity _vcl select 2]};
			if (((cos _dir) * (velocity _vcl select 1)) > 1) then {_vcl setVelocity [(velocity _vcl select 0), (velocity _vcl select 1) - (2 * (cos _dir)), velocity _vcl select 2]};
			sleep 0.1;
		};
	};
	sleep 0.1;
};
_vcl doMove getPos _vcl;