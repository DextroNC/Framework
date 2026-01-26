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
            "7r_combat_fatigues_cadpat_mt",2,
            "7r_combat_fatigues_cadpat_mt_gloves",2,
            "7r_combat_fatigues_cadpat_mixed",1,
            "7r_combat_fatigues_cadpat_mixed_gloves",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_combat_fatigues_cadpat_mt",2,
            "7r_combat_fatigues_cadpat_mt_gloves",2,
            "7r_combat_fatigues_cadpat_mixed",1,
            "7r_combat_fatigues_cadpat_mixed_gloves",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_combat_fatigues_cadpat_mt",2,
            "7r_combat_fatigues_cadpat_mt_gloves",2,
            "7r_combat_fatigues_cadpat_mixed",1,
            "7r_combat_fatigues_cadpat_mixed_gloves",1
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
    if (_Class > 0) then{
        _hatArray = [
            "7r_cadpat_mt_opscore",
            "7r_cadpat_mt_opscore_2",
            "7r_cadpat_mt_opscore_3",
            "7r_cadpat_mt_opscore_4"
        ];
    };

    if (_Class in [3,1]) then{
        _hatArray = [
            "7r_can_d_opscore_3",
            "7r_can_d_opscore_4",
            "7r_cadpat_mt_opscore_2",
            "7r_cadpat_mt_opscore_3",
            "7r_cadpat_mt_opscore_4"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_forest", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "usm_scarf", 0.05,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;