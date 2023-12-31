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
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\MODERN\T3_MidEast_Militia\aUniformCall.sqf";

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
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_TRK01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01",
            "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02",
            "UK3CB_FIA_B_U_M10_CombatUniform_TRK01_02"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Cap_blk",
            "H_Bandanna_camo",
            "UK3CB_H_Bandanna_Green_Check",
            "H_Beret_blk"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Cap_blk",
            "H_Bandanna_camo",
            "UK3CB_H_Bandanna_Green_Check",
            "H_Beret_blk"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_H_Bandanna_TRK",
            "UK3CB_H_Cap_TRK",
            "UK3CB_H_Bandanna_MAR",
            "UK3CB_H_Cap_MAR",
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Beret_blk",
            "H_Beret_blk",
            "H_Beret_blk",
            "H_Beret_blk",
            "H_Beret_blk"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "UK3CB_TKP_B_H_Patrolcap_TAN",
            "H_Cap_headphones",
            "H_Cap_blk",
            "H_Bandanna_camo",
            "UK3CB_H_Bandanna_Green_Check",
            "H_Beret_blk"
        ];
    };

    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    _goggleArray =[
        "rhsusf_shemagh2_od",6,
        "rhsusf_shemagh2_tan",6,
        "rhs_scarf",6,
        "UK3CB_G_Neck_Shemag",18,
        "VSM_beard_2",1,
        "VSM_beard_3",1,
        "G_Aviator",4,
        "",8
    ];

    if (_Class == 2) then {
        _goggleArray = [
            "rhsusf_shemagh2_od",6,
            "rhsusf_shemagh2_tan",6,
            "rhs_scarf",6,
            "UK3CB_G_Neck_Shemag",18,
            "VSM_beard_2",1,
            "VSM_beard_3",1,
            "G_Aviator",4,
            "",8
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;