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
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_od_shirt_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_od_shirt_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_od_shirt_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_od_shirt_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_od_shirt_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_od_shirt_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo"
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
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam"
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
            "VSM_oga_OPS",
            "VSM_Tan_spray_OPS",
            "VSM_oga_OPS_2",
            "VSM_Tan_spray_OPS_2"
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

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
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