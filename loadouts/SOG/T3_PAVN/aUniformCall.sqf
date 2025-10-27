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
            "vn_o_uniform_nva_army_01_04",1,
            "vn_o_uniform_nva_army_02_04",1,
            "vn_o_uniform_nva_army_03_04",1,
            "vn_o_uniform_nva_army_04_04",1,
            "vn_o_uniform_nva_army_05_04",1,
            "vn_o_uniform_nva_army_06_04",1,
            "vn_o_uniform_nva_army_07_04",1,
            "vn_o_uniform_nva_army_08_04",1,
            "vn_o_uniform_nva_army_09_04",1,
            "vn_o_uniform_nva_army_10_04",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "vn_o_uniform_nva_army_01_04",1,
            "vn_o_uniform_nva_army_02_04",1,
            "vn_o_uniform_nva_army_03_04",1,
            "vn_o_uniform_nva_army_04_04",1,
            "vn_o_uniform_nva_army_05_04",1,
            "vn_o_uniform_nva_army_06_04",1,
            "vn_o_uniform_nva_army_07_04",1,
            "vn_o_uniform_nva_army_08_04",1,
            "vn_o_uniform_nva_army_09_04",1,
            "vn_o_uniform_nva_army_10_04",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "vn_o_uniform_nva_army_01_04",1,
            "vn_o_uniform_nva_army_02_04",1,
            "vn_o_uniform_nva_army_03_04",1,
            "vn_o_uniform_nva_army_04_04",1,
            "vn_o_uniform_nva_army_05_04",1,
            "vn_o_uniform_nva_army_06_04",1,
            "vn_o_uniform_nva_army_07_04",1,
            "vn_o_uniform_nva_army_08_04",1,
            "vn_o_uniform_nva_army_09_04",1,
            "vn_o_uniform_nva_army_10_04",1
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "vn_o_uniform_nva_army_01_04",1,
            "vn_o_uniform_nva_army_02_04",1,
            "vn_o_uniform_nva_army_03_04",1,
            "vn_o_uniform_nva_army_04_04",1,
            "vn_o_uniform_nva_army_05_04",1,
            "vn_o_uniform_nva_army_06_04",1,
            "vn_o_uniform_nva_army_07_04",1,
            "vn_o_uniform_nva_army_08_04",1,
            "vn_o_uniform_nva_army_09_04",1,
            "vn_o_uniform_nva_army_10_04",1
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;


//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "vn_o_helmet_nva_04",2,
            "vn_o_helmet_nva_03",2,
            "vn_o_helmet_nva_07",1,
            "vn_o_helmet_nva_02",1,
            "vn_o_helmet_nva_01",1
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "vn_o_helmet_nva_04",2,
            "vn_o_helmet_nva_03",2,
            "vn_o_helmet_nva_07",1,
            "vn_o_helmet_nva_02",1,
            "vn_o_helmet_nva_01",1
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "vn_o_boonie_nva_02_01",3,
            "vn_o_cap_01",2
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "vn_o_boonie_nva_02_01",3,
            "vn_o_cap_01",2
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
            "vn_o_scarf_01_02", 0.15,
            "vn_o_scarf_01_03", 0.15,
            "vn_g_spectacles_01",0.125
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
            "vn_o_scarf_01_02", 0.15,
            "vn_o_scarf_01_03", 0.15,
            "vn_g_spectacles_01",0.125
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
            "vn_o_scarf_01_02", 0.15,
            "vn_o_scarf_01_03", 0.15,
            "vn_g_spectacles_01",0.125
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
            "vn_o_scarf_01_02", 0.15,
            "vn_o_scarf_01_03", 0.15,
            "vn_g_spectacles_01",0.125
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;