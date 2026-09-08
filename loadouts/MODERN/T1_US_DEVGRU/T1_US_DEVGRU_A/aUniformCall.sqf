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
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine"
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

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "UK3CB_ION_B_H_OPSCORE_PELT_WIN"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "UK3CB_ION_B_H_OPSCORE_PELT_WIN"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_ION_B_H_OPSCORE_PELT_WIN"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "UK3CB_ION_B_H_OPSCORE_PELT_WIN"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "milgp_f_face_shield_khk", 0.2475,
            "milgp_f_face_shield_goggles_khk", 0.2475,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "milgp_f_face_shield_khk", 0.2475,
            "milgp_f_face_shield_goggles_khk", 0.2475,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "milgp_f_face_shield_khk", 0.2475,
            "milgp_f_face_shield_goggles_khk", 0.2475,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "milgp_f_face_shield_khk", 0.2475,
            "milgp_f_face_shield_goggles_khk", 0.2475,
            "rhs_googles_clear", 0.175,
            "rhsusf_oakley_goggles_blk", 0.175,
            "rhsusf_oakley_goggles_clr", 0.175
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;