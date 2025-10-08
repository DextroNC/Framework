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
            "vn_b_uniform_macv_01_16",1,
            "vn_b_uniform_macv_02_16",1,
            "vn_b_uniform_macv_03_16",1,
            "vn_b_uniform_macv_04_16",1,
            "vn_b_uniform_macv_05_16",1,
            "vn_b_uniform_macv_06_16",2
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_16",1,
            "vn_b_uniform_macv_02_16",1,
            "vn_b_uniform_macv_03_16",1,
            "vn_b_uniform_macv_04_16",1,
            "vn_b_uniform_macv_05_16",1,
            "vn_b_uniform_macv_06_16",2
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_16",1,
            "vn_b_uniform_macv_02_16",1,
            "vn_b_uniform_macv_03_16",1,
            "vn_b_uniform_macv_04_16",1,
            "vn_b_uniform_macv_05_16",1,
            "vn_b_uniform_macv_06_16",2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "vn_b_uniform_macv_01_16",1,
            "vn_b_uniform_macv_02_16",1,
            "vn_b_uniform_macv_03_16",1,
            "vn_b_uniform_macv_04_16",1,
            "vn_b_uniform_macv_05_16",1,
            "vn_b_uniform_macv_06_16",2
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;


//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_05_01",1,
            "rhsgref_hat_M1951",4
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "vn_o_helmet_nva_09",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_05_01",1,
            "rhsgref_hat_M1951",4
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "vn_b_boonie_02_01",1,
            "vn_b_boonie_03_01",1,
            "vn_b_boonie_04_01",1,
            "vn_b_boonie_05_01",1,
            "rhsgref_hat_M1951",4
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
            "vn_b_acc_rag_01", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_01",0.0625,
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
            "vn_b_acc_rag_01", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_01",0.0625,
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
            "vn_b_acc_rag_01", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_01",0.0625,
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
            "vn_b_acc_rag_01", 0.15,
            "vn_b_acc_rag_01", 0.15,
            "vn_g_spectacles_01",0.0625,
            "vn_g_spectacles_01",0.0625
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;