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
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_TAN",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_TAN",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_TAN",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_TAN",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_OLIVE",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM_TAN",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM",
            "UK3CB_GAF_B_U_SF_CombatSmock_06_MULTICAM"
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
            "rhs_beanie_green",
            "rhs_beanie_green",
            "VSM_Multicam_Cap",
            "VSM_Multicam_Cap",
            "VSM_Multicam_Boonie",
            "VSM_Multicam_Boonie",
            "H_Booniehat_tan",
            "H_Booniehat_tan",
            "H_Cap_blk",
            "H_Cap_blk",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Green",
            "VSM_Bowman_cap_Tan"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_mich_bare_norotos_arc",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset",
            "rhsusf_mich_bare_norotos_arc_tan",
            "rhsusf_mich_bare_norotos_arc_alt_tan",
            "rhsusf_mich_bare_norotos_arc_alt_tan_headset",
            "rhssaf_helmet_m97_olive_nocamo",
            "rhssaf_helmet_m97_olive_nocamo_black_ess",
            "rhssaf_helmet_m97_olive_nocamo_black_ess_bare",
            "rhssaf_helmet_m97_black_nocamo",
            "rhssaf_helmet_m97_black_nocamo_black_ess",
            "rhssaf_helmet_m97_black_nocamo_black_ess_bare",
            "rhssaf_helmet_m97_black_nocamo",
            "rhssaf_helmet_m97_black_nocamo_black_ess",
            "rhssaf_helmet_m97_black_nocamo_black_ess_bare"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhs_beanie_green",
            "rhs_beanie_green",
            "rhssaf_bandana_smb",
            "rhssaf_bandana_smb",
            "VSM_Multicam_Boonie",
            "VSM_Multicam_Boonie",
            "H_Booniehat_tan",
            "H_Booniehat_tan",
            "H_Cap_blk",
            "H_Cap_blk",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Green",
            "VSM_Bowman_cap_Tan"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "UK3CB_H_Ballistic_Mask_Snakeskin_B"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    _goggleArray =[
        "milgp_f_face_shield_RGR", 0.0625,
        "rhs_googles_clear", 0.3875,
        "rhs_scarf", 0.1,
        "G_Bandanna_oli", 0.05,
        "rhsusf_oakley_goggles_blk", 0.1625,
        "rhsusf_oakley_goggles_clr", 0.1625,
        "milgp_f_face_shield_goggles_RGR", 0.075
    ];

    if (headgear _unit in ["rhssaf_helmet_m97_black_nocamo_black_ess","rhssaf_helmet_m97_black_nocamo_black_ess_bare","rhssaf_helmet_m97_olive_nocamo_black_ess","rhssaf_helmet_m97_olive_nocamo_black_ess_bare"]) then {
        _goggleArray =[
            "milgp_f_face_shield_RGR", 0.07,
            "rhs_googles_clear", 0.3875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.05,
            "", 0.325
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;