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
            "7r_oversuit_ddpm",3,
            "7r_oversuit_ddpm_dpm",2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_oversuit_ddpm",3,
            "7r_oversuit_ddpm_dpm",2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_oversuit_ddpm",3,
            "7r_oversuit_ddpm_dpm",2
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
if (uniform _unit == "7r_oversuit_ddpm_dpm") then {_unit setVariable ["SR_dpmTop",true];} else {_unit setVariable ["SR_dpmTop",false];};

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "UK3CB_BAF_H_Wool_Hat",
            "UK3CB_BAF_H_Boonie_ddpm",
            "UK3CB_BAF_H_Boonie_ddpm_PRR",
            "UK3CB_BAF_H_Boonie_ddpm",
            "UK3CB_BAF_H_Boonie_ddpm_PRR",
            "UK3CB_TKM_I_H_Turban_03_1",
            "UK3CB_TKC_H_Pilot_Turban_01_1",
            "H_Bandanna_khk",
            "H_Bandanna_khk_hs"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "UK3CB_BAF_H_Wool_Hat",
            "UK3CB_BAF_H_Boonie_ddpm",
            "UK3CB_BAF_H_Boonie_ddpm_PRR",
            "UK3CB_BAF_H_Boonie_ddpm",
            "UK3CB_BAF_H_Boonie_ddpm_PRR",
            "UK3CB_TKM_I_H_Turban_03_1",
            "UK3CB_TKC_H_Pilot_Turban_01_1",
            "H_Bandanna_khk",
            "H_Bandanna_khk_hs"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "UK3CB_BAF_H_Beret_SAS",
            "UK3CB_BAF_H_Beret_SAS_PRR_Over",
            "UK3CB_BAF_H_Beret_SAS_PRR"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "UK3CB_BAF_H_Beret_SAS",
            "UK3CB_BAF_H_Beret_SAS_PRR_Over",
            "UK3CB_BAF_H_Beret_SAS_PRR"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "usm_scarf", 0.2,
            "usm_swdgoggles", 0.15,
            "rhs_googles_black", 0.15,
            "rhs_googles_clear", 0.15,
            "usm_gigloves", 0.15,
            "usm_giglovesscarf", 0.2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "usm_scarf", 0.2,
            "usm_swdgoggles", 0.15,
            "rhs_googles_black", 0.15,
            "rhs_googles_clear", 0.15,
            "usm_gigloves", 0.15,
            "usm_giglovesscarf", 0.2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "usm_scarf", 0.2,
            "usm_swdgoggles", 0.15,
            "rhs_googles_black", 0.15,
            "rhs_googles_clear", 0.15,
            "usm_gigloves", 0.15,
            "usm_giglovesscarf", 0.2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "usm_scarf", 0.2,
            "usm_swdgoggles", 0.15,
            "rhs_googles_black", 0.15,
            "rhs_googles_clear", 0.15,
            "usm_gigloves", 0.15,
            "usm_giglovesscarf", 0.2
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;