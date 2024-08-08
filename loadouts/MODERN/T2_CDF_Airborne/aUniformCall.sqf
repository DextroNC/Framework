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
            "7r_combatsmocks_mc_gloves",2,
            "7r_combatsmocks_mc",2,
            "7r_combatsmocks_mc_odg_gloves",1.5,
            "7r_combatsmocks_mc_odg",1.5,
            "7r_combatsmocks_mc_khk_gloves",1.5,
            "7r_combatsmocks_mc_khk",1.5
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",2,
            "7r_combatsmocks_mc",2,
            "7r_combatsmocks_mc_odg_gloves",1.5,
            "7r_combatsmocks_mc_odg",1.5,
            "7r_combatsmocks_mc_khk_gloves",1.5,
            "7r_combatsmocks_mc_khk",1.5
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",2,
            "7r_combatsmocks_mc",2,
            "7r_combatsmocks_mc_odg_gloves",1.5,
            "7r_combatsmocks_mc_odg",1.5,
            "7r_combatsmocks_mc_khk_gloves",1.5,
            "7r_combatsmocks_mc_khk",1.5
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
            "rhsusf_ach_helmet_headset_ocp",
            "rhsusf_ach_helmet_headset_ocp_alt",
            "rhsusf_ach_helmet_headset_ess_ocp",
            "rhsusf_ach_helmet_headset_ess_ocp_alt",
            "rhsusf_ach_bare_wood_headset",
            "rhsusf_ach_bare_wood_headset_ess"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_ocp_opscore",
            "7r_ocp_opscore_2",
            "7r_ocp_opscore_2",
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_ach_helmet_headset_ocp",
            "rhsusf_ach_helmet_headset_ocp_alt",
            "rhsusf_ach_helmet_headset_ess_ocp",
            "rhsusf_ach_helmet_headset_ess_ocp_alt",
            "rhsusf_ach_bare_wood_headset",
            "rhsusf_ach_bare_wood_headset_ess"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_ocp_opscore",
            "7r_ocp_opscore_2",
            "7r_ocp_opscore_2",
            "rhsusf_opscore_fg",
            "rhsusf_opscore_fg_pelt",
            "rhsusf_opscore_fg_pelt"
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

if (_helmet in ["rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt","rhsusf_ach_bare_wood_headset_ess"]) then {_Class = _Class + 0.5};
//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.1625,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "rhsusf_oakley_goggles_blk", 0.1125,
            "rhsusf_oakley_goggles_clr", 0.1125,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ]; 
    };

    //Echo - No Goggles
    if (_Class == 1.5) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.17,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "", 0.225
        ]; 
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.1625,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "rhsusf_oakley_goggles_blk", 0.1125,
            "rhsusf_oakley_goggles_clr", 0.1125,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
        if (selectRandomWeighted [true,1,false,1]) then {
            if !(SR_Night) then{
            _unit linkItem selectRandom [
                "7r_mitz2_cover_nvg",
                "7r_mitz2_cover3_nvg",
                "7r_mitz2_cover4_nvg",
                "7r_mitz_cover_nvg",
                "7r_mitz_cover3_nvg",
                "7r_mitz_cover4_nvg"
            ];
            } else {
                _goggleArray = _goggleArray + [
                    "7r_mitz2_cover",.166,
                    "7r_mitz2_cover3",.166,
                    "7r_mitz2_cover4",.166,
                    "7r_mitz_cover",.166,
                    "7r_mitz_cover3",.166,
                    "7r_mitz_cover4",.166
                ];
            };
        };
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.1625,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "rhsusf_oakley_goggles_blk", 0.1125,
            "rhsusf_oakley_goggles_clr", 0.1125,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
    };

    //Platoon - No Goggles 
    if (_Class == 3.5) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.17,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "", 0.225
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "milgp_f_face_shield_RGR", 0.1625,
            "rhs_googles_clear", 0.2875,
            "rhs_scarf", 0.1,
            "G_Bandanna_oli", 0.15,
            "rhsusf_oakley_goggles_blk", 0.1125,
            "rhsusf_oakley_goggles_clr", 0.1125,
            "milgp_f_face_shield_goggles_RGR", 0.075
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;