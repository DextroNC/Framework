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
            "rhs_uniform_acu_ucp2",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhs_uniform_acu_ucp2",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhs_uniform_acu_ucp2",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_sard",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "rhsusf_mich_bare_alt",
            "rhsusf_mich_bare_headset",
            "rhsusf_mich_bare_norotos_alt",
            "rhsusf_mich_bare_norotos_alt_headset",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset",
            "rhsusf_mich_bare_norotos_headset"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_mich_bare_alt",
            "rhsusf_mich_bare_headset",
            "rhsusf_mich_bare_norotos_alt",
            "rhsusf_mich_bare_norotos_alt_headset",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset",
            "rhsusf_mich_bare_norotos_headset"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_mich_bare_alt",
            "rhsusf_mich_bare_headset",
            "rhsusf_mich_bare_norotos_alt",
            "rhsusf_mich_bare_norotos_alt_headset",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset",
            "rhsusf_mich_bare_norotos_headset"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_mich_bare_alt",
            "rhsusf_mich_bare_headset",
            "rhsusf_mich_bare_norotos_alt",
            "rhsusf_mich_bare_norotos_alt_headset",
            "rhsusf_mich_bare_norotos_arc_alt",
            "rhsusf_mich_bare_norotos_arc_alt_headset",
            "rhsusf_mich_bare_norotos_arc_headset",
            "rhsusf_mich_bare_norotos_headset"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.1,
            "rhs_googles_clear", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_gogg_od", 0.1,
            "rhsusf_shemagh2_clear_gogg_od", 0.1,
            "usm_kneepads_blk", 0.15,
            "usm_gigloves", 0.1,
            "usm_giglovesscarf", 0.1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.1,
            "rhs_googles_clear", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_gogg_od", 0.1,
            "rhsusf_shemagh2_clear_gogg_od", 0.1,
            "usm_kneepads_blk", 0.15,
            "usm_gigloves", 0.1,
            "usm_giglovesscarf", 0.1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.1,
            "rhs_googles_clear", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_gogg_od", 0.1,
            "rhsusf_shemagh2_clear_gogg_od", 0.1,
            "usm_kneepads_blk", 0.15,
            "usm_gigloves", 0.1,
            "usm_giglovesscarf", 0.1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.05,
            "rhs_googles_black", 0.1,
            "rhs_googles_clear", 0.1,
            "rhsusf_oakley_goggles_blk", 0.1,
            "rhsusf_oakley_goggles_clr", 0.1,
            "rhsusf_shemagh2_gogg_od", 0.1,
            "rhsusf_shemagh2_clear_gogg_od", 0.1,
            "usm_kneepads_blk", 0.15,
            "usm_gigloves", 0.1,
            "usm_giglovesscarf", 0.1
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;