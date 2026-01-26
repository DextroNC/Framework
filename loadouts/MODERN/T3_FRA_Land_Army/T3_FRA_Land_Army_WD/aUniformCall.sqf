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
		"7r_combat_fatigues_cce",
		"7r_combat_fatigues_cce_gloves"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
		"7r_combat_fatigues_cce",
		"7r_combat_fatigues_cce_gloves"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
		"7r_combat_fatigues_cce",
		"7r_combat_fatigues_cce_gloves"
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

_noess_list = [
    "7r_felin_helmet",
    "7r_felin_helmet_headset",
    "7r_felin_helmet_headset",
    "7r_felin_helmet_tan",
    "7r_felin_helmet_tan_headset",
    "7r_felin_helmet_tan_headset"
];

_ess_list = [
    "7r_felin_helmet_ess",
    "7r_felin_helmet_headset_ess",
    "7r_felin_helmet_headset_ess",
    "7r_felin_helmet_tan_ess",
    "7r_felin_helmet_tan_headset_ess",
    "7r_felin_helmet_tan_headset_ess"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list + _noess_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list + _noess_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _ess_list + _noess_list + _noess_list;
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = _ess_list + _noess_list + _noess_list;
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

if ((_helmet in _ess_list) && (_class < 3)) then {_class = 5;};
if ((_helmet in _ess_list) && (_class >= 3)) then {_class = 6;};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class < 3) then{
        _goggleArray = [
            "UK3CB_G_Balaclava2_DES", 0.25,
            "7r_scrim_forest", 0.25,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "G_Bandanna_khk", 0.1,
            "rhs_googles_clear", 0.15,
            "rhs_googles_black", 0.15
        ];
    };

    if (_Class == 3) then{
        _goggleArray = [
            "", 0.25,
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "G_Bandanna_khk", 0.1,
            "rhs_googles_clear", 0.225,
            "rhs_googles_black", 0.225
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "rhs_googles_clear", 0.325,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //ESS On Helmet 
    if (_Class == 5) then{
        _goggleArray = [
            "UK3CB_G_Balaclava2_DES", 0.25,
            "7r_scrim_forest", 0.25,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "G_Bandanna_khk", 0.1,
            "", 0.3
        ];
    };

    //ESS On Helmet 
    if (_Class == 6) then{
        _goggleArray = [
            "", 0.25,
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "G_Bandanna_khk", 0.1,
            "", 0.45
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;