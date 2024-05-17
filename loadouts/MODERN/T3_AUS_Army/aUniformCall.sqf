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
		    "7r_g3_amcu",8,
		    "7r_g3_amcu_ssl",6,
		    "7r_g3_amcu_tee",3,
		    "7r_g3_amcu_khk",3,
		    "7r_g3_amcu_khk_ssl",2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
		    "7r_g3_amcu",8,
		    "7r_g3_amcu_ssl",6,
		    "7r_g3_amcu_tee",3,
		    "7r_g3_amcu_khk",3,
		    "7r_g3_amcu_khk_ssl",2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
		    "7r_g3_amcu",8,
		    "7r_g3_amcu_ssl",6,
		    "7r_g3_amcu_tee",3,
		    "7r_g3_amcu_khk",3,
		    "7r_g3_amcu_khk_ssl",2
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

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "rhsusf_opscore_fg_pelt",1,
            "rhsusf_opscore_fg_pelt_cam",1,
            "rhsusf_opscore_fg_pelt_nsw",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_amcu_opscore_2",1,
            "7r_amcu_opscore_3",1,
            "7r_amcu_opscore_4",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_fg_pelt",1,
            "rhsusf_opscore_fg_pelt_cam",1,
            "rhsusf_opscore_fg_pelt_nsw",1
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_amcu_opscore_2",1,
            "7r_amcu_opscore_3",1,
            "7r_amcu_opscore_4",1
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandomWeighted _hatArray;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "UK3CB_G_Neck_Shemag_Tan", 0.45
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "7r_scrim_forest", 0.225,
            "UK3CB_G_Neck_Shemag_Tan", 0.225
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "UK3CB_G_Neck_Shemag_Tan", 0.45
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "UK3CB_G_Neck_Shemag_Tan", 0.45
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;