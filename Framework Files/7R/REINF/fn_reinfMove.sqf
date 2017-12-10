/*
	Parameters:
		<-- Helicopter as Object
	
	Description:
		Makes Helicopter move to Insert the Players to the Reinf-Marker

*/
// Parameter Init
params ["_helo"];
_start = getPos (driver _helo);
_pos = markerPos "REINF";
_count = {isPlayer _x} count (crew _helo); 

if (_pos isEqualTo [0,0,0]) exitWith {
	[[SR_Side, "HQ"],"Reinforcements not available, no Landing Zone designated."] remoteExec ["sideChat", 0];
};

_str = "REINF Insertion: " + str (_count) + " Reinforments to Grid " + (mapGridPosition _pos) + ".";
[[SR_Side, "HQ"],_str] remoteExec ["sideChat", 0];
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 

group _helo setBehaviour "CARELESS";

_wp1 = group driver _helo addWaypoint [_pos ,0,1];
_wp1 setWaypointType "TR UNLOAD";
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointTimeout [2, 3, 4];
_wp1 setWaypointStatements ["true", "this sidechat 'Reinforments delivered.'"];

sleep 1;

_wp2 = group driver _helo addWaypoint [_start ,0,2];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointBehaviour "CARELESS";
_wp2 setWaypointCompletionRadius 100;
_wp2 setWaypointStatements ["true", "[this] call fw_fnc_deleteVehicle;"];

