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
            "7r_combatsmocks_mc_gloves",3,
            "7r_combatsmocks_mc",3,
            "7r_combatsmocks_dpm_gloves",1,
            "7r_combatsmocks_dpm",1,
            "7r_combatsmocks_dpm_mc_gloves",5,
            "7r_combatsmocks_dpm_mc",5,
            "7r_combatsmocks_mc_dpm_gloves",5,
            "7r_combatsmocks_mc_dpm",5
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",3,
            "7r_combatsmocks_mc",3,
            "7r_combatsmocks_dpm_gloves",1,
            "7r_combatsmocks_dpm",1,
            "7r_combatsmocks_dpm_mc_gloves",5,
            "7r_combatsmocks_dpm_mc",5,
            "7r_combatsmocks_mc_dpm_gloves",5,
            "7r_combatsmocks_mc_dpm",5
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_combatsmocks_mc_gloves",3,
            "7r_combatsmocks_mc",3,
            "7r_combatsmocks_dpm_gloves",1,
            "7r_combatsmocks_dpm",1,
            "7r_combatsmocks_dpm_mc_gloves",5,
            "7r_combatsmocks_dpm_mc",5,
            "7r_combatsmocks_mc_dpm_gloves",5,
            "7r_combatsmocks_mc_dpm",5
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
            "rhsusf_opscore_fg",1,
            "rhsusf_opscore_fg_pelt",1.33,
            "rhsusf_opscore_fg_pelt_cam",1.33,
            "rhsusf_opscore_fg_pelt_nsw",1.33,
            "rhsusf_opscore_ut",2,
            "rhsusf_opscore_ut_pelt",2.66,
            "rhsusf_opscore_ut_pelt_nsw",2.66,
            "rhsusf_opscore_ut_pelt_nsw_cam",2.66,
            "rhsusf_opscore_rg_cover",2,
            "rhsusf_opscore_rg_cover",4,
            "7r_ocp_opscore",3,
            "7r_ocp_opscore_2",4,
            "7r_ocp_opscore_3",4,
            "7r_ocp_opscore_4",4
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_ach_helmet_ocp",4,
            "rhsusf_ach_helmet_ocp_alt",4,
            "rhsusf_ach_helmet_ESS_ocp",4,
            "rhsusf_ach_helmet_ESS_ocp_alt",4,
            "rhsusf_ach_helmet_headset_ocp",4,
            "rhsusf_ach_helmet_headset_ocp_alt",4,
            "rhsusf_ach_helmet_headset_ess_ocp",4,
            "rhsusf_ach_helmet_headset_ess_ocp_alt",4,
            "rhsusf_ach_helmet_camo_ocp",16,
            "7r_ocp_opscore",6,
            "7r_ocp_opscore_2",8,
            "7r_ocp_opscore_3",8,
            "7r_ocp_opscore_4",8
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_fg",1,
            "rhsusf_opscore_fg_pelt",1.33,
            "rhsusf_opscore_fg_pelt_cam",1.33,
            "rhsusf_opscore_fg_pelt_nsw",1.33,
            "rhsusf_opscore_ut",2,
            "rhsusf_opscore_ut_pelt",2.66,
            "rhsusf_opscore_ut_pelt_nsw",2.66,
            "rhsusf_opscore_ut_pelt_nsw_cam",2.66,
            "rhsusf_opscore_rg_cover",2,
            "rhsusf_opscore_rg_cover",4,
            "7r_ocp_opscore",3,
            "7r_ocp_opscore_2",4,
            "7r_ocp_opscore_3",4,
            "7r_ocp_opscore_4",4
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_fg",1,
            "rhsusf_opscore_fg_pelt",1.33,
            "rhsusf_opscore_fg_pelt_cam",1.33,
            "rhsusf_opscore_fg_pelt_nsw",1.33,
            "rhsusf_opscore_ut",2,
            "rhsusf_opscore_ut_pelt",2.66,
            "rhsusf_opscore_ut_pelt_nsw",2.66,
            "rhsusf_opscore_ut_pelt_nsw_cam",2.66,
            "rhsusf_opscore_rg_cover",2,
            "rhsusf_opscore_rg_cover",4,
            "7r_ocp_opscore",3,
            "7r_ocp_opscore_2",4,
            "7r_ocp_opscore_3",4,
            "7r_ocp_opscore_4",4
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

if (_helmet in ["rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_ESS_ocp_alt","rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt"]) then {_Class = _Class + 0.5};
//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_clear", 0.4,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "", 0.2,
            "G_Bandanna_khk", 0.05,
            "G_Bandanna_Skull1", 0.05,
            "G_Bandanna_tan", 0.05,
            "G_Bandanna_oli", 0.05
        ]; 
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_clear", 0.4,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "", 0.2,
            "G_Bandanna_khk", 0.05,
            "G_Bandanna_Skull1", 0.05,
            "G_Bandanna_tan", 0.05,
            "G_Bandanna_oli", 0.05
        ];
    };

    //Squad - No Goggles
    if (_Class == 2.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.5,
            "", 0.3,
            "G_Bandanna_khk", 0.05,
            "G_Bandanna_Skull1", 0.05,
            "G_Bandanna_tan", 0.05,
            "G_Bandanna_oli", 0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_clear", 0.4,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "", 0.2,
            "G_Bandanna_khk", 0.05,
            "G_Bandanna_Skull1", 0.05,
            "G_Bandanna_tan", 0.05,
            "G_Bandanna_oli", 0.05
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_clear", 0.4,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "", 0.2,
            "G_Bandanna_khk", 0.05,
            "G_Bandanna_Skull1", 0.05,
            "G_Bandanna_tan", 0.05,
            "G_Bandanna_oli", 0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;