/*

	Parameters:
		<-- Group Leader as Object (this)
		<-- Template Number as Integer
		
	Description:
	Save a unit as a template allowing it to be spawned with template spawn. Despawns the upon saving.
	
	Example:
	nul = [this, 1] spawn fw_fnc_saveTemplate
	
*/

// Server only execute check
if (!isServer) exitWith {};

// Parameter Init
params ["_leader", "_templateNumber"];
private _check = false;
private _unitArray  = [];

// Check if Template Variable exists, else create it
if (isNil "SR_Template") then {
	SR_Template = [];
};

// Check if template number already exists, if true exit with error
{
	if (_templateNumber in _x) exitWith {
		_check = true;
	};
}forEach SR_Template;
if (_check) exitWith {hint "Error: Template already exists."};

// Unit Side
private _side = side _leader;

// Check if units are in a Vehicle and depeding on Result create inner Array
if (_leader isKindOf "Air") then {
	_unitArray pushBack (typeOf _leader);
};
if (_leader isKindOf "LandVehicle") then {
	_unitArray pushBack (typeOf _leader);
	{
		if (!isNull (_x select 0)) then {
			private _class = typeOf (_x select 0);
			private _type = _x select 1;
			private _args = [];
			
			// Process Driver, Gunner, Commander, Cargo or Turret
			switch (_type) do {
				case "driver": {
					_args = [_class , _type];
				};
				case "gunner": {
					_args = [_class , _type];
				};
				case "commander": {
					_args = [_class , _type];
				};
				case "cargo": {
					_args = [_class , _type];
				};
				case "Turret": {
					_args = [_class , _type, _x select 3];
				};
				default {};
			}; 
			// pass details and delete saved unit
			_unitArray pushBack _args;
			deleteVehicle (_x select 0);
		};
	} forEach fullCrew _leader;
	
	// Delete then empty Vehicle
	deleteVehicle _leader;
} else {
	// Save Unit Classname and Delete Template Units
	{
		_unitArray pushBack (typeOf _x);
		deleteVehicle _x;
	} forEach units group _leader;
};

// Create Internal Array
_array = [_templateNumber,_side];
_array pushBack _unitArray;
SR_Template pushBack (_array);
publicVariable "SR_Template";

