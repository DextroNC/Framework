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
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_MTP"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_MTP"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_MTP_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_MTP"
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

//Echo
    if (_Class == 1) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt_nsw",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt_nsw",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt_nsw",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt_nsw",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover_pelt"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.0625,
            "rhs_googles_clear", 0.5875,
            "rhs_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.225,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ]; 
        if (selectRandomWeighted [true,1,false,2]) then {
            if !(SR_Night) then{
            _unit linkItem selectRandom [
                "7r_mitz2_cover_nvg",
                "7r_mitz2_cover2_nvg",
                "7r_mitz2_cover3_nvg",
                "7r_mitz2_cover4_nvg"
            ];
            } else {
                _goggleArray = _goggleArray + [
                    "7r_mitz2_cover",.2,
                    "7r_mitz2_cover2",.2,
                    "7r_mitz2_cover3",.2,
                    "7r_mitz2_cover4",.2
                ];
            };
        };
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.0625,
            "rhs_googles_clear", 0.5875,
            "rhs_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.225,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
        if (selectRandomWeighted [true,1,false,2]) then {
            if !(SR_Night) then{
            _unit linkItem selectRandom [
                "7r_mitz2_cover_nvg",
                "7r_mitz2_cover2_nvg",
                "7r_mitz2_cover3_nvg",
                "7r_mitz2_cover4_nvg"
            ];
            } else {
                _goggleArray = _goggleArray + [
                    "7r_mitz2_cover",.2,
                    "7r_mitz2_cover2",.2,
                    "7r_mitz2_cover3",.2,
                    "7r_mitz2_cover4",.2
                ];
            };
        };
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.0625,
            "rhs_googles_clear", 0.5875,
            "rhs_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.225,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.0625,
            "rhs_googles_clear", 0.5875,
            "rhs_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.225,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;