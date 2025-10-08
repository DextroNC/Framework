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
            "vn_b_uniform_aus_01_01",
            "vn_b_uniform_aus_02_01",
            "vn_b_uniform_aus_03_01",
            "vn_b_uniform_aus_04_01",
            "vn_b_uniform_aus_05_01",
            "vn_b_uniform_aus_07_01",
            "vn_b_uniform_aus_08_01",
            "vn_b_uniform_aus_09_01",
            "vn_b_uniform_aus_10_01"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "vn_b_uniform_aus_01_01",
            "vn_b_uniform_aus_02_01",
            "vn_b_uniform_aus_03_01",
            "vn_b_uniform_aus_04_01",
            "vn_b_uniform_aus_05_01",
            "vn_b_uniform_aus_07_01",
            "vn_b_uniform_aus_08_01",
            "vn_b_uniform_aus_09_01",
            "vn_b_uniform_aus_10_01"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "vn_b_uniform_aus_01_01",
            "vn_b_uniform_aus_02_01",
            "vn_b_uniform_aus_03_01",
            "vn_b_uniform_aus_04_01",
            "vn_b_uniform_aus_05_01",
            "vn_b_uniform_aus_07_01",
            "vn_b_uniform_aus_08_01",
            "vn_b_uniform_aus_09_01",
            "vn_b_uniform_aus_10_01"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "vn_b_uniform_sas_01_06",
            "vn_b_uniform_sas_02_06",
            "vn_b_uniform_sas_03_06"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;


//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "vn_b_boonie_08_02",
            "vn_b_boonie_08_01",
            "vn_b_boonie_07_02",
            "vn_b_boonie_07_01",
            "vn_b_boonie_06_02",
            "vn_b_boonie_06_01"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "vn_b_boonie_08_02",
            "vn_b_boonie_08_01",
            "vn_b_boonie_07_02",
            "vn_b_boonie_07_01",
            "vn_b_boonie_06_02",
            "vn_b_boonie_06_01"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "vn_b_boonie_08_02",
            "vn_b_boonie_08_01",
            "vn_b_boonie_07_02",
            "vn_b_boonie_07_01",
            "vn_b_boonie_06_02",
            "vn_b_boonie_06_01"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "vn_b_bandana_08",
            "vn_b_boonie_02_08",
            "vn_b_boonie_03_08",
            "vn_b_boonie_04_08",
            "vn_b_boonie_05_08",
            "vn_b_boonie_01_08",
            "vn_b_headband_08",
            "vn_b_headband_01",
            "vn_b_headband_04",
            "vn_b_headband_03"
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandom _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.162,
            "vn_b_scarf_01_03", 0.162,
            "vn_b_acc_rag_02", 0.2,
            "vn_b_acc_rag_01", 0.2,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.162,
            "vn_b_scarf_01_03", 0.162,
            "vn_b_acc_rag_02", 0.2,
            "vn_b_acc_rag_01", 0.2,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.162,
            "vn_b_scarf_01_03", 0.162,
            "vn_b_acc_rag_02", 0.2,
            "vn_b_acc_rag_01", 0.2,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.162,
            "vn_b_scarf_01_03", 0.162,
            "vn_b_acc_rag_02", 0.2,
            "vn_b_acc_rag_01", 0.2,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;