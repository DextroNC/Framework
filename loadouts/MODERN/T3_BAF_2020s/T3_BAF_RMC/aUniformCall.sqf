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
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_RM",
            "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM"
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

_ess_list = [
    "UK3CB_BAF_H_Mk7_Camo_CESS_A",
    "UK3CB_BAF_H_Mk7_Camo_CESS_B",
    "UK3CB_BAF_H_Mk7_Camo_CESS_C",
    "UK3CB_BAF_H_Mk7_Camo_CESS_D",
    "UK3CB_BAF_H_Mk7_Camo_ESS_A",
    "UK3CB_BAF_H_Mk7_Camo_ESS_B",
    "UK3CB_BAF_H_Mk7_Camo_ESS_C",
    "UK3CB_BAF_H_Mk7_Camo_ESS_D",
    "UK3CB_BAF_H_Mk7_Net_CESS_A",
    "UK3CB_BAF_H_Mk7_Net_CESS_B",
    "UK3CB_BAF_H_Mk7_Net_CESS_C",
    "UK3CB_BAF_H_Mk7_Net_CESS_D",
    "UK3CB_BAF_H_Mk7_Net_ESS_A",
    "UK3CB_BAF_H_Mk7_Net_ESS_B",
    "UK3CB_BAF_H_Mk7_Net_ESS_C",
    "UK3CB_BAF_H_Mk7_Net_ESS_D",
    "UK3CB_BAF_H_Mk7_Scrim_ESS_A",
    "UK3CB_BAF_H_Mk7_Scrim_ESS_B",
    "UK3CB_BAF_H_Mk7_Scrim_ESS_C"
];

_noess_list = [
    "UK3CB_BAF_H_Mk7_Net_A",
    "UK3CB_BAF_H_Mk7_Net_B",
    "UK3CB_BAF_H_Mk7_Net_C",
    "UK3CB_BAF_H_Mk7_Net_D",
    "UK3CB_BAF_H_Mk7_Scrim_A",
    "UK3CB_BAF_H_Mk7_Scrim_B",
    "UK3CB_BAF_H_Mk7_Scrim_C",
    "UK3CB_BAF_H_Mk7_Scrim_D",
    "UK3CB_BAF_H_Mk7_Scrim_E",
    "UK3CB_BAF_H_Mk7_Scrim_F"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _ess_list + _noess_list;
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

_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

if (_helmet in _ess_list) then {_class = 5};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class <= 3) then{
        _goggleArray = [
            "VSM_Shemagh_od", 0.1,
            "rhs_googles_clear", 0.125,
            "VSM_Goggles", 0.1,
            "VSM_Shemagh_Goggles_od", 0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "VSM_Shemagh_od", 0.4,
            "rhs_googles_clear", 0.35,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_od", 0.2
        ];
    };

    //ESS On Helmet 
    if (_Class == 5) then{
        _goggleArray = [
            "VSM_Shemagh_od", 0.65,
            "", 0.35
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;