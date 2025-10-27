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
		    "7r_combatsmocks_klmk_ttsko_gloves",2,
		    "7r_combatsmocks_ttsko_klmk_gloves",1,
            "7r_combatsmocks_klmk_gloves",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
		    "7r_combatsmocks_klmk_ttsko_gloves",2,
		    "7r_combatsmocks_ttsko_klmk_gloves",1,
            "7r_combatsmocks_klmk_gloves",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
		    "7r_combatsmocks_klmk_ttsko_gloves",2,
		    "7r_combatsmocks_ttsko_klmk_gloves",1,
            "7r_combatsmocks_klmk_gloves",3
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

if (_uniform in ["7r_combatsmocks_ttsko_klmk_gloves","7r_combatsmocks_klmk_gloves"]) then {_unit setVariable ["SR_Winter", true]} else {_unit setVariable ["SR_Winter", false]};

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "7r_ttsko_wz2005_ess",3,
            "7r_ttsko_wz2005_headset",3,
            "7r_ttsko_wz2005",3,
            "7r_ttsko_wz2005_headset_ess",3,
            "7r_ttsko_opscore_2",2,
            "7r_ttsko_opscore_3",1,
            "7r_ttsko_opscore_4",1,
            "7r_cdf_opscore",2,
            "7r_cdf_opscore_3",1,
            "7r_cdf_opscore_4",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "7r_klmk_wz2005_ess",3,
            "7r_klmk_wz2005_headset",3,
            "7r_klmk_wz2005",3,
            "7r_klmk_wz2005_headset_ess",3,
            "7r_klmk_opscore_2",2,
            "7r_klmk_opscore_3",1,
            "7r_klmk_opscore_4",1,
            "7r_cdf_w_opscore",2,
            "7r_cdf_w_opscore_3",1,
            "7r_cdf_w_opscore_4",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_ttsko_wz2005_ess",3,
            "7r_ttsko_wz2005_headset",3,
            "7r_ttsko_wz2005",3,
            "7r_ttsko_wz2005_headset_ess",3,
            "7r_ttsko_opscore_2",2,
            "7r_ttsko_opscore_3",1,
            "7r_ttsko_opscore_4",1,
            "7r_cdf_opscore",2,
            "7r_cdf_opscore_3",1,
            "7r_cdf_opscore_4",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "7r_klmk_opscore_2",2,
            "7r_klmk_opscore_3",1,
            "7r_klmk_opscore_4",1,
            "7r_cdf_w_opscore",2,
            "7r_cdf_w_opscore_3",1,
            "7r_cdf_w_opscore_4",1
        ];
    };
    //Selects random hat from determined array, runs

_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

_goggleList = [
    "7r_ttsko_wz2005_ess",
    "7r_ttsko_wz2005_headset_ess",
    "7r_klmk_wz2005_headset_ess",
    "7r_klmk_wz2005_ess"
];

_goggles = false;
if (_helmet in _goggleList) then {_goggles = true;};

//Appends array of goggleswith desired values
    //Appends array of goggleswith desired values
    if (_Class > 2) then{
        if _goggles then {
            _goggleArray = [
                "usm_scarf", 0.15,
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.1,
                "", 0.325
            ];
        } else {
            _goggleArray = [
                "usm_scarf", 0.15,
                "rhs_googles_clear", 0.325,
                "rhs_scarf", 0.1,
                "rhsusf_oakley_goggles_clr", 0.1625,
                "rhsusf_oakley_goggles_blk", 0.1625
            ];
        };
    };
    
    if (_Class == 1) then{
        if _goggles then {
            _goggleArray = [
                "7r_scrim_lush", .4,
                "usm_scarf", 0.125,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "", 0.2
            ];
        } else {
            _goggleArray = [
                "7r_scrim_lush", .4,
                "usm_scarf", 0.125,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "rhsusf_oakley_goggles_clr", 0.1,
                "rhsusf_oakley_goggles_blk", 0.1
            ];
        };
    };
    
    if (_Class == 2) then{
        if _goggles then {
            _goggleArray = [
                "7r_scrim_winter", .4,
                "usm_scarf", 0.125,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "", 0.2
            ];
        } else {
            _goggleArray = [
                "7r_scrim_winter", .4,
                "usm_scarf", 0.125,
                "rhs_googles_clear", 0.2,
                "rhs_scarf", 0.075,
                "rhsusf_oakley_goggles_clr", 0.1,
                "rhsusf_oakley_goggles_blk", 0.1
            ];
        };
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;