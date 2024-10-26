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
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_tee"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_tee"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_ssl",
            "7r_field_uniform_cadpat_mt_tee"
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
    "7r_cadpat_mt_cg634_ess",
    "7r_cadpat_mt_cg634_headset_ess"
];

_noess_list = [
    "7r_cadpat_mt_cg634",
    "7r_cadpat_mt_cg634_headset"
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
        _hatArray = _ess_list + _noess_list;
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_List) then {_class = _class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "7r_scrim_arid", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_shemagh2_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Echo Goggles On Helmet
    if (_Class == 1.5) then{
        _goggleArray = [
            "7r_scrim_arid", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.3,
            "rhs_googles_clear", 0.23
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_arid", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "rhsusf_shemagh2_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Squad Goggles On Helmet
    if (_Class == 2.5) then{
        _goggleArray = [
            "7r_scrim_arid", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.3,
            "rhs_googles_clear", 0.23
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_shemagh2_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Platoon Goggles On Helmet
    if (_Class == 3.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.525,
            "rhs_googles_clear", 0.465
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.65,
            "rhsusf_shemagh2_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.025,
            "rhsusf_oakley_goggles_clr", 0.1
        ];
    };
    
    //Sierra Goggles On Helmet
    if (_Class == 4.5) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.525,
            "rhs_googles_clear", 0.465
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;