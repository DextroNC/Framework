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
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_tshirt_g3_field_pants_mc"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_tshirt_g3_field_pants_mc"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_tshirt_g3_field_pants_mc"
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
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_fg_pelt"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_fg_pelt"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_fg_pelt"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_fg_pelt"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_khk", 0.0675,
            "milgp_f_face_shield_goggles_khk", 0.0675,
            "milgp_f_face_shield_shemagh_khk", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_khk", 0.0675,
            "milgp_f_face_shield_goggles_khk", 0.0675,
            "milgp_f_face_shield_shemagh_khk", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_khk", 0.0675,
            "milgp_f_face_shield_goggles_khk", 0.0675,
            "milgp_f_face_shield_shemagh_khk", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_khk", 0.0675,
            "milgp_f_face_shield_goggles_khk", 0.0675,
            "milgp_f_face_shield_shemagh_khk", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_khk", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;