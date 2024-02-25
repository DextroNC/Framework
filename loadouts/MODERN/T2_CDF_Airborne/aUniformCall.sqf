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
            "7r_combatsmocks_mc_gloves",1,
            "7r_combatsmocks_mc",1,
            "7r_combatsmocks_mc_odg_gloves",1,
            "7r_combatsmocks_mc_odg",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",1,
            "7r_combatsmocks_mc",1,
            "7r_combatsmocks_mc_odg_gloves",1,
            "7r_combatsmocks_mc_odg",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",1,
            "7r_combatsmocks_mc",1,
            "7r_combatsmocks_mc_odg_gloves",1,
            "7r_combatsmocks_mc_odg",1
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

//Echo
    if (_Class == 1) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_ocp_opscore",
            "7r_ocp_opscore_2",
            "7r_ocp_opscore_2",
            "7r_ocp_opscore",
            "7r_ocp_opscore_2",
            "7r_ocp_opscore_2",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover",
            "rhsusf_opscore_rg_cover"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut",
            "rhsusf_opscore_ut_pelt",
            "rhsusf_opscore_ut_pelt"
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
        if (selectRandomWeighted [true,1,false,1]) then {
            if !(SR_Night) then{
            _unit linkItem selectRandom [
                "7r_mitz2_cover_nvg",
                "7r_mitz2_cover2_nvg",
                "7r_mitz2_cover3_nvg",
                "7r_mitz2_cover4_nvg",
                "7r_mitz_cover_nvg",
                "7r_mitz_cover2_nvg",
                "7r_mitz_cover3_nvg",
                "7r_mitz_cover4_nvg"
            ];
            } else {
                _goggleArray = _goggleArray + [
                    "7r_mitz2_cover",.125,
                    "7r_mitz2_cover2",.125,
                    "7r_mitz2_cover3",.125,
                    "7r_mitz2_cover4",.125,
                    "7r_mitz_cover",.125,
                    "7r_mitz_cover2",.125,
                    "7r_mitz_cover3",.125,
                    "7r_mitz_cover4",.125
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