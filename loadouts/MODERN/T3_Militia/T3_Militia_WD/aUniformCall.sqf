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
            "UK3CB_LNM_B_U_CombatSmock_04",
            "UK3CB_LNM_B_U_CombatSmock_22",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_LNM_B_U_CombatSmock_04",
            "UK3CB_LNM_B_U_CombatSmock_22",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_LNM_B_U_CombatSmock_04",
            "UK3CB_LNM_B_U_CombatSmock_22",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "UK3CB_LNM_B_U_CombatSmock_04",
            "UK3CB_LNM_B_U_CombatSmock_22",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_19",
            "UK3CB_LNM_B_U_CombatSmock_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_CHC_C_U_COACH_04",
            "UK3CB_CHC_C_U_COACH_01",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_03_URB",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_06_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL",
            "UK3CB_ION_B_U_CombatSmock_02_WDL"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "H_Bandanna_sand",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "H_Cap_headphones",
            "H_Bandanna_sand",
            "UK3CB_H_Bandanna_Red_Check",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "H_Cap_headphones",
            "H_Cap_blk",
            "H_Bandanna_camo",
            "H_Beret_blk"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhs_ssh60",
            "rhs_ssh68_2",
            "rhs_ssh60",
            "rhs_ssh68_2",
            "rhs_ssh60",
            "rhs_ssh68_2",
            "rhs_altyn",
            "rhs_altyn_visordown"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_H_Ballistic_Mask_OLI",
            "UK3CB_H_Ballistic_Mask_OLI",
            "UK3CB_H_Bandanna_WDL_01",
            "H_Bandanna_sand",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
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
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "H_Cap_headphones",
            "H_Bandanna_sand",
            "rhs_headband",
            "rhs_headband",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "UK3CB_TKP_O_H_Patrolcap_Blk",
            "H_Cap_headphones",
            "H_Cap_blk",
            "H_Bandanna_camo",
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
        "",18,
        "G_Aviator",4,
        "",8
    ];

    if (_Class == 2) then {
        _goggleArray = [
            "rhsusf_shemagh2_od",6,
            "rhsusf_shemagh2_tan",6,
            "rhs_scarf",6,
            "",18,
            "G_Aviator",4,
            "G_Balaclava_blk",8
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;