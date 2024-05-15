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
        [_unit, 1] call compile preprocheadsetFileLineNumbers "loadouts\aUniformCall.sqf";

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

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "7r_marine_d_opscore_2",
            "7r_marine_d_opscore_3",
            "7r_marine_d_opscore_4"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_marpat_d_opscore_2",
            "7r_marpat_d_opscore_3",
            "7r_marpat_d_opscore_4"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_marine_d_opscore_2",
            "7r_marine_d_opscore_3",
            "7r_marine_d_opscore_4"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_marine_d_opscore_2",
            "7r_marine_d_opscore_3",
            "7r_marine_d_opscore_4"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "7r_scrim_arid", 0.325,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_oakley_goggles_clear", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_arid", 0.325,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_oakley_goggles_clear", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.3,
            "rhs_googles_clear", 0.35,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_oakley_goggles_clear", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.3,
            "rhs_googles_clear", 0.35,
            "rhsusf_oakley_goggles_blk", 0.075,
            "rhsusf_oakley_goggles_clear", 0.075,
            "rhsusf_shemagh2_gogg_tan", 0.05,
            "rhsusf_shemagh2_clear_gogg_tan", 0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;