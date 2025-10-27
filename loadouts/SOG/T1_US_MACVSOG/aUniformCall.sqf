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
            "vn_b_uniform_macv_01_02",1,
            "vn_b_uniform_macv_02_02",1,
            "vn_b_uniform_macv_03_02",1,
            "vn_b_uniform_macv_04_02",1,
            "vn_b_uniform_macv_05_02",1,
            "vn_b_uniform_macv_06_02",2,
            "vn_b_uniform_macv_01_01",1,
            "vn_b_uniform_macv_02_01",1,
            "vn_b_uniform_macv_03_01",1,
            "vn_b_uniform_macv_04_01",1,
            "vn_b_uniform_macv_05_01",1,
            "vn_b_uniform_macv_06_01",2,
            "vn_b_uniform_macv_01_06",1,
            "vn_b_uniform_macv_02_06",1,
            "vn_b_uniform_macv_03_06",1,
            "vn_b_uniform_macv_04_06",1,
            "vn_b_uniform_macv_05_06",1,
            "vn_b_uniform_macv_06_06",2,
            "vn_b_uniform_sog_01_01",2,
            "vn_b_uniform_sog_01_04",2,
            "vn_b_uniform_sog_01_06",2,
            "vn_b_uniform_sog_01_02",2,
            "vn_b_uniform_sog_01_05",2,
            "vn_b_uniform_sog_02_01",2,
            "vn_b_uniform_sog_02_04",2,
            "vn_b_uniform_sog_02_06",2,
            "vn_b_uniform_sog_02_02",2,
            "vn_b_uniform_sog_02_05",2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_02",1,
            "vn_b_uniform_macv_02_02",1,
            "vn_b_uniform_macv_03_02",1,
            "vn_b_uniform_macv_04_02",1,
            "vn_b_uniform_macv_05_02",1,
            "vn_b_uniform_macv_06_02",2,
            "vn_b_uniform_macv_01_01",1,
            "vn_b_uniform_macv_02_01",1,
            "vn_b_uniform_macv_03_01",1,
            "vn_b_uniform_macv_04_01",1,
            "vn_b_uniform_macv_05_01",1,
            "vn_b_uniform_macv_06_01",2,
            "vn_b_uniform_macv_01_06",1,
            "vn_b_uniform_macv_02_06",1,
            "vn_b_uniform_macv_03_06",1,
            "vn_b_uniform_macv_04_06",1,
            "vn_b_uniform_macv_05_06",1,
            "vn_b_uniform_macv_06_06",2,
            "vn_b_uniform_sog_01_01",2,
            "vn_b_uniform_sog_01_04",2,
            "vn_b_uniform_sog_01_06",2,
            "vn_b_uniform_sog_01_02",2,
            "vn_b_uniform_sog_01_05",2,
            "vn_b_uniform_sog_02_01",2,
            "vn_b_uniform_sog_02_04",2,
            "vn_b_uniform_sog_02_06",2,
            "vn_b_uniform_sog_02_02",2,
            "vn_b_uniform_sog_02_05",2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_02",1,
            "vn_b_uniform_macv_02_02",1,
            "vn_b_uniform_macv_03_02",1,
            "vn_b_uniform_macv_04_02",1,
            "vn_b_uniform_macv_05_02",1,
            "vn_b_uniform_macv_06_02",2,
            "vn_b_uniform_macv_01_01",1,
            "vn_b_uniform_macv_02_01",1,
            "vn_b_uniform_macv_03_01",1,
            "vn_b_uniform_macv_04_01",1,
            "vn_b_uniform_macv_05_01",1,
            "vn_b_uniform_macv_06_01",2,
            "vn_b_uniform_macv_01_06",1,
            "vn_b_uniform_macv_02_06",1,
            "vn_b_uniform_macv_03_06",1,
            "vn_b_uniform_macv_04_06",1,
            "vn_b_uniform_macv_05_06",1,
            "vn_b_uniform_macv_06_06",2,
            "vn_b_uniform_sog_01_01",2,
            "vn_b_uniform_sog_01_04",2,
            "vn_b_uniform_sog_01_06",2,
            "vn_b_uniform_sog_01_02",2,
            "vn_b_uniform_sog_01_05",2,
            "vn_b_uniform_sog_02_01",2,
            "vn_b_uniform_sog_02_04",2,
            "vn_b_uniform_sog_02_06",2,
            "vn_b_uniform_sog_02_02",2,
            "vn_b_uniform_sog_02_05",2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_02",1,
            "vn_b_uniform_macv_02_02",1,
            "vn_b_uniform_macv_03_02",1,
            "vn_b_uniform_macv_04_02",1,
            "vn_b_uniform_macv_05_02",1,
            "vn_b_uniform_macv_06_02",2,
            "vn_b_uniform_macv_01_01",1,
            "vn_b_uniform_macv_02_01",1,
            "vn_b_uniform_macv_03_01",1,
            "vn_b_uniform_macv_04_01",1,
            "vn_b_uniform_macv_05_01",1,
            "vn_b_uniform_macv_06_01",2,
            "vn_b_uniform_macv_01_06",1,
            "vn_b_uniform_macv_02_06",1,
            "vn_b_uniform_macv_03_06",1,
            "vn_b_uniform_macv_04_06",1,
            "vn_b_uniform_macv_05_06",1,
            "vn_b_uniform_macv_06_06",2,
            "vn_b_uniform_sog_01_01",2,
            "vn_b_uniform_sog_01_04",2,
            "vn_b_uniform_sog_01_06",2,
            "vn_b_uniform_sog_01_02",2,
            "vn_b_uniform_sog_01_05",2,
            "vn_b_uniform_sog_02_01",2,
            "vn_b_uniform_sog_02_04",2,
            "vn_b_uniform_sog_02_06",2,
            "vn_b_uniform_sog_02_02",2,
            "vn_b_uniform_sog_02_05",2
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;


