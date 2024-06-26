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
            "rhsgref_uniform_ttsko_mountain",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "rhsgref_uniform_ttsko_mountain",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "rhsgref_uniform_ttsko_mountain",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "rhsgref_uniform_gorka_1_f",3,
            "rhs_uniform_gorka_1_a",1,
            "rhs_uniform_gorka_1_green",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = ["UK3CB_H_SSH60_Helmet_Covered_TAN"];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = ["UK3CB_H_SSH60_Helmet_Covered_CDF"];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = ["UK3CB_H_SSH60_Helmet_Covered_TAN"];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhs_beanie_green",
            "rhs_beanie",
            "rhs_headband"
        ];
    };
    //Selects random hat from determined array, runs

_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class <= 3) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan",0.0625,
            "rhs_balaclava",0.0625,
            "G_Squares",0.0625,
            "rhs_scarf",0.0625,
            "UK3CB_G_Gloves_Black",0.125,
            "UK3CB_G_Gloves_Black_Shemagh_Tan",0.125,
            "",0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "UK3CB_G_Neck_Shemag_Tan",0.0625,
            "rhs_balaclava",0.0625,
            "G_Squares",0.0625,
            "rhs_scarf",0.0625,
            "UK3CB_G_Gloves_Black",0.125,
            "UK3CB_G_Gloves_Black_Shemagh_Tan",0.125,
            "",0.25
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;