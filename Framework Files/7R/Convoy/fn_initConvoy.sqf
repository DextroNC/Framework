/*

	Parameters:
		<-- Marker as String
		<-- Array of Templates as Array of Integers
		<-- Waypoints as Array of Strings
		<-- Optional: Spacing for Vehicles as Integer
		<-- Optional: Speed for Vehicles as Integer

	Return:
		--> Convoy Logic Entity as Object

	Description:
		Initiates the convoy system.

	Example:
		_return = [_initialMarker, _convoyTemplates, _waypointMarkers] call fw_fnc_initConvoy;

*/

// Parameter Init
params ["_initialMarker", "_convoyTemplates", "_waypointMarkers", ["_spacing", 35], ["_speed", 60]];

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Create Logic Object
_logicCenter = createCenter sideLogic;
_logicGroup = createGroup _logicCenter;
_logic = _logicGroup createUnit ["Logic", [0,0,0], [], 0, "NONE"];

// Set Logic Variables
_logic setVariable ["convWaypointMarkers", _waypointMarkers];
_logic setVariable ["convWaypoints", []];
_logic setVariable ["convSeparation", _spacing];
_logic setVariable ["maxSpeed", _speed];
_logic setVariable ["stiffnessCoeff", 0.2];
_logic setVariable ["dampingCoeff", 0.6];
_logic setVariable ["curvatureCoeff", 0.3];
_logic setVariable ["stiffnessLinkCoeff", 0.1];
_logic setVariable ["pathFrequecy", 0.05];
_logic setVariable ["speedFrequecy", 0.2];
_logic setVariable ["speedModeConv", "NORMAL"];
_logic setVariable ["behaviourConv", "pushThroughContact"];
_logic setVariable ["debug", false];
_logic setVariable ["convVehicles", []];
_logic setVariable ["leadVic", objNull];

// Spawn Convoy Vehicles
_handle = [_logic, _initialMarker, _convoyTemplates, _spacing] spawn fw_fnc_spawnConvoy;
waitUntil {scriptDone _handle};

private _groupVehicles = _logic getVariable ["convVehicles", []];

// Setup Convoy Variables
if (_groupVehicles isEqualTo []) exitWith {
	deleteVehicle _logic;
	deleteGroup _logicGroup;
	diag_log "initConvoy: no vehicles were spawned";
	objNull
};
private _leaderVeh = _groupVehicles select 0;
_leaderVeh setVariable ["convoy_stopped", false, true];
_leaderVeh setVariable ["convoy_terminate", false, true];
_leaderVeh setVariable ["convoy_arrived", false, true];
_leaderVeh setVariable ["convoy_behaviourChanged", false, true];
_leaderVeh setVariable ["convoy_drawObjects", 3, true];
_leaderVeh setVariable ["convoy_logic", _logic, true];

// Leader Waypoints
_waypoints = [];
private _leaderGroup = group _leaderVeh;
{
	private _wpPos = markerPos _x;
	if (_wpPos isEqualTo [0,0,0]) then {
		if (true) then { diag_log format ["initConvoy: waypoint marker %1 does not exist, skipping", _x] };
	} else {
		private _wp = _leaderGroup addWaypoint [_wpPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed (_logic getVariable ["speedModeConv", "NORMAL"]);
		_wp setWaypointCompletionRadius 20;
		_waypoints pushBack _wp;
		_logic setVariable ["convWaypoints", _waypoints];
	};
} forEach _waypointMarkers;

// Set completion logic on final waypoint
if (count _waypoints > 0) then {
	private _finalWp = _waypoints select (count _waypoints - 1);
	_finalWp setWaypointStatements [
		"true", "
			(vehicle this) setVariable ['convoy_arrived', true, true];
			(vehicle this) setVariable ['convoy_terminate', true, true];
		"
	];
};

// call the "driver changes system" for each vehicle
// writes --> On Each Vehicle: 	{"driverIncapacitated", "vehicleIncapacitated","terminate_driverTransitions"}
// reads -->  On Each Vehicle: 	{"terminate_driverTransitions"}
for [{ _i = 0 }, { _i < count _groupVehicles }, { _i = _i + 1 }] do {
	call{ null = [_groupVehicles select _i] execFSM "7R\Convoy\statemachines\fn_driverTransitions.fsm" };
};

// call the "dynamic convoy system"
// writes --> On Leader: 		{"convoy_stopped","convoy_terminate"}
// reads -->  On Each Vehicle: 	{"driverIncapacitated","vehicleIncapacitated","convoy_terminate"}
call{ null = [_logic,_groupVehicles] execFSM "7R\Convoy\statemachines\fn_dynamicConvoyElements.fsm" };

// behavior manager stateMachine
call{ null = [_logic,_groupVehicles] execFSM "7R\Convoy\statemachines\fn_behaviorManager.fsm" };

// speed control Leader
[_logic,_groupVehicles] spawn fw_fnc_leadSpeedControl;

// speed control link
[_logic,_groupVehicles] spawn fw_fnc_linkSpeedControl;

// set path
[_logic,_groupVehicles] spawn fw_fnc_pathCreator;

_logic;