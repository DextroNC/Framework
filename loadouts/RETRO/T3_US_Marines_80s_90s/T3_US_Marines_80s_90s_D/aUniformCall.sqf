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
            "usm_bdu_des_m",1,
            "usm_bdu_btisrl_des_m",1,
            "usm_bdu_bti_des_m",1,
            "usm_bdu_srh_des_m",1.5,
            "usm_bdu_srl_des_m",1.5,
            "usm_bdu_bnu_des_m",1.5
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "usm_bdu_des_m",1,
            "usm_bdu_btisrl_des_m",1,
            "usm_bdu_bti_des_m",1,
            "usm_bdu_srh_des_m",1.5,
            "usm_bdu_srl_des_m",1.5,
            "usm_bdu_bnu_des_m",1.5
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "usm_bdu_des_m",1,
            "usm_bdu_btisrl_des_m",1,
            "usm_bdu_bti_des_m",1,
            "usm_bdu_srh_des_m",1.5,
            "usm_bdu_srl_des_m",1.5,
            "usm_bdu_bnu_des_m",1.5
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "usm_bdu_srh_des_m",1.5,
            "usm_bdu_srl_des_m",1.5,
            "usm_bdu_bnu_des_m",3
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;

_ess_list = [
    "usm_helmet_pasgt_m_ceswd_des"
];

_noess_list = [
    "usm_helmet_pasgt_m_ce_des"
];

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = _ess_list + _noess_list;
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "usm_bdu_boonie_des",
            "usm_bdu_8point_des_m",
            "usm_bdu_boonie_des",
            "usm_bdu_boonie_des"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;
if (_helmet in _ess_list) then {_Class = _Class + 0.5};

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "usm_swdgoggles", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };
    
    //Echo - Goggles on Head
    if (_Class == 1.5) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "usm_swdgoggles", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Squad - Goggles on Head
    if (_Class == 2.5) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "usm_swdgoggles", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Platoon - Goggles on Head
    if (_Class == 3.5) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "usm_swdgoggles", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Sierra
    if (_Class == 4.5) then{
        _goggleArray = [
            "G_Spectacles", 0.05,
            "", 0.35,
            "G_Bandanna_oli", 0.05,
            "", 0.2,
            "usm_kneepads_blk", 0.35
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;