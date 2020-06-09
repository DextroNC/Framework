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
_originalGroup setVariable ["Vcm_Disable",false,true]; 

// Check if Vehicle is Armed
if (isNull (gunner vehicle _leader)) then {
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
} else {
	// Multi Group Dismount

	// Create a group of cargo seats
	_ng =  createGroup (side _originalGroup);
	{
		if (!isNull (_x select 0)) then {
			[_x select 0] join _ng;
		};
	}forEach fullCrew [_v, "cargo", true];
	{
		if (!isNull (_x select 0)) then {
			[_x select 0] join _ng;
		};
	}forEach fullCrew [_v, "turret", true];

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

		// Patrol Script Params for Vehicle
		_array2 = [leader _newGroup];
		_array2 append _patrolParams;
		// Patrol Script init Vehicle
		_array2 remoteExec ["fw_fnc_patrol",2];
	};
};
