/*
	Parameters:
		<-- Vehicle as Object
		<-- Player as Object
		<-- Parameters as Array

	Description:
		Children Action for Sling-Load Supply Drops


	Example:
		[target, player, [params]] call fw_fnc_supplyDropAction;

*/

// Paramter Init
params ["_vehicle", "_player"];
private _actions = [];
private _options = [];

// Create Children Action
{
    // Parameter Init
	private _array = _x;
	_array params ["_class","_description"];

	// Check Condition
    if ((_player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot") then {
        _code = [
                    _description,
                   	_description,
                    "",
                    { 
						params ["_target", "_player", "_params"];
						_params params ["_description","_type"];
                        nul = [_type,slingpad] spawn fw_fnc_cargoSpawn;
                    },
                    {true},
                    {},
                    [_description,_forEachIndex]
                ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_code,[],_vehicle];
	};
} forEach  SR_SupplyBoxes;

_actions