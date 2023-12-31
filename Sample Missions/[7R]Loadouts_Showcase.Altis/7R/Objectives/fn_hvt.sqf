/*
	Parameters:
		<-- Unit as Object
		<-- Marker as Array of Strings (for waypoints to flee to) OR AnimationType as Integer
		<-- Surrender Ranger as Integer
		<-- Optional (default: false): Vehicle Usage as Boolean
	
	Description:
		HVT will stay at his location until he knows enemies are close. Depending on parameters he will either start fleeing or break animation while staying in place.
		When succesfully escaped following variable will be added to the HVT: SR_HVT_Escaped.
	
	Trigger Condition: 
		hvt getVariable ["SR_HVT_Escaped", false]
		
	Example (fleeing):
		nul = [this, ["f1", "f2","f3","f5"], 10, false] spawn fw_fnc_hvt; (HVT init line)
	Example (staying in place):
		nul = [this, 17, 10, false] spawn fw_fnc_hvt; (HVT init line)
*/

// Only on Server
if (!isServer) exitWith {};

// Parameter Init
params ["_unit","_mode","_dist",["_veh",false]];

// Modify AI Behaviour
(group _unit) setVariable ["Vcm_Disable",true];
_unit disableAI "AUTOCOMBAT";

// Remove from HC transfer
_unit setVariable ["acex_headless_blacklist", true];

// Remove HVT from dead body clean up
_unit setVariable ["SR_NoRemoval", true, true];

// Fleeing Mode
if (typeName _mode == "ARRAY") then {
// Escape Code: start fleeing if enemy is close
	[{!isNull ((_this select 0) findNearestEnemy (_this select 0))}, {
		params ["_unit","_markerArray","_dist","_veh"];
		// If vehicle allowed, find vehicle 
		if (_veh) then {
			_wpv = group _unit addWaypoint [position _unit, 25];
			_wpv setWayPointBehaviour "CARELESS";
			_wpv setWayPointSpeed "FULL";
			_wpv setWayPointType "GETIN NEAREST";
			_wpv setWayPointCombatMode "GREEN";
			_wpv setWayPointStatements ["true", ""];
		};
		
		// Create Waypoints along defined path
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
		
	}, [_unit,_mode,_dist,_veh]] call CBA_fnc_waitUntilAndExecute;
} else {
	// Staying Mode
	_unit disableAI "PATH";
	[_unit, _mode, true] call fw_fnc_ambientAnimation;
};


// Surrender Condition and Code
[{
	// Surrender Condition
	// Check if enemies around are known
	if(isNull ((_this select 0) findNearestEnemy (_this select 0))) then {
		false
	} else {
		// Enemies within defined distance
		if ((_this select 0) distance ((_this select 0) findNearestEnemy (_this select 0)) < (_this select 1)) then {
			true} else {
		false};
	};
}
, {
	// Surrender Code
	params ["_unit","_dist"];
	[_unit,false] spawn fw_fnc_surrender;
}, [_unit,_dist]] call CBA_fnc_waitUntilAndExecute;