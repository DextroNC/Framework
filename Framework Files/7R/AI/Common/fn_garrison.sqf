/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Radius as Integer (default 50)
		<-- Fill Mode as Integer (0 even, 1 building by building, 2 random, default 0)
		<-- Release on Ally Killed as Boolean (default false)

	Return:
	--> None

	Description:
		Garrisons the units in the buildings around the position. Bunkers in range are manned first.
		Placed units turn outward and pick a stance. With Release on Ally Killed, a garrisoned unit can
		be set free to move when a player kills one of its group members.

	Example:
		[_position,_units,_radius] spawn fw_fnc_garrison;
		[_position,_units,_radius,_mode,true] spawn fw_fnc_garrison;
*/
// Parameter Init
params ["_position","_units",["_radius",50],["_mode",0],["_release",false]];

// Only living units
_units = _units select {alive _x};
if (_units isEqualTo []) exitWith {};

// Register Group, static so the patrol loop gives it no orders
private _group = group (_units select 0);
if (isServer) then {
	_group setVariable ["SR_PatrolMode","S"];
	SR_PatrolUnits pushBackUnique _group;
};

// Pass to the machine that owns the units
if (!local (_units select 0)) exitWith {
	if (isServer) then {
		[_position, _units, _radius, _mode, _release] remoteExec ["fw_fnc_garrison", _units select 0];
	};
};

_group deleteGroupWhenEmpty true;

private _unplaced = [];
private _remaining = _units;

// Bunkers
if !(side _group isEqualTo civilian) then {
	private _bunkerClasses = ["Land_fortified_nest_big","Land_BagBunker_Large_F","Land_Bunker_01_big_F","Land_Bunker_01_HQ_F","Land_Bunker_01_tall_F","Bunker_02_base_F","Fortress2","Land_Bunker_01_small_F","Land_fortified_nest_small","Fortress1","Land_BagBunker_Small_F"];
	private _bunkers = nearestObjects [_position, _bunkerClasses, _radius max 50] select {count (_x buildingPos -1) > 0};

	private _slots = 0;
	{
		_slots = _slots + count (_x buildingPos -1);
	} forEach _bunkers;

	if (_slots > 0) then {
		private _bunkerCount = _slots min (count _units);
		private _bunkerUnits = _units select [0, _bunkerCount];
		private _bunkerLeft = [_position, _bunkerClasses, _bunkerUnits, _radius, 1, false, true] call ace_ai_fnc_garrison;
		_remaining = (_units select [_bunkerCount, count _units]) + _bunkerLeft;
	};
};

// Buildings
if (_remaining isNotEqualTo []) then {
	_unplaced = [_position, nil, _remaining, _radius, _mode, false, true] call ace_ai_fnc_garrison;
};
private _placed = _units - _unplaced;

// Face outward and pick a stance, the leader keeps path finding
if !(side _group isEqualTo civilian) then {
	{
		[_x] call fw_fnc_garrisonStance;
	} forEach _placed;

	private _leader = leader _group;
	if (_leader in _placed) then {_leader enableAI "PATH"};
};

// Add event handler to enable pathing on nearby group members when ally is killed
if (_release) then {
	{
		[_x] spawn fw_fnc_garrisonKilledEH;
	} forEach _units;
};

// Debug
if (missionNamespace getVariable ["SR_Debug", false]) then { format ["%1 garrison %2 with radius %3", _group, mapGridPosition _position, _radius] remoteExec ["systemChat", 0]; };