//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "vn_b_bandana_02",3,
            "vn_b_bandana_04",3,
            "vn_b_bandana_06",3,
            "vn_b_bandana_03",3,
            "vn_b_bandana_01",3,
            "vn_b_boonie_02_06",1,
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_02_04",1,
            "vn_b_boonie_02_02",1,
            "vn_b_boonie_03_06",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_03_04",1,
            "vn_b_boonie_03_02",1,
            "vn_b_boonie_04_06",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_04_04",1,
            "vn_b_boonie_04_02",1,
            "vn_b_boonie_05_06",1,
            "vn_b_boonie_05_01",1,
            "vn_b_boonie_05_04",1,
            "vn_b_boonie_05_02",1,
            "vn_b_headband_03",1,
            "vn_c_headband_04",3,
            "vn_c_headband_03",3,
            "vn_b_headband_05",3,
            "vn_b_headband_01",3,
            "vn_c_headband_02",3,
            "vn_c_headband_01",3,
            "vn_b_headband_04",3,
            "vn_b_headband_02",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "vn_b_bandana_02",3,
            "vn_b_bandana_04",3,
            "vn_b_bandana_06",3,
            "vn_b_bandana_03",3,
            "vn_b_bandana_01",3,
            "vn_b_boonie_02_06",1,
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_02_04",1,
            "vn_b_boonie_02_02",1,
            "vn_b_boonie_03_06",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_03_04",1,
            "vn_b_boonie_03_02",1,
            "vn_b_boonie_04_06",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_04_04",1,
            "vn_b_boonie_04_02",1,
            "vn_b_boonie_05_06",1,
            "vn_b_boonie_05_01",1,
            "vn_b_boonie_05_04",1,
            "vn_b_boonie_05_02",1,
            "vn_b_headband_03",1,
            "vn_c_headband_04",3,
            "vn_c_headband_03",3,
            "vn_b_headband_05",3,
            "vn_b_headband_01",3,
            "vn_c_headband_02",3,
            "vn_c_headband_01",3,
            "vn_b_headband_04",3,
            "vn_b_headband_02",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "vn_b_bandana_02",3,
            "vn_b_bandana_04",3,
            "vn_b_bandana_06",3,
            "vn_b_bandana_03",3,
            "vn_b_bandana_01",3,
            "vn_b_boonie_02_06",1,
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_02_04",1,
            "vn_b_boonie_02_02",1,
            "vn_b_boonie_03_06",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_03_04",1,
            "vn_b_boonie_03_02",1,
            "vn_b_boonie_04_06",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_04_04",1,
            "vn_b_boonie_04_02",1,
            "vn_b_boonie_05_06",1,
            "vn_b_boonie_05_01",1,
            "vn_b_boonie_05_04",1,
            "vn_b_boonie_05_02",1,
            "vn_b_headband_03",1,
            "vn_c_headband_04",3,
            "vn_c_headband_03",3,
            "vn_b_headband_05",3,
            "vn_b_headband_01",3,
            "vn_c_headband_02",3,
            "vn_c_headband_01",3,
            "vn_b_headband_04",3,
            "vn_b_headband_02",3
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "vn_b_bandana_02",3,
            "vn_b_bandana_04",3,
            "vn_b_bandana_06",3,
            "vn_b_bandana_03",3,
            "vn_b_bandana_01",3,
            "vn_b_boonie_02_06",1,
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_02_04",1,
            "vn_b_boonie_02_02",1,
            "vn_b_boonie_03_06",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_03_04",1,
            "vn_b_boonie_03_02",1,
            "vn_b_boonie_04_06",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_04_04",1,
            "vn_b_boonie_04_02",1,
            "vn_b_boonie_05_06",1,
            "vn_b_boonie_05_01",1,
            "vn_b_boonie_05_04",1,
            "vn_b_boonie_05_02",1,
            "vn_b_headband_03",1,
            "vn_c_headband_04",3,
            "vn_c_headband_03",3,
            "vn_b_headband_05",3,
            "vn_b_headband_01",3,
            "vn_c_headband_02",3,
            "vn_c_headband_01",3,
            "vn_b_headband_04",3,
            "vn_b_headband_02",3
        ];
    };
    
    //Selects random hat from determined array, runs
_helmet = selectRandomWeighted _hatArray;
_unit addHeadgear _helmet;

//Appends array of goggleswith desired values

    //Echo
    if (_Class == 1) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.081,
            "vn_b_scarf_01_03", 0.081,
            "vn_o_scarf_01_01", 0.081,
            "vn_o_scarf_01_04", 0.081,
            "vn_b_acc_rag_02", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Squad
    if (_Class == 2) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.081,
            "vn_b_scarf_01_03", 0.081,
            "vn_o_scarf_01_01", 0.081,
            "vn_o_scarf_01_04", 0.081,
            "vn_b_acc_rag_02", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.081,
            "vn_b_scarf_01_03", 0.081,
            "vn_o_scarf_01_01", 0.081,
            "vn_o_scarf_01_04", 0.081,
            "vn_b_acc_rag_02", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _goggleArray = [
            "", 0.15,
            "vn_b_scarf_01_01", 0.081,
            "vn_b_scarf_01_03", 0.081,
            "vn_o_scarf_01_01", 0.081,
            "vn_o_scarf_01_04", 0.081,
            "vn_b_acc_rag_02", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_02",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;