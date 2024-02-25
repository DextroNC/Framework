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
            "7r_combatsmocks_ttsko",1,
            "7r_combatsmocks_ttsko_gloves",1,
            "7r_combatsmocks_ttsko_odg",1,
            "7r_combatsmocks_ttsko_odg_gloves",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_combatsmocks_ttsko",1,
            "7r_combatsmocks_ttsko_gloves",1,
            "7r_combatsmocks_ttsko_odg",1,
            "7r_combatsmocks_ttsko_odg_gloves",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_combatsmocks_ttsko",1,
            "7r_combatsmocks_ttsko_gloves",1,
            "7r_combatsmocks_ttsko_odg",1,
            "7r_combatsmocks_ttsko_odg_gloves",1
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
        _hatArray = ["7r_odg_modhelm"];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = ["7r_ttsko_modhelm"];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = ["7r_odg_modhelm"];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "VSM_OGA_OD_OPS",
            "VSM_OD_spray_OPS",
            "VSM_OGA_OD_OPS_2",
            "VSM_OD_spray_OPS_2"
        ];
    };
    //Selects random hat from determined array, runs

_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class > 2) then{
        _goggleArray = [
            "rhsusf_shemagh2_od", 0.025,
            "rhs_googles_clear", 0.325,
            "rhs_scarf", 0.1,
            "rhsusf_oakley_goggles_clr", 0.325,
            "rhsusf_shemagh2_gogg_od", 0.125
        ];
    } else {
        _goggleArray = [
            "7r_scrim_forest", .4,
            "rhsusf_shemagh2_od", 0.025,
            "rhs_googles_clear", 0.2,
            "rhs_scarf", 0.075,
            "rhsusf_oakley_goggles_clr", 0.2,
            "rhsusf_shemagh2_gogg_od", 0.1
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;