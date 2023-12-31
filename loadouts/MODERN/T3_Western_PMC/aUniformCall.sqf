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
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_casual_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_SS_tan_shirt_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_Multicam_Crye_Tee_Camo",
            "VSM_OGA_tan_casual_Camo",
            "VSM_OGA_tan_casual_Camo"
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
            "rhs_beanie_green",
            "rhs_beanie_green",
            "rhssaf_bandana_smb",
            "rhssaf_bandana_smb",
            "UK3CB_H_Ballistic_Mask_Snakeskin_B",
            "VSM_Multicam_Boonie",
            "VSM_Multicam_Boonie",
            "H_Booniehat_tan",
            "H_Booniehat_tan",
            "H_Cap_blk",
            "H_Cap_blk",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_BackwardsHat_Peltor_black"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "VSM_OPS_2_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_2_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_multicam",
            "VSM_OPS_multicam",
            "VSM_oga_OPS_2",
            "VSM_oga_OPS_2",
            "VSM_oga_OPS_2",
            "VSM_oga_OPS",
            "VSM_oga_OPS",
            "VSM_oga_OPS"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "rhs_beanie_green",
            "rhs_beanie_green",
            "rhssaf_bandana_smb",
            "rhssaf_bandana_smb",
            "UK3CB_H_Ballistic_Mask_Snakeskin_B",
            "VSM_Multicam_Boonie",
            "VSM_Multicam_Boonie",
            "H_Booniehat_tan",
            "H_Booniehat_tan",
            "H_Cap_blk",
            "H_Cap_blk",
            "VSM_BackwardsHat_Peltor_black",
            "VSM_BackwardsHat_Peltor_black"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "UK3CB_H_Ballistic_Mask_Snakeskin_B"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    _goggleArray =[
        "VSM_Shemagh_goggles_tan",
        "VSM_Shemagh_goggles_OD",
        "VSM_Shemagh_Facemask_Tan",
        "VSM_Shemagh_Facemask_OD",
        "rhs_googles_clear",
        "rhs_googles_clear",
        "rhs_googles_clear",
        "rhs_googles_clear",
        "UK3CB_G_Tactical_Clear_Shemagh_Green",
        "UK3CB_G_Tactical_Clear_Shemagh_Tan",
        "UK3CB_G_Tactical_Clear_Shemagh_White",
        "",
        "",
        ""
    ];

    //Selects random googles from determined array
_unit addGoggles selectRandom _goggleArray;