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
	_c = count units _g;
	_ng =  createGroup (side _g);
	{
		if (!isNull (_x select 0)) then {
			[_x select 0] join _ng;
		};
	}forEach fullCrew [_v, "cargo", true];
	units _ng orderGetIn false;
	units _ng allowGetIn false;
	_array = [leader _g]; 
	// Patrol Script Init
	// Check if Second parameter set for crew exists, if not both groups receive same parameters
	if (isNil "_cargo") then {_array append _patrolParams;} else {_array append _cargo;};
	_array remoteExec ["fw_fnc_patrol",2];
	_array2 = [leader _ng]; 
	_array2 append _patrolParams;
	_array2 remoteExec ["fw_fnc_patrol",2];
};