/*

	Parameters:
		<-- Group as Group
		<-- Units as Array
		<-- Position as Array
		<-- Optional: Direction for Vehicles as Integer

	Return:
		--> Leader as Object

	Description:
		Spawns the Units according to a Template.

	Example:
		_return = [_template] fw_fnc_spawnTemplateUnits;

*/

// Parameter Init
params ["_group","_units","_spawnPos",["_direction",0]];
private _leader = objNull;

// Infantry
if ((_units select 0) isKindOf "Man") then {
	for "_i" from 0 to (count _units - 1) do
	{
		// Spawn Unit
		private _unit = _group createUnit [(_units select _i), _spawnPos, [], 0, "FORM"];
		[_unit] join _group;
		// Adjust NVG
		if (count SR_AI_NVG > 0) then {
			_unit linkItem SR_AI_NVG;
		};
		// Adjust Flashlights
		if (SR_AI_removeNVG || SR_AI_addFlashlight) then {
			[_unit] spawn fw_fnc_removeNVG;
		};
		// Set first Unit as Leader
		If (_i == 0) then
		{
			_leader = _unit;
		};
	};
};

// Vehicle and Infantry
if (!((_units select 0) isKindOf "Man")) then {
	// Spawn Vehicle
	_vehicle = createVehicle [(_units select 0), _spawnPos, [], 0, "NONE"];
	
	// Modify Vehicle
	_vehicle setDir _direction;
	_vehicle disableTIEquipment true;

	// Remove vehicle form unit array
	_units = _units - [(_units select 0)];

	// Spawn Infantry
	{
		// Parameter Init
		private _type = _x select 0;
		private _slot = _x select 1;

		// Create Unit
		private _unit = _group createUnit [_type, _spawnPos, [], 0, "FORM"];
		[_unit] join _group;

		// Assign Vehicle Slot
		switch (_slot) do {
			case "driver": {
				_unit moveInDriver _vehicle;
				_unit assignAsDriver _vehicle;
				_leader = _unit;
			};
			case "gunner": {
				_unit moveInGunner _vehicle;
				_unit assignAsGunner _vehicle;
			};
			case "commander": {
				_unit moveInCommander _vehicle;
				_unit assignAsCommander _vehicle;
			};
			case "cargo": {
				_unit moveInCargo _vehicle;
				_unit assignAsCargo _vehicle;
			};
			case "turret": {
				private _path = _x select 2;
				_unit moveInTurret [_vehicle, _path];
				_unit assignAsTurret [_vehicle, _path];
			};

		};
		[_unit] orderGetIn true;

		// Adjust NVG
		if (count SR_AI_NVG > 0) then {
			_unit linkItem SR_AI_NVG;
		};
		// Adjust Flashlights
		if (SR_AI_removeNVG || SR_AI_addFlashlight) then {
			[_unit] spawn fw_fnc_removeNVG;
		};
	} forEach _units;
};

// Return
_leader