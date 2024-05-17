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
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP",
            "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
            "UK3CB_BAF_U_JumperUniform_MTP"
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

_helmet_list = [
    "7r_ocp_opscore_2",
    "7r_ocp_opscore_3",
    "7r_ocp_opscore_4"
];

_helmet_list_pl_and_echo = [
    "rhsusf_opscore_rg_cover_pelt",
    "rhsusf_opscore_rg_cover_pelt",
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
            "UK3CB_G_Neck_Shemag_Tan", 0.4,
            "rhs_googles_clear", 0.25,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_oakley_goggles_clr", 0.075,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_arid", 0.225,
            "UK3CB_G_Neck_Shemag_Tan", 0.3,
            "rhs_googles_clear", 0.125,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_oakley_goggles_clr", 0.075,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.025,
            "UK3CB_G_Neck_Shemag_Tan", 0.45,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_blk", 0.1
        ];
    };

    //Sierra 
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.4,
            "rhs_googles_clear", 0.25,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_oakley_goggles_clr", 0.075,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;