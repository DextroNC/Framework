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
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_US_DEVGRU\T1_US_DEVGRU_A\aUniformCall.sqf";

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
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "milgp_u_g3_field_set_mcalpine",
            "milgp_u_pcu_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine",
            "milgp_u_fleece_grey_g3_field_pants_mcalpine"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "UK3CB_BAF_U_CombatUniform_Arctic_Ghillie_RM"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "White_opscore",
            "White_opscore",
            "White_opscore_2",
            "White_opscore_2"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "White_opscore",
            "White_opscore",
            "White_opscore_2",
            "White_opscore_2"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "White_opscore",
            "White_opscore",
            "White_opscore_2",
            "White_opscore_2"
            
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "Alpine_opscore",
            "Alpine_opscore_2",
            "White_opscore",
            "White_opscore",
            "White_opscore_2",
            "White_opscore_2"
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