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
            "7r_bdu_ddpm",1,
            "7r_bdu_btisrl_ddpm",1,
            "7r_bdu_bti_ddpm",1,
            "7r_bdu_srh_ddpm",1.5,
            "7r_bdu_srl_ddpm",1.5,
            "7r_bdu_bnu_ddpm",1.5
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_bdu_ddpm",1,
            "7r_bdu_btisrl_ddpm",1,
            "7r_bdu_bti_ddpm",1,
            "7r_bdu_srh_ddpm",1.5,
            "7r_bdu_srl_ddpm",1.5,
            "7r_bdu_bnu_ddpm",1.5
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_bdu_ddpm",1,
            "7r_bdu_btisrl_ddpm",1,
            "7r_bdu_bti_ddpm",1,
            "7r_bdu_srh_ddpm",1.5,
            "7r_bdu_srl_ddpm",1.5,
            "7r_bdu_bnu_ddpm",1.5
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_ard",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

_ess_list = [
    "UK3CB_BAF_H_Mk6_DDPM_D",
    "UK3CB_BAF_H_Mk6_DDPM_E",
    "UK3CB_BAF_H_Mk6_DDPM_F"
];

_noess_list = [
    "UK3CB_BAF_H_Mk6_DDPM_A",
    "UK3CB_BAF_H_Mk6_DDPM_B",
    "UK3CB_BAF_H_Mk6_DDPM_C"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_D",
            "UK3CB_BAF_H_Mk6_DDPM_E",
            "UK3CB_BAF_H_Mk6_DDPM_F"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_D",
            "UK3CB_BAF_H_Mk6_DDPM_E",
            "UK3CB_BAF_H_Mk6_DDPM_F"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_B",
            "UK3CB_BAF_H_Mk6_DDPM_C",
            "UK3CB_BAF_H_Mk6_DDPM_D",
            "UK3CB_BAF_H_Mk6_DDPM_E",
            "UK3CB_BAF_H_Mk6_DDPM_F"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_mich_bare_norotos_arc",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset"
        ];
    };
    //Selects random hat from determined array, runs
    
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_list) then {_Class = _Class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_clr", 0.2,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.15
        ];
    };
    
    //Echo - Goggles on Head
    if (_Class == 1.5) then{
        _goggleArray = [
            "", 0.45,
            "usm_scarf", 0.15,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.25
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_clr", 0.2,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.15
        ];
    };

    //Squad - Goggles on Head
    if (_Class == 2.5) then{
        _goggleArray = [
            "", 0.45,
            "usm_scarf", 0.15,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.25
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_clr", 0.2,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.15
        ];
    };

    //Platoon - Goggles on Head
    if (_Class == 3.5) then{
        _goggleArray = [
            "", 0.45,
            "usm_scarf", 0.15,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_black", 0.175,
            "rhs_googles_clear", 0.175,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_clr", 0.2,
            "usm_kneepads_blk", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.15
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;