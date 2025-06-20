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
            "7r_g3_mc_fra",3,
            "7r_g3_mc_fra_ssl",3,
            "7r_g3_mc_fra_khk_ssl",2,
            "7r_g3_mc_fra_khk",2,
            "7r_g3_mc_fra",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_g3_mc_fra",3,
            "7r_g3_mc_fra_ssl",3,
            "7r_g3_mc_fra_khk_ssl",2,
            "7r_g3_mc_fra_khk",2,
            "7r_g3_mc_fra",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_g3_mc_fra",3,
            "7r_g3_mc_fra_ssl",3,
            "7r_g3_mc_fra_khk_ssl",2,
            "7r_g3_mc_fra_khk",2,
            "7r_g3_mc_fra",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_sard",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

_helmet_list = [
    "7r_ocp_opscore_2",
    "7r_ocp_opscore_3",
    "7r_ocp_opscore_4",
    "7r_ocp_opscore_2"
];

_helmet_list_pl_and_echo = [
    "7r_khk_opscore_2",
    "7r_khk_opscore_3",
    "7r_khk_opscore_4",
    "7r_khk_opscore_2",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_fg_pelt_cam",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_fg_pelt_cam"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _helmet_list_pl_and_echo;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _helmet_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _helmet_list_pl_and_echo;
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = _helmet_list;
    };
    //Selects random hat from determined array, runs

_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;



//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.125,
            "7r_scrim_forest", 0.1,
            "UK3CB_G_Neck_Shemag_Tan", 0.25,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.0875,
            "rhsusf_shemagh2_gogg_tan", 0.0875,
            "rhsusf_oakley_goggles_clr", 0.0875,
            "rhsusf_shemagh2_clear_gogg_tan", 0.0875
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.125,
            "7r_scrim_forest", 0.1,
            "UK3CB_G_Neck_Shemag_Tan", 0.25,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.0875,
            "rhsusf_shemagh2_gogg_tan", 0.0875,
            "rhsusf_oakley_goggles_clr", 0.0875,
            "rhsusf_shemagh2_clear_gogg_tan", 0.0875
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.125,
            "UK3CB_G_Neck_Shemag_Tan", 0.4,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.125,
            "rhsusf_oakley_goggles_clr", 0.125
        ];
    };

    //Sierra 
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_oakley_goggles_clr", 0.075,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;