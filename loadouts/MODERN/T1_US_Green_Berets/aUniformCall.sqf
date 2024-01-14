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
            "milgp_u_fleece_khk_g3_field_pants_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_fleece_rgr_g3_field_pants_mc",
            "milgp_u_fleece_rgr_g3_field_pants_mc"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc"
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
    "7r_khk_opscore_2"
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
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_shemagh2_gogg_tan",0.175,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",0.175,
            "rhs_googles_clear",0.175
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_shemagh2_gogg_tan",0.175,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",0.175,
            "rhs_googles_clear",0.175
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_oakley_goggles_blk",0.35,
            "rhs_googles_clear",0.35
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_shemagh2_gogg_tan",0.175,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",0.175,
            "rhs_googles_clear",0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;