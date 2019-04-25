/*

	Parameters:
		<-- Leader as Object
		<-- Patrol Parameters initialized on Target Pos as Array
		<-- Optional: Patrol Parameters initialized on Target Pos for Cargo as Array

	Description:
		Makes AI dismount and passes it to Patrol Script
		
*/
// Parameter Init
params ["_l","_patrolParams","_cargo"];
_v = vehicle _l;
_g = group _l;
// Check if Vehicle is Armed
if (isNull (gunner vehicle _l)) then {
	// Single Group Dismount
	units _g orderGetIn false;
	units _g allowGetIn false;
	// Call UPSMON
	_array = [_l]; 
	_array append _patrolParams;
	_array remoteExec ["fw_fnc_patrol",2];
} else {
	// Multi Group Dismount

	// Create a group of cargo seats
	_ng =  createGroup (side _g);
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

	// Check if Cargo has special Patrol Script Params
	_array = [leader _ng];
	if (count _cargo == 0) then {_array append _patrolParams;} else {_array append _cargo;};
	// Cargo Patrol Init
	_array remoteExec ["fw_fnc_patrol",2];
	
	// Patrol Script Params for Vehicle
	_array2 = [_l];
	_array2 append _patrolParams;
	// Patrol Script init Vehicle
	_array2 remoteExec ["fw_fnc_patrol",2];
};