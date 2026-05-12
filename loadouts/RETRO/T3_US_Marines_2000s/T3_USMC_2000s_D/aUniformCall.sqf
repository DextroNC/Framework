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
            "rhs_uniform_FROG01_d"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhs_uniform_FROG01_d"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhs_uniform_FROG01_d"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_sard"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

_ess_list = [
    "rhsusf_lwh_helmet_marpatd_ess",
    "rhsusf_lwh_helmet_marpatd_headset"
];

_noess_list = [
    "rhsusf_lwh_helmet_marpatd",
    "rhsusf_lwh_helmet_marpatd"
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
        _hatArray = _ess_list + _noess_list;
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_List) then {_class = _class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhs_ess_black", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };
    
    //Echo - Goggles on Head
    if (_Class == 1.5) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhs_ess_black", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Squad - Goggles on Head
    if (_Class == 2.5) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhs_ess_black", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Platoon - Goggles on Head
    if (_Class == 3.5) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhs_ess_black", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Sierra
    if (_Class == 4.5) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "", 0.2,
            "UK3CB_G_KLR_TAN", 0.35
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;