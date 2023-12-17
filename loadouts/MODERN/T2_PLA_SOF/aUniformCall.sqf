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
            "7r_type19_pla_uniform_ssl"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_type19_pla_uniform_ssl"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_type19_pla_uniform_ssl"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_O_FullGhillie_sard"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of goggleswith desired values
    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.125,
            "rhs_googles_clear", 0.1,
            "G_Bandanna_oli", 0.225,
            "G_Bandanna_blk", 0.25
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.125,
            "rhs_googles_clear", 0.1,
            "G_Bandanna_oli", 0.225,
            "G_Bandanna_blk", 0.25
        ];
    };

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
        _goggleArray = [
            "", 0.225,
            "rhs_googles_clear", 0.1,
            "G_Bandanna_oli", 0.225,
            "G_Bandanna_blk", 0.25
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.225,
            "rhs_googles_clear", 0.1,
            "G_Bandanna_oli", 0.225,
            "G_Bandanna_blk", 0.25
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;