/*
    Parameters:
        <-- Uniforms box as Object
        <-- Array of uniforms

    Description:
        Adds loadouts/uniforms to the uniform box.

    Example (in _uniforms_box.sqf):
        [this, _uniforms] call fw_fnc_addUniformsToBox;

        _uniforms should be in this format:
        [
            ["Element name", "Element color", "Element icon", [
                ["Uniform name", "UniformFile"],
                ["Uniform name", "UniformFile"],
                ["Uniform name", "UniformFile"]
            ]],
            ["Element name", "Element color", "Element icon", [
                ["Uniform name", "UniformFile"],
                ["Uniform name", "UniformFile"],
                ["Uniform name", "UniformFile"]
            ]]
        ]

    Return:
        --> Nil
*/

params ["_box", "_uniforms"];

// Clear all other interactions from the object.
[_box, _box] call ace_common_fnc_claim;

private _maxSelectionDistance = 20;
private _uniformsBoxActionName = "UniformsBoxAction";

private _uniformsBoxAction = [
    _uniformsBoxActionName,
    "Choose loadout",
    "a3\ui_f\data\igui\cfg\simpletasks\types\rifle_ca.paa",
    {},                 // statement
    {true},             // condition
    {},                 // children
    [],                 // args
    "",                 // position
    _maxSelectionDistance
] call ace_interact_menu_fnc_createAction;
[_box, 0, [], _uniformsBoxAction] call ace_interact_menu_fnc_addActionToObject;

{ // Loop over every element in the uniforms array.
    private _element_name = _x select 0;
    private _element_color = _x select 1;
    private _element_icon = _x select 2;
    private _element_uniforms = _x select 3;
    private _elementAction = [_element_name, [_element_name, _element_color] call fw_fnc_makeColor, _element_icon, {}, {true}, {}, [], "", _maxSelectionDistance] call ace_interact_menu_fnc_createAction;
    [_box, 0, [_uniformsBoxActionName], _elementAction] call ace_interact_menu_fnc_addActionToObject;

    { // Loop over every uniform in the element.
        private _uniform = _x select 0;
        private _uniform_file = _x select 1;
        private _uniformStatement = {
            params ["_target", "_player", "_params"];
            call compile preprocessFileLineNumbers _params select 0;
        };
        private _uniformAction = [_uniform, _uniform, "", _uniformStatement, {true}, {}, _uniform_file, "", _maxSelectionDistance] call ace_interact_menu_fnc_createAction;
        [_box, 0, [_uniformsBoxActionName, _element_name], _uniformAction] call ace_interact_menu_fnc_addActionToObject;

        // LEGACY: scroll interaction
        _box addaction [_uniform, _uniform_file];

    } forEach _element_uniforms;

} forEach _uniforms;

private _saveAction = ["SaveLoadout", ["Save Loadout", "#ffffff"] call fw_fnc_makeColor, "", {(_this select 1) setVariable ["SR_uniform", getUnitLoadout (_this select 1)];}, {true}, {}, [], "", _maxSelectionDistance] call ace_interact_menu_fnc_createAction;
[_box, 0, [_uniformsBoxActionName], _saveAction] call ace_interact_menu_fnc_addActionToObject;
private _loadAction = ["LoadLoadout", ["Load Loadout", "#ffffff"] call fw_fnc_makeColor, "", {(_this select 1) setUnitLoadout ((_this select 1) getVariable ["SR_uniform", []]);}, {true}, {}, [], "", _maxSelectionDistance] call ace_interact_menu_fnc_createAction;
[_box, 0, [_uniformsBoxActionName], _loadAction] call ace_interact_menu_fnc_addActionToObject;

// LEGACY: scroll interaction
_box addaction [["Save Loadout", "#00ffff"] call fw_fnc_makeColor, {(_this select 1) setVariable ["SR_uniform", getUnitLoadout (_this select 1)];}];
_box addaction [["Load Loadout", "#00ffff"] call fw_fnc_makeColor, {(_this select 1) setUnitLoadout ((_this select 1) getVariable ["SR_uniform", []]);}];
