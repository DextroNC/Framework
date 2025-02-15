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
            "7r_bdu_ldf",2,
            "7r_bdu_bti_ldf",2,
            "7r_bdu_btisrl_ldf",3,
            "7r_bdu_srl_ldf",1,
            "7r_bdu_srh_ldf",1,
            "7r_bdu_bnu_ldf",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_bdu_ldf",2,
            "7r_bdu_bti_ldf",2,
            "7r_bdu_btisrl_ldf",3,
            "7r_bdu_srl_ldf",1,
            "7r_bdu_srh_ldf",1,
            "7r_bdu_bnu_ldf",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_bdu_ldf",2,
            "7r_bdu_bti_ldf",2,
            "7r_bdu_btisrl_ldf",3,
            "7r_bdu_srl_ldf",1,
            "7r_bdu_srh_ldf",1,
            "7r_bdu_bnu_ldf",3
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_lsh",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

_ess_list = [
    "7r_ldf_wz2005_ess",
    "7r_ldf_wz2005_headset_ess",
    "7r_odg_wz2005_ess",
    "7r_odg_wz2005_headset_ess"
];

_noess_list = [
    "7r_ldf_wz2005_headset",
    "7r_ldf_wz2005",
    "7r_odg_wz2005_headset",
    "7r_odg_wz2005"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "7r_odg_wz2005_headset",
            "7r_odg_wz2005",
            "7r_odg_wz2005_ess",
            "7r_odg_wz2005_headset_ess"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_ldf_wz2005_headset",
            "7r_ldf_wz2005",
            "7r_ldf_wz2005_ess",
            "7r_ldf_wz2005_headset_ess"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_odg_wz2005_headset",
            "7r_odg_wz2005",
            "7r_odg_wz2005_ess",
            "7r_odg_wz2005_headset_ess"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_fg_pelt_nsw",
            "rhsusf_opscore_fg_pelt_cam",
            "rhsusf_opscore_fg_pelt"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_List) then {_class = _class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "7r_scrim_lush", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.2,
            "rhs_googles_clear", 0.125,
            "", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Echo Goggles On Helmet
    if (_Class == 1.5) then{
        _goggleArray = [
            "7r_scrim_lush", 0.475,
            "UK3CB_G_Neck_Shemag_Tan", 0.35,
            "rhs_googles_clear", 0.125
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_lush", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.2,
            "rhs_googles_clear", 0.125,
            "", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Squad Goggles On Helmet
    if (_Class == 2.5) then{
        _goggleArray = [
            "7r_scrim_lush", 0.475,
            "UK3CB_G_Neck_Shemag_Tan", 0.35,
            "rhs_googles_clear", 0.125
        ];
    };

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.375,
            "rhs_googles_clear", 0.375,
            "", 0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Sierra Goggles On Helmet
    if (_Class == 4.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.525,
            "rhs_googles_clear", 0.465
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;