/*
	Parameters:
		<-- Vehicle as Object
		<-- Player as Object
		<-- Parameters as Array

	Description:
		Children Action for Supply Loading


	Example:
		[target, player, [params]] call fw_fnc_supplySpawnAction;

*/

// Paramter Init
params ["_vehicle", "_player"];
private _actions = [];

// Create Children Action
{
    // Parameter Init
	private _array = _x;
	_array params ["_class","_description"];

	// Check Condition
    if (vehicle _player != _player) then {
        _code = [
                    _description,
                   	_description,
                    "",
                    { 
						params ["_target", "_player", "_params"];
						_params params ["_description","_type"];
                        nul = [vehicle _player,_type] spawn fw_fnc_supplyLoad;
                    },
                    {true},
                    {},
                    [_description,_forEachIndex]
                ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_code,[],_vehicle];
	};
} forEach SR_SupplyBoxes;

_actions