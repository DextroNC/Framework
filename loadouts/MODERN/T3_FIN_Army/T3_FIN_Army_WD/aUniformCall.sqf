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
		    "7r_combatsmocks_m05",1,
		    "7r_combatsmocks_m05_gloves",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
		    "7r_combatsmocks_m05",1,
		    "7r_combatsmocks_m05_gloves",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
		    "7r_combatsmocks_m05",1,
		    "7r_combatsmocks_m05_gloves",1
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
        _hatArray = [
            "7r_m92_m05",1,
            "7r_m92_m05_headset_ess",2.5,
            "7r_m92_m05_headset",2.5,
            "7r_m92_m05_ess",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_m92_m05",1,
            "7r_m92_m05_headset_ess",2.5,
            "7r_m92_m05_headset",2.5,
            "7r_m92_m05_ess",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_m92_m05_headset_ess",2.5,
            "7r_m92_m05_headset",2.5
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_m92_m05",1,
            "7r_m92_m05_headset_ess",2.5,
            "7r_m92_m05_headset",2.5,
            "7r_m92_m05_ess",1
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

_goggleList = [
    "7r_m92_m05_headset_ess",
    "7r_m92_m05_ess"
];

_goggles = false;
if (_helmet in _goggleList) then {_goggles = true;};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class > 2) then{
        if _goggles then {
            _goggleArray = [
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.25,
                "", 0.325
            ];
        } else {
            _goggleArray = [
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.25,
                "rhsusf_oakley_goggles_clr", 0.1625,
                "rhsusf_oakley_goggles_blk", 0.1625
            ];
        };
    } else {
        if _goggles then {
            _goggleArray = [
                "7r_scrim_forest", 0.4,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.2,
                "", 0.2
            ];
        } else {
            _goggleArray = [
                "7r_scrim_forest", 0.4,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.2,
                "rhsusf_oakley_goggles_clr", 0.1,
                "rhsusf_oakley_goggles_blk", 0.1
            ];
        };
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;