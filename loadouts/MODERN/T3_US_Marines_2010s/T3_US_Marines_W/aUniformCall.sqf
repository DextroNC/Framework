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
            "7r_oversuit_marpatw_gloves"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_oversuit_marpatw_gloves"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_oversuit_marpatw_gloves"
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
        _hatArray = [
            "7r_marpat_opscore_2",
            "7r_marpat_opscore_3",
            "7r_marpat_opscore_4"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

if (_helmet in _ess_list) then {_class = _class + 0.5};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values

    //Echo & Squad - ESS on Helmet
    if (_Class in [1.5,2.5]) then{
        _goggleArray = [
            "milgp_f_face_shield_rgr", 0.2,
            "usm_scarf", 0.2,
            "7r_scrim_forest", 0.25,
            "rhsusf_shemagh2_tan", 0.175,
            "milgp_f_face_shield_khk", 0.175
        ];
    };

    //Echo & Squad
    if (_Class in [1,2]) then{
        _goggleArray = [
            "milgp_f_face_shield_rgr", 0.1,
            "usm_scarf", 0.2,
            "rhsusf_shemagh2_tan", 0.1,
            "milgp_f_face_shield_khk", 0.1,
            "7r_scrim_forest", 0.25,
            "milgp_f_face_shield_goggles_rgr", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Platoon - ESS on Helmet
    if (_Class in [3.5]) then{
        _goggleArray = [
            "milgp_f_face_shield_rgr", 0.325,
            "usm_scarf", 0.325,
            "rhsusf_shemagh2_tan", 0.175,
            "milgp_f_face_shield_khk", 0.175
        ];
    };

    //Platoon
    if (_Class in [3]) then{
        _goggleArray = [
            "milgp_f_face_shield_rgr", 0.175,
            "milgp_f_face_shield_rgr", 0.175,
            "rhsusf_shemagh2_tan", 0.2,
            "milgp_f_face_shield_khk", 0.1,
            "milgp_f_face_shield_goggles_rgr", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "milgp_f_face_shield_rgr", 0.175,
            "milgp_f_face_shield_rgr", 0.175,
            "rhsusf_shemagh2_tan", 0.2,
            "milgp_f_face_shield_khk", 0.1,
            "milgp_f_face_shield_goggles_rgr", 0.1,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.15
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;