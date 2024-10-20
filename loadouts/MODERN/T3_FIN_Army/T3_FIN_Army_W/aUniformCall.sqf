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
		    "7r_combatsmocks_m05w_m05_gloves",1,
		    "7r_combatsmocks_m05_m05w_gloves",2,
            "7r_combatsmocks_m05w_gloves",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
		    "7r_combatsmocks_m05w_m05_gloves",1,
		    "7r_combatsmocks_m05_m05w_gloves",2,
            "7r_combatsmocks_m05w_gloves",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
		    "7r_combatsmocks_m05w_m05_gloves",1,
		    "7r_combatsmocks_m05_m05w_gloves",2,
            "7r_combatsmocks_m05w_gloves",3
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "U_B_FullGhillie_sard",1
        ];
    };
    
//Selects random uniform from determined array, runs
_uniform = selectRandomWeighted _uniformArray;
_unit forceAddUniform _uniform;

if (_uniform in ["7r_combatsmocks_m05_m05w_gloves","7r_combatsmocks_m05w_gloves"]) then {_unit setVariable ["SR_Winter", true]} else {_unit setVariable ["SR_Winter", false]};

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
            "7r_m92_m05w",1,
            "7r_m92_m05w_headset_ess",2.5,
            "7r_m92_m05w_headset",2.5,
            "7r_m92_m05w_ess",1
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
            "7r_m92_m05w",1,
            "7r_m92_m05w_headset_ess",2.5,
            "7r_m92_m05w_headset",2.5,
            "7r_m92_m05w_ess",1
        ];
    };
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

_goggleList = [
    "7r_m92_m05w_headset_ess",
    "7r_m92_m05w_ess",
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
                "rhsusf_shemagh2_white", 0.15,
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.1,
                "", 0.325
            ];
        } else {
            _goggleArray = [
                "rhsusf_shemagh2_white", 0.025,
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.1,
                "rhsusf_oakley_goggles_clr", 0.1625,
                "rhsusf_shemagh2_gogg_white", 0.0625,
                "rhsusf_oakley_goggles_blk", 0.1625,
                "rhsusf_shemagh2_clear_gogg_white", 0.0625
            ];
        };
    } else {
        if _goggles then {
            _goggleArray = [
                "7r_scrim_winter", .4,
                "rhsusf_shemagh2_white", 0.125,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "", 0.2
            ];
        } else {
            _goggleArray = [
                "7r_scrim_winter", .4,
                "rhsusf_shemagh2_white", 0.025,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "rhsusf_oakley_goggles_clr", 0.1,
                "rhsusf_shemagh2_gogg_white", 0.05,
                "rhsusf_oakley_goggles_blk", 0.1,
                "rhsusf_shemagh2_clear_gogg_white", 0.05
            ];
        };
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;