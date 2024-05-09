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
            "VSM_AOR1_Crye_SS_Camo",1,
            "VSM_AOR1_Crye_Camo",1,
            "VSM_AOR1_casual_Camo",2,
            "VSM_AOR1_Crye_SS_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_SS_od_shirt_Camo",1,
            "VSM_AOR1_Crye_od_shirt_Camo",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_AOR1_Crye_SS_Camo",1,
            "VSM_AOR1_Crye_Camo",1,
            "VSM_AOR1_casual_Camo",2,
            "VSM_AOR1_Crye_SS_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_SS_od_shirt_Camo",1,
            "VSM_AOR1_Crye_od_shirt_Camo",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_AOR1_Crye_SS_Camo",1,
            "VSM_AOR1_Crye_Camo",1,
            "VSM_AOR1_casual_Camo",2,
            "VSM_AOR1_Crye_SS_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_grey_shirt_Camo",1,
            "VSM_AOR1_Crye_SS_od_shirt_Camo",1,
            "VSM_AOR1_Crye_od_shirt_Camo",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_sard"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "rhsusf_opscore_mar_fg",
            "rhsusf_opscore_mar_fg_pelt",
            "rhsusf_opscore_mar_fg_pelt"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhsusf_opscore_mar_ut",
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_ut_pelt"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhsusf_opscore_mar_fg_pelt"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhsusf_opscore_mar_ut",
            "rhsusf_opscore_mar_ut_pelt",
            "rhsusf_opscore_mar_ut_pelt"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "rhs_googles_clear", 0.325,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "rhs_googles_clear", 0.325,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.125,
            "UK3CB_G_Neck_Shemag_Tan", 0.2,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_blk", 0.125,
            "rhsusf_oakley_goggles_clr", 0.125
        ];
    };

    //Sierra 
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan", 0.225,
            "rhs_googles_clear", 0.325,
            "rhsusf_oakley_goggles_blk", 0.1875,
            "rhsusf_oakley_goggles_clr", 0.1875,
            "rhsusf_shemagh2_gogg_tan", 0.1,
            "rhsusf_shemagh2_clear_gogg_tan", 0.1
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;