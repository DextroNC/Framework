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
            "rhs_uniform_FROG01_wd"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhs_uniform_FROG01_wd"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhs_uniform_FROG01_wd"
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
    "rhsusf_lwh_helmet_marpatwd_ess",
    "rhsusf_lwh_helmet_marpatwd_headset"
];

_noess_list = [
    "rhsusf_lwh_helmet_marpatwd",
    "rhsusf_lwh_helmet_marpatwd"
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
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhsusf_oakley_goggles_blk", 0.2,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };
    
    //Echo Goggles On Helmet
    if (_Class == 1.5) then{
        _goggleArray = [
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhsusf_oakley_goggles_blk", 0.2,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };
    
    //Squad Goggles On Helmet
    if (_Class == 2.5) then{
        _goggleArray = [
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.2,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhsusf_oakley_goggles_blk", 0.2,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };
    
    //Platoon Goggles On Helmet
    if (_Class == 3.5) then{
        _goggleArray = [
            "", 0.2,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhsusf_oakley_goggles_blk", 0.2,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };
    
    //Sierra Goggles On Helmet
    if (_Class == 4.5) then{
        _goggleArray = [
            "", 0.2,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "UK3CB_G_KLR_BLK", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;