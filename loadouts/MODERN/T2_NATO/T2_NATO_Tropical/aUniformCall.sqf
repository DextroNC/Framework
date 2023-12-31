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
            "U_B_T_Soldier_F",
            "U_B_T_Soldier_AR_F",
            "U_B_T_Soldier_SL_F"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "U_B_T_Soldier_F",
            "U_B_T_Soldier_AR_F",
            "U_B_T_Soldier_SL_F"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "U_B_T_Soldier_F",
            "U_B_T_Soldier_AR_F",
            "U_B_T_Soldier_SL_F"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_T_FullGhillie_tna_F"
        ];
    };

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "H_HelmetB_light_black",
            "H_HelmetB_Light_tna_F"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "H_HelmetSpecB",
            "H_HelmetB_Enh_tna_F"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "H_HelmetB_light_black",
            "H_HelmetB_Light_tna_F"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "H_HelmetB_light_black",
            "H_HelmetB_Light_tna_F"
        ];;
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of goggleswith desired values
    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "",.325,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_clr", 0.125,
            "rhsusf_shemagh2_gogg_od", 0.125
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "",.325,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_clr", 0.125,
            "rhsusf_shemagh2_gogg_od", 0.125
        ];
    };

    //Platoon 
    if (_Class == 3 or _Class == 3.5) then{
        _goggleArray = [
            "",.325,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_clr", 0.125,
            "rhsusf_shemagh2_gogg_od", 0.125
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "",.325,
            "rhs_googles_clear", 0.425,
            "rhsusf_oakley_goggles_clr", 0.125,
            "rhsusf_shemagh2_gogg_od", 0.125
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;