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
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_fleece_grey_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mc",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
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
    "7r_ocp_opscore_4",
    "7r_ocp_opscore_2"
];

_helmet_list_pl_and_echo = [
    "7r_khk_opscore_2",
    "7r_khk_opscore_3",
    "7r_khk_opscore_4",
    "7r_khk_opscore_2",
    "rhsusf_opscore_rg_cover_pelt",
    "rhsusf_opscore_rg_cover_pelt",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_fg_pelt_cam",
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
            "7r_scrim_arid", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_MC", 0.125,
            "rhsusf_shemagh2_tan", 0.125,
            "milgp_f_face_shield_goggles_MC", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_arid", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_MC", 0.125,
            "rhsusf_shemagh2_tan", 0.125,
            "milgp_f_face_shield_goggles_MC", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhsusf_oakley_goggles_clr", 0.125,
            "rhsusf_oakley_goggles_blk", 0.125,
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_MC", 0.125,
            "rhsusf_shemagh2_tan", 0.125,
            "milgp_f_face_shield_goggles_MC", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Sierra 
    if (_Class == 4) then{
        _goggleArray = [
            "7r_scrim_arid", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_MC", 0.125,
            "rhsusf_shemagh2_tan", 0.125,
            "milgp_f_face_shield_goggles_MC", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;