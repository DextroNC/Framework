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
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
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
    "rhsusf_ach_helmet_ucp",
    "rhsusf_ach_helmet_ucp_alt",
    "rhsusf_ach_helmet_headset_ucp",
    "rhsusf_ach_helmet_headset_ucp_alt"
];

_ess_list = [
    "rhsusf_ach_helmet_ESS_ucp",
    "rhsusf_ach_helmet_ESS_ucp_alt",
    "rhsusf_ach_helmet_headset_ess_ucp",
    "rhsusf_ach_helmet_headset_ess_ucp_alt"
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
            "G_Balaclava_blk", 0.325,
            "VSM_FaceMask_black", 0.325,
            "VSM_Facemask_tan_Goggles", 0.1,
            "VSM_Facemask_black_Goggles", 0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "G_Balaclava_blk", 0.4,
            "VSM_FaceMask_black", 0.35,
            "VSM_Facemask_tan_Goggles", 0.05,
            "VSM_Facemask_black_Goggles", 0.2
        ];
    };

    //ESS On Helmet 
    if (_Class == 5) then{
        _goggleArray = [
            "G_Balaclava_blk", 0.65,
            "VSM_FaceMask_black", 0.175,
            "VSM_FaceMask_tan", 0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;