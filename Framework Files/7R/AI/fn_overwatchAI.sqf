/*
	Parameters:
		<-- Group as Group
		
	Description:
		Sends an AI Group to overwatch position. On arrival go stealth.
		
	Example:
		nul = [group] spawn fw_fnc_overwatchAI;
*/
// Parameter Init
params ["_grp","_marker"];
private ["_ow","_wp","_target"];

// Find OW pos
_target = markerPos _marker;
_ow = [_target,250,1] call BIS_fnc_findOverwatch;

// Create WP
_wp = _grp addWaypoint [_ow, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointSpeed "FULL";
_wp setWaypointStatements ["true", "group this setCombatMode 'YELLOW';group this setBehaviour 'STEALTH';"];
