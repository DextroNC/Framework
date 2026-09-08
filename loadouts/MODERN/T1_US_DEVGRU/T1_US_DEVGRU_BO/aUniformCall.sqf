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
            "U_BG_Guerilla2_2",
            "U_BG_Guerilla2_1",
            "U_BG_Guerilla2_3",
            "U_BG_Guerilla3_1",
            "UK3CB_MEC_C_Pants_U_06",
            "UK3CB_ADC_C_Hunter_U_04",
            "UK3CB_CHC_C_U_COACH_04"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "U_BG_Guerilla2_2",
            "U_BG_Guerilla2_1",
            "U_BG_Guerilla2_3",
            "U_BG_Guerilla3_1",
            "UK3CB_MEC_C_Pants_U_06",
            "UK3CB_ADC_C_Hunter_U_04",
            "UK3CB_CHC_C_U_COACH_04"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "U_BG_Guerilla2_2",
            "U_BG_Guerilla2_1",
            "U_BG_Guerilla2_3",
            "U_BG_Guerilla3_1",
            "UK3CB_MEC_C_Pants_U_06",
            "UK3CB_ADC_C_Hunter_U_04",
            "UK3CB_CHC_C_U_COACH_04"
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
            "VSM_Peltor_OD",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Tan",
            "usm_bdu_boonie_odg",
            "rhsusf_Bowman",
            "H_Watchcap_khk",
            "H_Watchcap_camo"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "VSM_Peltor_OD",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Tan",
            "usm_bdu_boonie_odg",
            "rhsusf_Bowman",
            "H_Watchcap_khk",
            "H_Watchcap_camo"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "VSM_Peltor_OD",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Tan",
            "usm_bdu_boonie_odg",
            "rhsusf_Bowman",
            "H_Watchcap_khk",
            "H_Watchcap_camo"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_Peltor_OD",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Tan",
            "usm_bdu_boonie_odg",
            "rhs_headband",
            "rhsusf_Bowman",
            "H_Watchcap_khk",
            "H_Watchcap_camo"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_rgr", 0.0675,
            "milgp_f_face_shield_goggles_rgr", 0.0675,
            "milgp_f_face_shield_shemagh_rgr", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_rgr", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_rgr", 0.0675,
            "milgp_f_face_shield_goggles_rgr", 0.0675,
            "milgp_f_face_shield_shemagh_rgr", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_rgr", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_rgr", 0.0675,
            "milgp_f_face_shield_goggles_rgr", 0.0675,
            "milgp_f_face_shield_shemagh_rgr", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_rgr", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.225,
            "milgp_f_face_shield_rgr", 0.0675,
            "milgp_f_face_shield_goggles_rgr", 0.0675,
            "milgp_f_face_shield_shemagh_rgr", 0.0675,
            "milgp_f_face_shield_goggles_shemagh_rgr", 0.0675,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;