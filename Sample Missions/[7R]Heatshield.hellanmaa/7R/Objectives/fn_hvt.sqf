/*
	Parameters:
		<-- Unit as Object
		<-- Marker as Array of Strings (for waypoints to flee to)
		<-- Surrender Ranger as Integer
		<-- Optional (default: false): Vehicle Usage as Boolean
	
	Description:
		HVT will stay at his location until he knows enemies are close. He will then start to flee along the over the given markers in the array.
		If player gets within range of HVT he will surrender. Optional it can be enabled that he will use vehicles.

		When succesfully escaped following variable will be added to the HVT: SR_HVT_Escaped.
	
	Trigger Condition: 
		hvt getVariable ["SR_HVT_Escaped", false]
		
	Example:
		nul = [this, ["f1", "f2","f3","f5"], 10, false] spawn fw_fnc_hvt; (HVT init line)
*/

// Only on Server
if (!isServer) exitWith {};

// Parameter Init
params ["_unit","_markerArray","_dist",["_veh",false]];
// disable ASR AI
_unit setVariable ["asr_ai_exclude", true, true];
_unit disableAI "AUTOCOMBAT";
(group _unit) setVariable ["Vcm_Disable",true];

// Escape Code
[{!isNull ((_this select 0) findNearestEnemy (_this select 0))}, {
	params ["_unit","_markerArray","_dist","_veh"];
	if (_veh) then {
		_wpv = group _unit addWaypoint [position _unit, 25];
		_wpv setWayPointBehaviour "CARELESS";
		_wpv setWayPointSpeed "FULL";
		_wpv setWayPointType "GETIN NEAREST";
		_wpv setWayPointCombatMode "GREEN";
		_wpv setWayPointStatements ["true", ""];
	};
	
	for [{_i=0}, {_i < (count _markerArray)}, {_i = _i + 1}] do {
		hint format ["%1", markerPos (_markerArray select _i)];
		_wp = group _unit addWaypoint [markerPos (_markerArray select _i), 10];
		_wp setWayPointBehaviour "AWARE";
		_wp setWayPointSpeed "FULL";
		_wp setWayPointType "MOVE";
		_wp setWayPointCombatMode "GREEN";	
		_wp setWayPointStatements ["true", ""];
		if (_i == ((count _markerArray) - 1)) then {
			_wp setWayPointStatements ["true", "this setVariable ['SR_HVT_Escaped', true, true]"];
		};
	};
	
}, [_unit,_markerArray,_dist,_veh]] call CBA_fnc_waitUntilAndExecute;

// Surrender Condition and Code
[{
if(isNull ((_this select 0) findNearestEnemy (_this select 0))) then {
	false
	} else {
	if ((_this select 0) distance ((_this select 0) findNearestEnemy (_this select 0)) < (_this select 1)) then {
		true} else {
	false}
}}
, {
	params ["_unit","_dist"];
	[_unit, true] call ACE_captives_fnc_setSurrendered;
}, [_unit,_dist]] call CBA_fnc_waitUntilAndExecute;
