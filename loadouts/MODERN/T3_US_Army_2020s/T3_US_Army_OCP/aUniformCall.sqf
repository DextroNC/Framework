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
            "rhs_uniform_acu_oefcp"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhs_uniform_acu_oefcp"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhs_uniform_acu_oefcp"
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

_noess_list = [
    "rhsusf_ach_helmet_ocp",
    "rhsusf_ach_helmet_ocp_alt",
    "rhsusf_ach_helmet_headset_ocp",
    "rhsusf_ach_helmet_headset_ocp_alt",
    "rhsusf_ach_helmet_headset_ocp",
    "rhsusf_ach_helmet_headset_ocp_alt"
];

_ess_list = [
    "rhsusf_ach_helmet_ESS_ocp",
    "rhsusf_ach_helmet_ESS_ocp_alt",
    "rhsusf_ach_helmet_headset_ess_ocp",
    "rhsusf_ach_helmet_headset_ess_ocp_alt",
    "rhsusf_ach_helmet_headset_ess_ocp",
    "rhsusf_ach_helmet_headset_ess_ocp_alt"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list + ["rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_camo_ocp"];
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
            "UK3CB_G_Neck_Shemag_Tan", 0.2,
            "rhs_googles_clear", 0.35,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.2,
            "rhs_googles_clear", 0.35,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //ESS On Helmet 
    if (_Class == 5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.35,
            "rhs_googles_clear", 0.3,
            "", 0.35
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;