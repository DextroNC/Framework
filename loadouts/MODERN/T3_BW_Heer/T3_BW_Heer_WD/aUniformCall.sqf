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
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck_ssl",
            "7r_field_uniform_fleck"
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
            "7r_m92_fleck_headset",2,
            "7r_m92_fleck_headset_ess",2,
            "7r_m92_fleck_ess",1,
            "7r_m92_fleck",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_m92_fleck_headset",2,
            "7r_m92_fleck_headset_ess",2,
            "7r_m92_fleck_ess",1,
            "7r_m92_fleck",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_m92_fleck_headset",2,
            "7r_m92_fleck_headset_ess",2,
            "7r_m92_fleck_ess",1,
            "7r_m92_fleck",1
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_fleck_opscore_2",1,
            "7r_fleck_opscore_3",1,
            "7r_fleck_opscore_4",1
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray; 
_unit addHeadgear _helmet;
if (_helmet in ["7r_m92_fleck_headset_ess", "7r_m92_fleck_ess"]) then {_Class = _Class + 0.5;};
//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "milgp_f_face_shield_goggles_RGR", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "7r_scrim_lush", 0.225,
            "", 0.225
        ];
    };

    //Echo
    if (_Class == 1.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.15,
            "7r_scrim_lush", 0.225,
            "", 0.425
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "milgp_f_face_shield_goggles_RGR", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "7r_scrim_lush", 0.225,
            "", 0.225
        ];
    };

    //Squad
    if (_Class == 2.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.15,
            "7r_scrim_lush", 0.225,
            "", 0.425
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "milgp_f_face_shield_goggles_RGR", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "", 0.45
        ];
    };

    //Platoon 
    if (_Class == 3.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.15,
            "", 0.65
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.075,
            "rhsusf_oakley_goggles_clr", 0.1,
            "milgp_f_face_shield_goggles_RGR", 0.075,
            "rhsusf_oakley_goggles_blk", 0.1,
            "", 0.45
        ];
    };

    //Sierra 
    if (_Class == 4.5) then{
        _goggleArray = [
            "rhs_googles_clear", 0.2,
            "milgp_f_face_shield_RGR", 0.15,
            "", 0.65
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;