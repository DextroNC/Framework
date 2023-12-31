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
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_02",
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_02"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_02",
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_02"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01",
            "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_02",
            "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_02"
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
            "UK3CB_AAF_I_H_MKVI_Helmet_B_BRN"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "UK3CB_AAF_I_H_MKVI_Helmet_B_GRN"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_AAF_I_H_MKVI_Helmet_B_BRN"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_OGA_OD_OPS",
            "VSM_OD_spray_OPS",
            "VSM_OGA_OD_OPS_2",
            "VSM_OD_spray_OPS_2"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_oakley_goggles_blk", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_oakley_goggles_blk", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_oakley_goggles_blk", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;