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
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_Camo",
            "VSM_Multicam_Crye_SS_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_grey_shirt_Camo",
            "VSM_Multicam_Crye_SS_grey_shirt_Camo"
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
            "BLK2_opscore",
            "VSM_Black_OPS",
            "BLK_opscore_2",
            "VSM_Black_OPS_2"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "BLK2_opscore",
            "VSM_Black_OPS",
            "BLK_opscore_2",
            "VSM_Black_OPS_2"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_2_multicam",
            "BLK2_opscore",
            "VSM_Black_OPS",
            "BLK_opscore_2",
            "VSM_Black_OPS_2"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "7r_scrim_forest", 0.425,
            "VSM_Shemagh_od", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_od", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "7r_scrim_forest", 0.425,
            "VSM_Shemagh_od", 0.1,
            "rhs_googles_clear", 0.225,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_od", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "VSM_Shemagh_od", 0.1,
            "rhs_googles_clear", 0.65,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_od", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "VSM_Shemagh_od", 0.1,
            "rhs_googles_clear", 0.65,
            "VSM_Goggles", 0.05,
            "VSM_Shemagh_Goggles_od", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;