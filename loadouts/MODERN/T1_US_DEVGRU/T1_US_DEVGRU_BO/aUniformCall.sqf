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
            "Black_Black_Camo",
            "black_Crye_Camo",
            "Black_Black_SS_Camo",
            "Black_Crye_SS_Camo"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "Black_Black_Camo",
            "black_Crye_Camo",
            "Black_Black_SS_Camo",
            "Black_Crye_SS_Camo"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "Black_Black_Camo",
            "black_Crye_Camo",
            "Black_Black_SS_Camo",
            "Black_Crye_SS_Camo"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "UK3CB_ION_B_U_CombatSmock_01_URB"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "VSM_Black_OPS",
            "VSM_Black_OPS",
            "VSM_Black_OPS_2",
            "VSM_Black_OPS_2"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "VSM_Black_OPS",
            "VSM_Black_OPS",
            "VSM_Black_OPS_2",
            "VSM_Black_OPS_2"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "VSM_Black_OPS",
            "VSM_Black_OPS",
            "VSM_Black_OPS_2",
            "VSM_Black_OPS_2"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "BLK2_opscore",
            "BLK_opscore_2",
            "VSM_Black_OPS",
            "VSM_Black_OPS",
            "VSM_Black_OPS_2",
            "VSM_Black_OPS_2"
        ];
    };
    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class == 1) then{
        _goggleArray = [
            "UK3CB_G_Balaclava2_BLK", 0.525,
            "G_Balaclava_blk", 0.225,
            "VSM_Balaclava2_od_Goggles", 0.05,
            "VSM_Balaclava2_black_Goggles", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "UK3CB_G_Balaclava2_BLK", 0.525,
            "G_Balaclava_blk", 0.225,
            "VSM_Balaclava2_od_Goggles", 0.05,
            "VSM_Balaclava2_black_Goggles", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "VSM_FaceMask_black", 0.425,
            "VSM_FaceMask_olive", 0.1,
            "G_Balaclava_blk", 0.225,
            "VSM_Facemask_od_Goggles", 0.05,
            "VSM_Facemask_black_Goggles", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "VSM_FaceMask_black", 0.425,
            "VSM_FaceMask_olive", 0.1,
            "G_Balaclava_blk", 0.225,
            "VSM_Facemask_od_Goggles", 0.05,
            "VSM_Facemask_black_Goggles", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;