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
            "UK3CB_BAF_U_Smock_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_OLI"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "UK3CB_BAF_U_Smock_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_OLI"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "UK3CB_BAF_U_Smock_DPMW",
            "UK3CB_BAF_U_Smock_DPMW_OLI"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "UK3CB_BAF_U_JumperUniform_DPMW"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "UK3CB_BAF_H_Beret_PR",
            "UK3CB_BAF_H_Beret_PR_PRR",
            "UK3CB_BAF_H_Wool_Hat"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "UK3CB_H_HSAT_PTYPE"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_BAF_H_Beret_PR",
            "UK3CB_BAF_H_Beret_PR_PRR",
            "UK3CB_BAF_H_Wool_Hat"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "UK3CB_BAF_H_Wool_Hat",
            "UK3CB_BAF_H_Beret_PR"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.875,
            "rhs_scarf", 0.1,
            "G_Squares",0.05
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.375,
            "7r_scrim_forest", 0.475,
            "rhs_scarf", 0.1,
            "G_Squares",0.05
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.875,
            "rhs_scarf", 0.1,
            "G_Squares",0.05
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.875,
            "rhs_scarf", 0.1,
            "G_Squares",0.05
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;