/*
    Parameters:
        <--Class

    Description:
        List which selects a random uniform and hat based on what section they are (_Class).

    _Class
        1 - Echo
        2 - Squad
        3 - Platoon
        4 - Sierra
    
    Example (in terminal script):
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

    Return:
        --> Nada, performs functions within script.
*/

//Pulls information from loadout, looks for classtype
    params ["_unit", "_Class"];

//Creates array of uniforms and hats
    _uniformArray = "";
    _hatArray = "";
    _goggleArray = "";

//Appends array of uniforms with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _uniformArray = [
            "rhsgref_uniform_para_ttsko_mountain"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhsgref_uniform_para_ttsko_mountain"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhsgref_uniform_para_ttsko_mountain"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_ard"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

_noess_list = [
    "rhssaf_helmet_m97_olive_nocamo",
    "rhssaf_helmet_m97_olive_nocamo"
];

_ess_list = [
    "rhssaf_helmet_m97_olive_nocamo_black_ess",
    "rhssaf_helmet_m97_olive_nocamo_black_ess_bare"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_OGA_OD_OPS",
            "VSM_OD_spray_OPS",
            "VSM_OGA_OD_OPS_2",
            "VSM_OD_spray_OPS_2"
        ];
    };
    //Selects random hat from determined array, runs

_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

if (_helmet in _ess_list) then {_class = 5};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class <= 3) then{
        _goggleArray = [
            "VSM_Shemagh_OD", 0.1625,
            "VSM_Shemagh_Facemask_OD", 0.1625,
            "rhs_googles_clear", 0.325,
            "rhs_scarf", 0.1,
            "VSM_Goggles", 0.125,
            "VSM_Shemagh_Facemask_OD_Goggles", 0.125
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "VSM_Shemagh_OD", 0.2,
            "VSM_Shemagh_Facemask_OD", 0.2,
            "rhs_googles_clear", 0.35,
            "rhs_scarf", 0.05,
            "VSM_Goggles", 0.2
        ];
    };

    //ESS On Helmet 
    if (_Class == 5) then{
        _goggleArray = [
            "VSM_Shemagh_OD", 0.325,
            "VSM_Shemagh_Facemask_OD", 0.325,
            "rhs_scarf", 0.075,
            "", 0.275
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;