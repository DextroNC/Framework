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
        [_unit, 1] call compile preprocheadsetFileLineNumbers "loadouts\aUniformCall.sqf";

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
            "rhs_uniform_FROG01_d"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhs_uniform_FROG01_d"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhs_uniform_FROG01_d"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_ard"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

_headset_list = [
    "H_HelmetSpecB_sand",
    "H_HelmetSpecB_paint2",
    "H_HelmetSpecB_blk",
    "VSM_OGA_Helmet1",
    "H_HelmetSpecB_sand",
    "H_HelmetSpecB_paint2",
    "H_HelmetSpecB_blk",
    "VSM_OGA_Helmet1",
    "H_HelmetSpecB_sand",
    "H_HelmetSpecB_paint2",
    "H_HelmetSpecB_blk",
    "VSM_OGA_Helmet1",
    "H_HelmetSpecB_sand",
    "H_HelmetSpecB_paint2",
    "H_HelmetSpecB_blk",
    "VSM_OGA_Helmet1"
];

_noheadset_list = [
    "H_HelmetB_sand",
    "H_HelmetB_desert",
    "H_HelmetB_black"

];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _headset_list + _noheadset_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _headset_list + _noheadset_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _headset_list + _noheadset_list;
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = _headset_list + _noheadset_list;
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _noheadset_List) then {_class = _class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.325,
            "7r_scrim_arid", 0.1,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };
    
    //Echo No Headset
    if (_Class == 1.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.325,
            "7r_scrim_arid", 0.1,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.325,
            "7r_scrim_arid", 0.1,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };
    
    //Squad No Headset
    if (_Class == 2.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.325,
            "7r_scrim_arid", 0.1,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.425,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };
    
    //Platoon No Headset
    if (_Class == 3.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.425,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.425,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };
    
    //Sierra No Headset
    if (_Class == 4.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.425,
            "VSM_Shemagh_TAN", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_TAN", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;