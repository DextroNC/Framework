/*
	File: fn_exfilCall.sqf

	Description:
	Server side script for exfil call from a player.

	Parameter(s):
	_ezMarker - pick up position [MARKER]
	_spawnMarker - spawn poistion [MARKER]
	_vehicleClass - class name of extraction helo [STRING]
	_dropoff - Ending position [ARRAY]
	_unit - The unit calling in the request [OBJECT]

	Returns:
	Function reached the end [BOOL]

	Example(s):
	[parameter] call fw_fnc_exfilCall
*/

params [["_ezMarker","EZ"],["_spawnMarker","STARTSPAWN"],["_vehicleClass","RHS_CH_47F"],["_dropoffMarker","dropoff"],["_unit",objNull]];

// Gather Positions from markers
_ez = markerPos _ezMarker;
_spawn_pos = markerPos _spawnMarker;
_dropoff = markerPos _dropoffMarker;
if (_dropoff isEqualTo [0,0,0]) then {
	_dropoff = markerPos _spawnMarker;
};

// Check if Target Marker exists if not exit with error msg
if (_ez isEqualto [0,0,0]) exitWith {
	_str = "Exfil: No EZ designated";
	[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _unit];
};

// Check if Exfiltration is locked
if (ExfilReady > CBA_MissionTime) exitWith {
	private _timeLeft = ExfilReady - CBA_MissionTime;
	[("Negative: Exfil not available. Try again in " + str(round _timeLeft) + " seconds."),("Exfil: Cooldown " + str(round _timeLeft) + " s")] remoteExec ["sr_support_fnc_infoMessage", _unit];
};

// Log entry and Confirmation Message
_str = "Exfil helicopter dispatched to Grid " + (mapGridPosition _ez) + ".";
[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _unit];
["CombatLog", ["Support", _str]] call CBA_fnc_globalEvent; 

// Set Ready & Liftoff
ExfilReady = CBA_MissionTime + 90;
publicVariable "ExfilReady";

// Aircraft always come from the module's location
private _distance = _ez distance2d _spawn_pos;
private _speed = 150; // 150m/s
private _setup_time = 45;
private _wait_time = (_distance/_speed) + _setup_time;

// clamp minimum value of _wait_time to 45s
_wait_time = _wait_time max (45);

