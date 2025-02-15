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
            "UK3CB_BAF_U_CombatUniform_DPMT",
            "UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_DPMT",
            "UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_DPMT",
            "UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve"
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

//Appends array of hats with desired uniforms based on _Class
_ess_list = ["UK3CB_BAF_H_Mk6_DPMT_D","UK3CB_BAF_H_Mk6_DPMT_E","UK3CB_BAF_H_Mk6_DPMT_F","UK3CB_BAF_H_Mk6_DPMT_F"];
_noess_list = ["UK3CB_BAF_H_Mk6_DPMT_A","UK3CB_BAF_H_Mk6_DPMT_B","UK3CB_BAF_H_Mk6_DPMT_C","UK3CB_BAF_H_Mk6_DPMT_C"];

    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _ess_list + _noess_list
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = _ess_list + _noess_list
    };
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_List) then {_class = _class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_clear", 0.425,
            "VSM_Shemagh_OD", 0.1,
            "rhsusf_oakley_goggles_clr", 0.225,
            "VSM_Peltor_OD_glasses", 0.05,
            "VSM_Shemagh_Goggles_OD", 0.2
        ];
    };
    
    //Echo Goggles On Helmet
    if (_Class == 1.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.65,
            "VSM_Shemagh_OD", 0.3,
            "VSM_Peltor_OD_glasses", 0.05
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_clear", 0.425,
            "VSM_Shemagh_OD", 0.1,
            "rhsusf_oakley_goggles_clr", 0.225,
            "VSM_Peltor_OD_glasses", 0.05,
            "VSM_Shemagh_Goggles_OD", 0.2
        ];
    };
    
    //Squad Goggles On Helmet
    if (_Class == 2.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.65,
            "VSM_Shemagh_OD", 0.3,
            "VSM_Peltor_OD_glasses", 0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_clear", 0.425,
            "VSM_Shemagh_OD", 0.1,
            "rhsusf_oakley_goggles_clr", 0.225,
            "VSM_Shemagh_Goggles_OD", 0.25
        ];
    };
    
    //Platoon Goggles On Helmet
    if (_Class == 3.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.65,
            "VSM_Shemagh_OD", 0.35
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_clear", 0.425,
            "VSM_Shemagh_OD", 0.1,
            "rhsusf_oakley_goggles_clr", 0.225,
            "VSM_Shemagh_Goggles_OD", 0.25
        ];
    };
    
    //Sierra Goggles On Helmet
    if (_Class == 4.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.65,
            "VSM_Shemagh_OD", 0.35
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;