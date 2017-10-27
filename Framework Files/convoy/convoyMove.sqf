// convoyMove.sqf
// © v.1 NOVEMBER 2016 - Devastator_cm
private ["_vcl","_markerArray","_convoyArray","_marker","_leadVcl","_markersRemaining","_aliveConvoy","_b","_c","_x",
		 "_convoyVclDestroyed","_loop","_loop1","_unit","_crew","_all_groups","_inf_groups","_arm_groups","_arm_vehicles",
		 "_all_units", "_enemy", "_distance"];
_markerArray 		 	= _this select 0;
_convoyArray 		 	= _this select 1;
_upsmonArray			= _this select 2;
_convoyVclDestroyed  	= false;
_marker 			 	= _markerArray select 0;
_leadVcl 			 	= _convoyArray select 0;
_markersRemaining 	 	= _markerArray;
_all_groups 			= [];
_inf_groups 			= [];
_arm_groups 			= [];
_arm_vehicles           = [];
_aliveConvoy 		 	= [];
_all_units				= [];
_enemy 					= objNull;
_b 					 	= 0;
_c 					 	= 0;
_distance				= objNull;

{	_x setVariable ["DEVAS_ConvoyAmbush",false,false];
	_x setSpeedMode "NORMAL";
	_x setBehaviour "CARELESS";
	_x doMove (getMarkerPos _marker);
	[_x, _markerArray select ((count _markerArray) -1), _convoyArray, _c] spawn DEVAS_convoyMaxSpeed;
	_c = _c + 1;
	if ((_x isKindOf "Tank") || (_x isKindOf "Helicopter") || (!isNull (gunner (vehicle _x))) ) then 
	{ 
		_arm_groups = _arm_groups + [(group _x)]; 
	    _arm_vehicles = _arm_vehicles + [(_x)]
	};
	_crew = crew _x;
	for [{ _loop1 = 0 },{ _loop1 < count _crew},{ _loop1 = _loop1 + 1}] do 
	{
	    _unit = _crew select _loop1;
	    if !((group _unit) in _all_groups) then {_all_groups = _all_groups + [(group _unit)];}; 
	};
	_inf_groups = _all_groups - _arm_groups;
} forEach _convoyArray;

_convoyArray select (count _convoyArray - 1) limitSpeed DEVAS_SpeedLimit;
{_all_units = _all_units + units _x;} foreach _all_groups;
_convoyVclDestroyed = false;
_c = 0;

while {!_convoyVclDestroyed && !([_convoyArray,_markerArray] call DEVAS_endPoint)} do 
{
  {
  	_enemy    = _x findNearestEnemy (getPos _x);
	_distance = _x distance _enemy;
  	if (!alive _x || !canMove _x || (!isnull _enemy && _distance <= DEVAS_SearchRange) || isNull driver _x || !alive driver _x || (_x getVariable "DEVAS_ConvoyAmbush")) then {_convoyVclDestroyed = true;};
  } forEach _convoyArray;
	if (_convoyVclDestroyed) exitWith {};
	if (_leadVcl distance getMarkerPos _marker < 40) then 
	{
		if (_b < (count _markerArray - 1)) then 
		{	
			_b = _b + 1;
			_marker = _markerArray select _b;
			_markersRemaining = _markersRemaining - [_markerArray select (_b - 1)];
			{_x doMove getMarkerPos _marker;} forEach _convoyArray;
			_c = 0;
		};
	} else 
	{
		if (_c == 0) then 
		{
			{_x doMove getMarkerPos _marker} forEach _convoyArray;
		};
	};
	if (_c == 10) then {_c = 0} else {_c = _c + 1}; 
	sleep 0.5;
};

{if (canMove _x) then {_x setVariable ["DEVAS_ConvoyAmbush",true,false];_x doMove (getPos _x)}} forEach _convoyArray;
{if (alive _x && canMove _x) then {_aliveConvoy = _aliveConvoy + [_x];_x setVariable ["DEVAS_ConvoyVclPos", getpos(_x), false];}} forEach _convoyArray;
{_x setBehaviour "Combat";} forEach _arm_groups;  
sleep 0.5;

for [{ _loop = 0 },{ _loop < count  _convoyArray},{ _loop = _loop + 1}] do
{
	_vcl = _convoyArray select _loop;
	_crew = crew _vcl;
	if (alive _vcl && !(_vcl in _arm_vehicles)) then {
		while {speed _vcl > 2} do {sleep 0.5};
		for [{ _loop1 = 0 },{ _loop1 < count _crew},{ _loop1 = _loop1 + 1}] do {
			_unit = _crew select _loop1;
			if ((group _unit) in _inf_groups) then { 
				_unit action ["GetOut", _vcl];
				vehicle _unit setVehicleLock "LOCKED";
				[_unit] allowGetIn false;
			};
			sleep 0.1;
		};
	};
	sleep 0.1;
};

{_x setBehaviour "Combat";
 _x setCombatMode "RED";
} forEach _inf_groups;
{
	_leader = leader _x;
	_upsmon = [_leader];
	_upsmon append _upsmonArray;
	nul = _upsmon execVM "scripts\UPSMON.sqf";
} forEach _inf_groups;

//[_markersRemaining,_aliveConvoy,_all_groups,_all_units,_arm_groups] spawn DEVAS_convoyAmbush;