fw_fnc_support_transport_function =
{
	_this params ["_ez", "_dropoff", "_unit", "_vehicleClass", "_spawn_pos"];

	_ez set [2, 0];
	_dropoff set [2, 0];

	private _dir = _ez getDir _spawn_pos;
	private _dir_end = _dropoff getDir _spawn_pos;
	private _spawn_position = _ez getPos [3000, _dir];
	private _end_position = _ez getPos [3000, _dir_end];

	_spawn_position set [2, 100];
	_end_position set [2, 100];

	private _vehicle_info = [_spawn_position, _dir, _vehicleClass, side _unit] call BIS_fnc_spawnVehicle;
	_vehicle_info params ["_vehicle","_vehicle_crew","_vehicle_group"];
	_vehicle setPosATL _spawn_position;

	_vehicle lockDriver true;
	_vehicle disableAi "TARGET";
	_vehicle disableAi "AUTOTARGET";
	_vehicle setCaptive true;
	_vehicle_group allowFleeing 0;

	_vehicle flyInHeight 100;

	private _safe_start = _ez findEmptyPosition [0, 100, _vehicleClass];
	if (count _safe_start <= 0) then
	{
		_safe_start = +_ez;
	};
	private _start_land_position = createVehicle ["Land_HelipadEmpty_F", _safe_start, [], 0, "CAN_COLLIDE"];

	// Log entry and Confirmation Message
	_str = "Exfil helicopter on final approach.";
	[_str,_str] remoteExec ["sr_support_fnc_infoMessage", _unit];

	private _waypoint_first_landing = _vehicle_group addWaypoint [_safe_start, 0];
	_waypoint_first_landing setWaypointType "MOVE";
	_waypoint_first_landing setWaypointBehaviour "CARELESS";
	_waypoint_first_landing setWaypointCombatMode "BLUE";
	_waypoint_first_landing setWaypointSpeed "NORMAL";
	_waypoint_first_landing setWaypointCompletionRadius 50;
	_waypoint_first_landing setWaypointStatements
	[
		"true",
		"
		private _vehicle = vehicle this;
		if (local _vehicle) then
		{
			_vehicle land 'GET IN';
		};
		"
	];

	_vehicle flyInHeight 100;
	
	// Add Action to Helicopter
	[_vehicle] remoteExec ["fw_fnc_exfilAction", 0, true];

	private _timeout = time + 360;
	waitUntil { (_vehicle getVariable ["fw_transport_takeoff_ready",false]) || time >= _timeout};

	if (alive _vehicle && {alive (driver _vehicle)}) then
	{

		_vehicle land 'NONE';

		private _end_land_position = createVehicle ["Land_HelipadEmpty_F", _dropoff, [], 0, "CAN_COLLIDE"];
		private _waypoint_second_landing = _vehicle_group addWaypoint [_dropoff, 1];
		_waypoint_second_landing setWaypointType "MOVE";
		_waypoint_second_landing setWaypointBehaviour "CARELESS";
		_waypoint_second_landing setWaypointCombatMode "BLUE";
		_waypoint_second_landing setWaypointSpeed "NORMAL";
		_waypoint_second_landing setWaypointCompletionRadius 50;
		_waypoint_second_landing setWaypointStatements
		[
			"true",
			"
			private _vehicle = vehicle this;
			if (local _vehicle) then
			{
				_vehicle setVariable ['fw_transport_change_lz', false, true];
				_vehicle land 'GET OUT';
			};
			"
		];

		_vehicle flyInHeight 100;

		_vehicle setVariable ['fw_transport_landing_waypoint', _waypoint_second_landing, true];
		_vehicle setVariable ['fw_transport_landing_waypoint_helipad', _end_land_position, true];

		waitUntil { ((_vehicle distance _end_land_position <= 50) && { ((getPos _vehicle)#2) <= 1 }) || !alive _vehicle || !alive (driver _vehicle) };

		// Move players and their group out of the vehicle
		{
			private _unit = (_x#0);
			if (isPlayer (leader group _unit) || isPlayer _unit) then
			{
				private _group = group _unit;
				_group leaveVehicle _vehicle;
				(units _group) apply
				{
					if (vehicle _x == _vehicle) then
					{
						moveOut _unit;
					};
				};
			};
			sleep 0.5;
		} foreach (fullCrew _vehicle);

		sleep 3;

		waitUntil { ((fullCrew _vehicle) findif {isPlayer (_x#0)}) == -1 || !alive _vehicle || !alive (driver _vehicle) };

		_vehicle land 'NONE';

		private _waypoint_second_landing = _vehicle_group addWaypoint [_end_position, 1];
		_waypoint_second_landing setWaypointType "MOVE";
		_waypoint_second_landing setWaypointBehaviour "CARELESS";
		_waypoint_second_landing setWaypointCombatMode "BLUE";
		_waypoint_second_landing setWaypointSpeed "NORMAL";
		_waypoint_second_landing setWaypointCompletionRadius 100;
		_waypoint_second_landing setWaypointStatements
		[
			"true",
			"
			private _group = group this;
			if (local _group) then
			{
				private _vehicle = vehicle this;
				{ _vehicle deleteVehicleCrew _x } forEach crew _vehicle;
				deleteVehicle _vehicle;
				{ deleteVehicle _x } forEach units _group;
				deleteGroup _group;
			}
			"
		];

		_vehicle flyInHeight 100;
	};
};

private _variable = "fw_support_transport_" + str (time+random 10000);
missionNamespace setVariable [_variable, [_ez, _dropoff, _unit, _vehicleClass, _spawn_pos]];
[
		"itemAdd",
		[
				_variable,
		compile format [
		"
			private _params = missionNamespace getVariable ['%1', []];
			_params spawn fw_fnc_support_transport_function;
			missionNamespace setVariable ['%1', nil];
		", _variable],
				_wait_time,
				"seconds",
				{ true },
				{ false },
				true
		]
] call BIS_fnc_loop;