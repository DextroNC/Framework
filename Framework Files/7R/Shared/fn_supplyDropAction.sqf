/*
	Parameters:
		<-- Vehicle as Object
		<-- Player as Object
		<-- Parameters as Array

	Description:
		Children Action for Supply Drops


	Example:
		[target, player, [params]] call fw_fnc_supplyDropAction;

*/

// Paramter Init
params ["_vehicle", "_player"];
private _actions = [];
private _options = [];

// Create Array of Options 
{
	// Check if multiple boxes can be called at once
	_x params ["_class","_description",["_loadout",-1],["_amount",1]];
	for "_i" from 1 to _amount do {
		_options pushBack  [_class,(_description + " x" + str(_i)), _loadout , _i,_forEachIndex];
	};
} forEach SR_SupplyBoxes;


// Create Children Action
{
    // Parameter Init
	private _array = _x;
	_array params ["_class","_description","_loadout","_amount","_type"];

	// Check Condition
    if ([_player] call fw_fnc_isLeader) then {
        _code = [
                    _description,
                   	_description,
                    "",
                    { 
						params ["_target", "_player", "_params"];
						_params params ["_class","_description","_loadout","_amount","_type"];
                        nul = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", _amount, _type] spawn fw_fnc_supplyDropInit;
                    },
                    {true},
                    {},
                    _array
                ] call ace_interact_menu_fnc_createAction,
        _actions pushBack [_code,[],_vehicle];
        true
    } else {
        false
    };
} count  _options;

_actions