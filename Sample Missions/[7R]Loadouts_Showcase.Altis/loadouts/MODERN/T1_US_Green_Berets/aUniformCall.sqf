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
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_US_Green_berets\aUniformCall.sqf";

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
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_fleece_rgr_g3_field_pants_mc",
            "milgp_u_fleece_rgr_g3_field_pants_mc"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_g3_field_set_rolled_mc",
            "milgp_u_g3_field_set_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc",
            "milgp_u_fleece_khk_g3_field_pants_mc"
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
            "VSM_oga_OPS",
            "VSM_Tan_spray_OPS",
            "VSM_oga_OPS_2",
            "VSM_Tan_spray_OPS_2"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "VSM_oga_OPS",
            "VSM_Tan_spray_OPS",
            "VSM_oga_OPS_2",
            "VSM_Tan_spray_OPS_2"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.125,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.25,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.125,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.25,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Squad
    if (_Class == 2.5) then{
        _goggleArray = [
            "", 0.125,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.25,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.225,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.25,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.225,
            "UK3CB_G_Neck_Shemag_Tan", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.25,
            "rhsusf_shemagh2_gogg_tan", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;