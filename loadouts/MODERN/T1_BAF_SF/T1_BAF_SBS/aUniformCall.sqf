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
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09",
            "UK3CB_LSM_B_U_Crew_CombatSmock_03",
            "UK3CB_LSM_B_U_CombatSmock_07",
            "UK3CB_LSM_B_U_Crew_CombatSmock_09"
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
    _helmet_list = [
    "7r_mtp_opscore_2",
    "7r_mtp_opscore_3",
    "7r_mtp_opscore_4"
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
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_shemagh2_gogg_tan",.0875,
            "rhsusf_shemagh2_clear_gogg_tan",.0875,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",.0875,
            "rhsusf_oakley_goggles_clr",.0875,
            "rhs_googles_clear",0.175
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.125,
            "milgp_f_face_shield_khk",0.05,
            "milgp_f_face_shield_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_MC",0.05,
            "milgp_f_face_shield_goggles_shemagh_khk",0.05,
            "milgp_f_face_shield_goggles_khk",0.05,
            "milgp_f_face_shield_goggles_MC",0.05,
            "rhsusf_shemagh2_gogg_tan",.0875,
            "rhsusf_shemagh2_clear_gogg_tan",.0875,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",.0875,
            "rhsusf_oakley_goggles_clr",.0875,
            "rhs_googles_clear",0.175
        ];
    };

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
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
            "rhsusf_shemagh2_gogg_tan",.0875,
            "rhsusf_shemagh2_clear_gogg_tan",.0875,
            "G_Balaclava_blk",0.175,
            "rhsusf_oakley_goggles_blk",.0875,
            "rhsusf_oakley_goggles_clr",.0875,
            "rhs_googles_clear",0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;