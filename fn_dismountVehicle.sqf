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

params ["_leader", "_patrolParams", ["_cargo", []], ["_groupSize", 4]];
_vehicle = vehicle _leader;
_originalGroup = group _leader;
_originalGroup setVariable ["Vcm_Disable", false, true];

if (((count fullCrew [_vehicle,"",false]) <= 4) || (((count fullCrew [_vehicle,"",false]) <= 5) && (_vehicle isKindOf "AIR")) || (((count fullCrew [_vehicle,"",false]) <= 2) && (_vehicle isKindOf "CAR"))) exitWith { //If vehicle is not transport, never dismount

	_patrolInput = [leader _originalGroup];
	_patrolInput append _patrolParams;
	// Hand units to patrol script.
	_patrolInput remoteExec ["fw_fnc_patrol",2];
};

if (SR_Debug) then {systemChat format ["Vehicle is Transport"];};

// Check if Air Vehicle
if (_vehicle isKindOf "AIR") then {// Soft Dismount, only Passengers (i.e. not including FFV slots)

	// Multi Group Dismount
	if (SR_Debug) then {systemChat format ["%1 soft dismount", _leader];};

	// Move all cargo units into a new group
	_ng = createGroup (side _originalGroup);
	{
		_unit = _x select 0;
		if (!isNull _unit) then {
			[_unit] joinSilent _ng;
		};
	} forEach (fullCrew [_vehicle, "cargo"]);

	// Cargo leave Vehicle
	units _ng orderGetIn false;
	units _ng allowGetIn false;

	// Split cargo group into smaller ones
	_cargo_groups = [];
	while {(count units _ng) > 0} do {
		_unit_to_move = units _ng select 0;
		_moved_into_group = false;
		{
			if (count units _x < _groupSize) then {
				[_unit_to_move] join _x;
				_moved_into_group = true;
			};
		} forEach _cargo_groups;

		if (!_moved_into_group) then {
			_cargo_group = createGroup (side _originalGroup);
			[_unit_to_move] join _cargo_group;
			_cargo_groups pushBack _cargo_group;
		};
	};

	{
		_patrolInput = [leader _x];
		_patrolInput append _patrolParams;
		// Hand units to patrol script.
		_patrolInput remoteExec ["fw_fnc_patrol",2];
	} forEach _cargo_groups + [_originalGroup];

} else {

	// Check if Vehicle is Unarmed
	if (isNull (gunner _vehicle)) then {//Hard Dismount

		if (SR_Debug) then {systemChat format ["%1 hard dismount", _leader];};

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
		_array = [_leader];
		_array append _patrolParams;
		_array remoteExec ["fw_fnc_patrol",2];

	} else {//Soft Dismount, all except driver and gunner (i.e. including FFV slots)

		// Multi Group Dismount
		if (SR_Debug) then {systemChat format ["%1 soft dismount", _leader];};

		// Move all cargo and FFV units into a new group
		_ng = createGroup (side _originalGroup);
		{
			_unit = _x select 0;
			if (!isNull _unit) then {
				[_unit] joinSilent _ng;
			};
		} forEach (fullCrew [_vehicle, "cargo"] + fullCrew [_vehicle, "turret"]);

		// Cargo leave Vehicle
		units _ng orderGetIn false;
		units _ng allowGetIn false;

		// Split cargo group into smaller ones
		_cargo_groups = [];
		while {(count units _ng) > 0} do {
			_unit_to_move = units _ng select 0;
			_moved_into_group = false;
			{
				if (count units _x < _groupSize) then {
					[_unit_to_move] join _x;
					_moved_into_group = true;
				};
			} forEach _cargo_groups;

			if (!_moved_into_group) then {
				_cargo_group = createGroup (side _originalGroup);
				[_unit_to_move] join _cargo_group;
				_cargo_groups pushBack _cargo_group;
			};
		};

		{
			_patrolInput = [leader _x];
			_patrolInput append _patrolParams;
			// Hand units to patrol script.
			_patrolInput remoteExec ["fw_fnc_patrol",2];
		} forEach _cargo_groups + [_originalGroup];
	};
};