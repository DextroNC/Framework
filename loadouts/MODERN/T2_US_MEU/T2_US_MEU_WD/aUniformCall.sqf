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

_headset_list = [
    "H_HelmetSpecB_snakeskin",
    "H_HelmetSpecB_paint1",
    "H_HelmetSpecB_snakeskin",
    "H_HelmetSpecB_paint1",
    "H_HelmetSpecB_snakeskin",
    "H_HelmetSpecB_paint1",
    "H_HelmetSpecB_snakeskin",
    "H_HelmetSpecB_paint1",
    "VSM_OGA_OD_Helmet1",
    "VSM_OGA_OD_Helmet1",
    "VSM_OGA_OD_Helmet1",
    "VSM_OGA_OD_Helmet1"
];

_noheadset_list = [
    "H_HelmetB_snakeskin",
    "H_HelmetB_grass",
    "H_HelmetB_snakeskin",
    "H_HelmetB_grass"

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
            "", 0.025,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };
    
    //Echo No Headset
    if (_Class == 1.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.025,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.025,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };
    
    //Squad No Headset
    if (_Class == 2.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.025,
            "7r_scrim_forest", 0.3,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
        _goggleArray = [
            "", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };
    
    //Sierra No Headset
    if (_Class == 4.5) then{
        _goggleArray = [
            "VSM_Peltor_coyote_glasses", 0.425,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;