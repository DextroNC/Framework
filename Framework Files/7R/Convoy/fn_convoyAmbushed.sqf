/*

	Parameters:
		<-- Convoy Vehicles as Array of Objects

	Description:
	Puts the whole Convoy into combat after a Vehicle was lost or a Driver was incapacitated.

*/

// Parameter Init
params ["_groupVehicles"];
if (SR_Debug) then { diag_log format ["convoyAmbushed: convoy of %1 vehicle(s) under attack", count _groupVehicles] };

// Collect Groups of everyone alive in the Convoy
private _groups = [];
{
	{
		private _group = group _x;
		if (alive _x && !isNull _group) then { _groups pushBackUnique _group };
	} forEach (crew _x);
} forEach _groupVehicles;

// Let the path and speed scripts shut down
sleep 1;

// Remove Waypoints and go into Combat
{
	private _group = _x;
	while { count (waypoints _group) > 0 } do {
		deleteWaypoint ((waypoints _group) select 0);
	};
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
} forEach _groups;
if (SR_Debug) then { diag_log format ["convoyAmbushed: %1 group(s) cleared and set to combat", count _groups] };

// Stop the Vehicles
{
	private _driver = driver _x;
	if (alive _x && !isNull _driver && alive _driver) then { doStop _driver };
} forEach _groupVehicles;

// Wait until the Vehicles stand still (or give up after 5 s)
private _timeout = time + 5;
waitUntil {
	sleep 0.5;
	time > _timeout || { (_groupVehicles select { alive _x && { speed _x > 2 } }) isEqualTo [] }
};

{

	// Create Patrol Zone
	private _marker = createMarkerLocal [str (leader _x), vehicle (leader _x)];
	_marker setMarkerShapeLocal "RECTANGLE";
	_marker setMarkerSizeLocal [100, 100];
	_marker setMarkerAlphaLocal 0;

	// React to contact
	[leader _x, [_marker, "P"], [_marker, "P"], 8] spawn fw_fnc_dismountVehicle;
} forEach _groups;
