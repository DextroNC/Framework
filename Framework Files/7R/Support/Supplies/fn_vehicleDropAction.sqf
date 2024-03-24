/*
	Parameters:
		<-- Vehicle as Object
		<-- Player as Object
		<-- Parameters as Array

	Return:
		--> Children actions as Array

	Description:
		Creates ace self actions for vehicle drops

*/

// Parameter Init
params ["_vehicle", "_player"];
private _actions = [];

{
    private _array = _x;
	_array params ["_name", "_class", "_loadout",["_textureArray",[]]];
	_code = [
		_name,
		_name,
		"",
		{
			private _dz = (_player nearObjects ["ACE_DropZone", 150]) select 0;
			_this select 2 params ["_class", "_loadout", "_textureArray"];
			nul = [_dz, "STARTSPAWN", "RHS_C130J", "Pegasus 5-1", 1, 1, [_class, _loadout,_textureArray]] spawn fw_fnc_supplyDropInit;
		},
		{[_player] call fw_fnc_canCallVehicleDrop},
		{},
		[_class,_loadout,_textureArray]
	] call ace_interact_menu_fnc_createAction;

	_actions pushBack [_code, [], _vehicle];
	
	true

} count SR_Vehicle_Drop;

_actions
