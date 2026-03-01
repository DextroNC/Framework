/*

	Parameters:
		<-- Leader as Object
		<-- Patrol Parameters initialized on Target Pos as Array
		<-- Optional: Patrol Parameters initialized on Target Pos for Cargo as Array
		<-- Size as Integer (Size the Cargo Group will split): default = 4

	Description:
		Makes AI dismount and passes it to Patrol Script

*/
// Parameter Init
params ["_leader","_patrolParams",["_cargo",[]],["_groupSize",4]];
_v = vehicle _leader;
_originalGroup = group _leader;
_originalGroup setVariable ["Vcm_Disable",true,true]; 

// If vehicle is unarmed, then:
if (isNull (gunner vehicle _leader) && !(_v isKindOf "Air")) then {
	// Single Group Dismount
	units _originalGroup orderGetIn false;
	units _originalGroup allowGetIn false;

	// Split Group
	while {((count units _originalGroup) / _groupSize) > 1} do {
		_units = units _originalGroup;
		// Create new Group
		_newGroup = createGroup (side _originalGroup);
		// Move Units to new Group
		for "_i" from 1 to (_groupSize) do {
			[_units select _i] join _newGroup;
		};
		// Init Patrol Script for new Group
		_array = [leader _newGroup];
		_array append _patrolParams;
		_array remoteExec ["fw_fnc_patrol",2];
	};

	// Call UPSMON
	_array = [leader _originalGroup]; //leader might have changed, so grabbing again
	_array append _patrolParams;
	_array remoteExec ["fw_fnc_patrol",2];
} else {
	// Multi Group Dismount

	// Create a group of cargo seats
	_ng =  createGroup (side _originalGroup);
	{
		if (!isNull (_x select 0)) then {
			[_x select 0] join _ng;
		};
	}forEach fullCrew [_v, "cargo", true];
	if !(_v isKindOf "Air") then {
		{
			if (!isNull (_x select 0)) then {
				[_x select 0] join _ng;
			};
		}forEach fullCrew [_v, "turret", true];
	};

	// Cargo leave Vehicle
	units _ng orderGetIn false;
	units _ng allowGetIn false;

	while {((count units _ng) / _groupSize) > 1} do {
		_units = units _ng;
		// Create new Group
		_newGroup =  createGroup (side _originalGroup);
		// Move Units to new Group
		for "_i" from 1 to (_groupSize - 1 ) do {
			[_units select _i] join _newGroup;
		};
		// Check if Cargo has special Patrol Script Params
		_array = [leader _newGroup];
		if (count _cargo == 0) then {_array append _patrolParams;} else {_array append _cargo;};
		// Cargo Patrol Init
		_array remoteExec ["fw_fnc_patrol",2];
	};

	// After the split loop — patrol the remaining cargo (always runs)
	if (count units _ng > 0) then {
		_array = [leader _ng];
		if (count _cargo == 0) then {_array append _patrolParams;} else {_array append _cargo;};
		_array remoteExec ["fw_fnc_patrol", 2];
	};

	// Patrol the vehicle group (always runs)
	_array2 = [leader _originalGroup]; //leader might have changed, so grabbing again
	_array2 append _patrolParams;
	if (_v isKindOf "Air") then { //Loiter the Helo
		private _pa = [_patrolParams select 0] call CBA_fnc_getArea;
		private _paCenter = _pa select 0;
		private _paRadius = selectMax [(_pa select 1),(_pa select 2),250]; // minimum 500m diameter

		// Force loiter altitude to 150m AGL
    	_v flyInHeight 150;

		// Add LOITER waypoint at center
		{deleteWaypoint _x} forEachReversed waypoints _originalGroup;
		private _wp = _originalGroup addWaypoint [_paCenter, 0, 1];
		_wp setWaypointType "LOITER";
		_wp setWaypointLoiterType "CIRCLE";
		_wp setWaypointLoiterRadius _paRadius;
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointCombatMode "WHITE";
	} else {
		_array2 remoteExec ["fw_fnc_patrol", 2];
	};
};
