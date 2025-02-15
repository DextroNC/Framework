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
            "7r_bdu_digital",2,
            "7r_bdu_bti_digital",2,
            "7r_bdu_btisrl_digital",2,
            "7r_bdu_srl_digital",2,
            "7r_bdu_srh_digital",3,
            "7r_bdu_bnu_digital",3,
            "7r_bdu_digital_2",4,
            "7r_bdu_bti_digital_2",2,
            "7r_bdu_btisrl_digital_2",2,
            "7r_bdu_srl_digital_2",2,
            "7r_bdu_srh_digital_2",3,
            "7r_bdu_bnu_digital",6,
            "7r_bdu_digital_1",2,
            "7r_bdu_bti_digital_1",2,
            "7r_bdu_btisrl_digital_1",2,
            "7r_bdu_srl_digital_1",2,
            "7r_bdu_srh_digital_1",3,
            "7r_bdu_bnu_digital_3",6
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_bdu_digital",2,
            "7r_bdu_bti_digital",2,
            "7r_bdu_btisrl_digital",2,
            "7r_bdu_srl_digital",2,
            "7r_bdu_srh_digital",3,
            "7r_bdu_bnu_digital",3,
            "7r_bdu_digital_2",4,
            "7r_bdu_bti_digital_2",2,
            "7r_bdu_btisrl_digital_2",2,
            "7r_bdu_srl_digital_2",2,
            "7r_bdu_srh_digital_2",3,
            "7r_bdu_bnu_digital",6,
            "7r_bdu_digital_1",2,
            "7r_bdu_bti_digital_1",2,
            "7r_bdu_btisrl_digital_1",2,
            "7r_bdu_srl_digital_1",2,
            "7r_bdu_srh_digital_1",3,
            "7r_bdu_bnu_digital_3",6
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_bdu_digital",2,
            "7r_bdu_bti_digital",2,
            "7r_bdu_btisrl_digital",2,
            "7r_bdu_srl_digital",2,
            "7r_bdu_srh_digital",3,
            "7r_bdu_bnu_digital",3,
            "7r_bdu_digital_2",4,
            "7r_bdu_bti_digital_2",2,
            "7r_bdu_btisrl_digital_2",2,
            "7r_bdu_srl_digital_2",2,
            "7r_bdu_srh_digital_2",3,
            "7r_bdu_bnu_digital",6,
            "7r_bdu_digital_1",2,
            "7r_bdu_bti_digital_1",2,
            "7r_bdu_btisrl_digital_1",2,
            "7r_bdu_srl_digital_1",2,
            "7r_bdu_srh_digital_1",3,
            "7r_bdu_bnu_digital_3",6
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

    _ess_list = ["7r_m92_digital_1_ess","7r_m92_digital_1_headset_ess","7r_m92_digital_ess","7r_m92_digital_headset_ess"];

    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "7r_m92_digital_1_headset",2,
            "7r_m92_digital_1_headset_ess",2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_m92_digital_ess",1,
            "7r_m92_digital_headset",2,
            "7r_m92_digital_headset_ess",2,
            "7r_m92_digital",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_m92_digital_1_headset",2,
            "7r_m92_digital_1_headset_ess",2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_fg",1,
            "rhsusf_opscore_fg_pelt",1,
            "rhsusf_opscore_fg_pelt_cam",1,
            "rhsusf_opscore_fg_pelt_nsw",1,
            "rhsusf_opscore_ut",1,
            "rhsusf_opscore_ut_pelt",1,
            "rhsusf_opscore_ut_pelt_cam",1,
            "rhsusf_opscore_ut_pelt_nsw_cam",1,
            "rhsusf_opscore_bk",2,
            "rhsusf_opscore_bk_pelt",2
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

if (_helmet in _ess_list) then {_Class = _Class + .5};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "7r_scrim_forest", 0.225,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.025,
            "rhsusf_oakley_goggles_clear", 0.025,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    if (_Class == 1.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "7r_scrim_forest", 0.225,
            "rhs_googles_clear", 0.225,
            "", 0.05,
            "rhsusf_shemagh2_tan", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "7r_scrim_semi", 0.225,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.025,
            "rhsusf_oakley_goggles_clear", 0.025,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };
    
    if (_Class == 2.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "7r_scrim_semi", 0.225,
            "rhs_googles_clear", 0.225,
            "", 0.05,
            "rhsusf_shemagh2_tan", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_oakley_goggles_blk", 0.025,
            "rhsusf_oakley_goggles_clear", 0.025,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Platoon 
    if (_Class == 3.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "rhs_googles_clear", 0.65,
            "", 0.05,
            "rhsusf_shemagh2_tan", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_oakley_goggles_blk", 0.025,
            "rhsusf_oakley_goggles_clear", 0.025,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;