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
            "7r_amcu_aus_uniform",2,
            "7r_amcu_aus_uniform_ssl",1,
            "7r_amcu_aus_uniform2",8,
            "7r_amcu_aus_uniform2_ssl",4
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_amcu_aus_uniform",2,
            "7r_amcu_aus_uniform_ssl",1,
            "7r_amcu_aus_uniform2",8,
            "7r_amcu_aus_uniform2_ssl",4
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_amcu_aus_uniform",2,
            "7r_amcu_aus_uniform_ssl",1,
            "7r_amcu_aus_uniform2",8,
            "7r_amcu_aus_uniform2_ssl",4
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
            "7r_amcu_opscore",1,
            "7r_amcu_opscore_2",3,
            "7r_amcu_opscore_3",3,
            "7r_amcu_opscore_4",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_amcu_opscore",1,
            "7r_amcu_opscore_2",3,
            "7r_amcu_opscore_3",3,
            "7r_amcu_opscore_4",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_amcu_opscore",1,
            "7r_amcu_opscore_2",3,
            "7r_amcu_opscore_3",3,
            "7r_amcu_opscore_4",3
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_amcu_opscore",1,
            "7r_amcu_opscore_2",3,
            "7r_amcu_opscore_3",3,
            "7r_amcu_opscore_4",3
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandomWeighted _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.15,
            "rhsusf_oakley_goggles_clr", 0.15,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "milgp_f_face_shield_shemagh_khk", 0.05,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.05
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.15,
            "rhsusf_oakley_goggles_clr", 0.15,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "milgp_f_face_shield_shemagh_khk", 0.05,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.15,
            "rhsusf_oakley_goggles_clr", 0.15,
            "", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "milgp_f_face_shield_shemagh_khk", 0.05,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.05
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "rhsusf_shemagh2_gogg_tan", 0.15,
            "rhsusf_oakley_goggles_clr", 0.15,
            "", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "milgp_f_face_shield_shemagh_khk", 0.05,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;