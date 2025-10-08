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
            "vn_o_uniform_nva_dc_13_07",4,
            "vn_o_uniform_nva_dc_13_08",4,
            "vn_o_uniform_nva_dc_13_04",4,
            "vn_o_uniform_nva_dc_13_02",4,
            "vn_o_uniform_nva_dc_14_01",4,
            "vn_o_uniform_nva_dc_14_04",4,
            "vn_o_uniform_vc_01_01",1,
            "vn_o_uniform_vc_01_02",1,
            "vn_o_uniform_vc_01_03",1,
            "vn_o_uniform_vc_01_04",1,
            "vn_o_uniform_vc_01_05",1,
            "vn_o_uniform_vc_01_06",1,
            "vn_o_uniform_vc_01_07",1,
            "vn_o_uniform_vc_02_01",1,
            "vn_o_uniform_vc_02_02",1,
            "vn_o_uniform_vc_02_03",1,
            "vn_o_uniform_vc_02_04",1,
            "vn_o_uniform_vc_02_05",1,
            "vn_o_uniform_vc_02_06",1,
            "vn_o_uniform_vc_02_07",1,
            "vn_o_uniform_vc_03_01",1,
            "vn_o_uniform_vc_03_02",1,
            "vn_o_uniform_vc_03_03",1,
            "vn_o_uniform_vc_03_04",1,
            "vn_o_uniform_vc_03_05",1,
            "vn_o_uniform_vc_03_06",1,
            "vn_o_uniform_vc_03_07",1,
            "vn_o_uniform_vc_04_01",1,
            "vn_o_uniform_vc_04_02",1,
            "vn_o_uniform_vc_04_03",1,
            "vn_o_uniform_vc_04_04",1,
            "vn_o_uniform_vc_04_05",1,
            "vn_o_uniform_vc_04_06",1,
            "vn_o_uniform_vc_04_07",1,
            "vn_o_uniform_vc_05_01",1,
            "vn_o_uniform_vc_05_02",1,
            "vn_o_uniform_vc_05_03",1,
            "vn_o_uniform_vc_05_04",1,
            "vn_o_uniform_vc_reg_11_08",4,
            "vn_o_uniform_vc_reg_11_09",4,
            "vn_o_uniform_vc_reg_11_10",4,
            "vn_o_uniform_vc_reg_12_08",4,
            "vn_o_uniform_vc_reg_12_09",4,
            "vn_o_uniform_vc_reg_12_10",4,
            "vn_o_uniform_vc_mf_01_07",4,
            "vn_o_uniform_vc_mf_10_07",4,
            "vn_o_uniform_vc_mf_11_07",4,
            "vn_o_uniform_vc_mf_12_07",4,
            "vn_o_uniform_vc_mf_02_07",4,
            "vn_o_uniform_vc_mf_03_07",4,
            "vn_o_uniform_vc_mf_04_07",4,
            "vn_o_uniform_vc_mf_09_07",4
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "vn_o_uniform_nva_dc_13_07",4,
            "vn_o_uniform_nva_dc_13_08",4,
            "vn_o_uniform_nva_dc_13_04",4,
            "vn_o_uniform_nva_dc_13_02",4,
            "vn_o_uniform_nva_dc_14_01",4,
            "vn_o_uniform_nva_dc_14_04",4,
            "vn_o_uniform_vc_01_01",1,
            "vn_o_uniform_vc_01_02",1,
            "vn_o_uniform_vc_01_03",1,
            "vn_o_uniform_vc_01_04",1,
            "vn_o_uniform_vc_01_05",1,
            "vn_o_uniform_vc_01_06",1,
            "vn_o_uniform_vc_01_07",1,
            "vn_o_uniform_vc_02_01",1,
            "vn_o_uniform_vc_02_02",1,
            "vn_o_uniform_vc_02_03",1,
            "vn_o_uniform_vc_02_04",1,
            "vn_o_uniform_vc_02_05",1,
            "vn_o_uniform_vc_02_06",1,
            "vn_o_uniform_vc_02_07",1,
            "vn_o_uniform_vc_03_01",1,
            "vn_o_uniform_vc_03_02",1,
            "vn_o_uniform_vc_03_03",1,
            "vn_o_uniform_vc_03_04",1,
            "vn_o_uniform_vc_03_05",1,
            "vn_o_uniform_vc_03_06",1,
            "vn_o_uniform_vc_03_07",1,
            "vn_o_uniform_vc_04_01",1,
            "vn_o_uniform_vc_04_02",1,
            "vn_o_uniform_vc_04_03",1,
            "vn_o_uniform_vc_04_04",1,
            "vn_o_uniform_vc_04_05",1,
            "vn_o_uniform_vc_04_06",1,
            "vn_o_uniform_vc_04_07",1,
            "vn_o_uniform_vc_05_01",1,
            "vn_o_uniform_vc_05_02",1,
            "vn_o_uniform_vc_05_03",1,
            "vn_o_uniform_vc_05_04",1,
            "vn_o_uniform_vc_reg_11_08",4,
            "vn_o_uniform_vc_reg_11_09",4,
            "vn_o_uniform_vc_reg_11_10",4,
            "vn_o_uniform_vc_reg_12_08",4,
            "vn_o_uniform_vc_reg_12_09",4,
            "vn_o_uniform_vc_reg_12_10",4,
            "vn_o_uniform_vc_mf_01_07",4,
            "vn_o_uniform_vc_mf_10_07",4,
            "vn_o_uniform_vc_mf_11_07",4,
            "vn_o_uniform_vc_mf_12_07",4,
            "vn_o_uniform_vc_mf_02_07",4,
            "vn_o_uniform_vc_mf_03_07",4,
            "vn_o_uniform_vc_mf_04_07",4,
            "vn_o_uniform_vc_mf_09_07",4
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "vn_o_uniform_nva_dc_13_07",4,
            "vn_o_uniform_nva_dc_13_08",4,
            "vn_o_uniform_nva_dc_13_04",4,
            "vn_o_uniform_nva_dc_13_02",4,
            "vn_o_uniform_nva_dc_14_01",4,
            "vn_o_uniform_nva_dc_14_04",4,
            "vn_o_uniform_vc_01_01",1,
            "vn_o_uniform_vc_01_02",1,
            "vn_o_uniform_vc_01_03",1,
            "vn_o_uniform_vc_01_04",1,
            "vn_o_uniform_vc_01_05",1,
            "vn_o_uniform_vc_01_06",1,
            "vn_o_uniform_vc_01_07",1,
            "vn_o_uniform_vc_02_01",1,
            "vn_o_uniform_vc_02_02",1,
            "vn_o_uniform_vc_02_03",1,
            "vn_o_uniform_vc_02_04",1,
            "vn_o_uniform_vc_02_05",1,
            "vn_o_uniform_vc_02_06",1,
            "vn_o_uniform_vc_02_07",1,
            "vn_o_uniform_vc_03_01",1,
            "vn_o_uniform_vc_03_02",1,
            "vn_o_uniform_vc_03_03",1,
            "vn_o_uniform_vc_03_04",1,
            "vn_o_uniform_vc_03_05",1,
            "vn_o_uniform_vc_03_06",1,
            "vn_o_uniform_vc_03_07",1,
            "vn_o_uniform_vc_04_01",1,
            "vn_o_uniform_vc_04_02",1,
            "vn_o_uniform_vc_04_03",1,
            "vn_o_uniform_vc_04_04",1,
            "vn_o_uniform_vc_04_05",1,
            "vn_o_uniform_vc_04_06",1,
            "vn_o_uniform_vc_04_07",1,
            "vn_o_uniform_vc_05_01",1,
            "vn_o_uniform_vc_05_02",1,
            "vn_o_uniform_vc_05_03",1,
            "vn_o_uniform_vc_05_04",1,
            "vn_o_uniform_vc_reg_11_08",4,
            "vn_o_uniform_vc_reg_11_09",4,
            "vn_o_uniform_vc_reg_11_10",4,
            "vn_o_uniform_vc_reg_12_08",4,
            "vn_o_uniform_vc_reg_12_09",4,
            "vn_o_uniform_vc_reg_12_10",4,
            "vn_o_uniform_vc_mf_01_07",4,
            "vn_o_uniform_vc_mf_10_07",4,
            "vn_o_uniform_vc_mf_11_07",4,
            "vn_o_uniform_vc_mf_12_07",4,
            "vn_o_uniform_vc_mf_02_07",4,
            "vn_o_uniform_vc_mf_03_07",4,
            "vn_o_uniform_vc_mf_04_07",4,
            "vn_o_uniform_vc_mf_09_07",4
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "vn_o_uniform_nva_dc_13_07",4,
            "vn_o_uniform_nva_dc_13_08",4,
            "vn_o_uniform_nva_dc_13_04",4,
            "vn_o_uniform_nva_dc_13_02",4,
            "vn_o_uniform_nva_dc_14_01",4,
            "vn_o_uniform_nva_dc_14_04",4,
            "vn_o_uniform_vc_01_01",1,
            "vn_o_uniform_vc_01_02",1,
            "vn_o_uniform_vc_01_03",1,
            "vn_o_uniform_vc_01_04",1,
            "vn_o_uniform_vc_01_05",1,
            "vn_o_uniform_vc_01_06",1,
            "vn_o_uniform_vc_01_07",1,
            "vn_o_uniform_vc_02_01",1,
            "vn_o_uniform_vc_02_02",1,
            "vn_o_uniform_vc_02_03",1,
            "vn_o_uniform_vc_02_04",1,
            "vn_o_uniform_vc_02_05",1,
            "vn_o_uniform_vc_02_06",1,
            "vn_o_uniform_vc_02_07",1,
            "vn_o_uniform_vc_03_01",1,
            "vn_o_uniform_vc_03_02",1,
            "vn_o_uniform_vc_03_03",1,
            "vn_o_uniform_vc_03_04",1,
            "vn_o_uniform_vc_03_05",1,
            "vn_o_uniform_vc_03_06",1,
            "vn_o_uniform_vc_03_07",1,
            "vn_o_uniform_vc_04_01",1,
            "vn_o_uniform_vc_04_02",1,
            "vn_o_uniform_vc_04_03",1,
            "vn_o_uniform_vc_04_04",1,
            "vn_o_uniform_vc_04_05",1,
            "vn_o_uniform_vc_04_06",1,
            "vn_o_uniform_vc_04_07",1,
            "vn_o_uniform_vc_05_01",1,
            "vn_o_uniform_vc_05_02",1,
            "vn_o_uniform_vc_05_03",1,
            "vn_o_uniform_vc_05_04",1,
            "vn_o_uniform_vc_reg_11_08",4,
            "vn_o_uniform_vc_reg_11_09",4,
            "vn_o_uniform_vc_reg_11_10",4,
            "vn_o_uniform_vc_reg_12_08",4,
            "vn_o_uniform_vc_reg_12_09",4,
            "vn_o_uniform_vc_reg_12_10",4,
            "vn_o_uniform_vc_mf_01_07",4,
            "vn_o_uniform_vc_mf_10_07",4,
            "vn_o_uniform_vc_mf_11_07",4,
            "vn_o_uniform_vc_mf_12_07",4,
            "vn_o_uniform_vc_mf_02_07",4,
            "vn_o_uniform_vc_mf_03_07",4,
            "vn_o_uniform_vc_mf_04_07",4,
            "vn_o_uniform_vc_mf_09_07",4
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandomWeighted _uniformArray;


//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "vn_o_helmet_vc_04",2,
            "vn_o_helmet_vc_03",2,
            "vn_o_helmet_vc_05",1,
            "vn_o_helmet_vc_02",1,
            "vn_o_helmet_vc_01",1,
            "vn_o_boonie_vc_01_02",1,
            "vn_o_boonie_vc_01_01",1,
            "vn_o_boonie_vc_02_02",1,
            "vn_o_boonie_vc_02_01",1,
            "vn_o_cap_02",2,
            "vn_c_headband_01",1,
            "vn_c_headband_02",1,
            "vn_c_headband_03",1,
            "vn_c_headband_04",1,
            "vn_c_conehat_02",3,
            "vn_c_conehat_01",3
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "vn_o_helmet_vc_04",2,
            "vn_o_helmet_vc_03",2,
            "vn_o_helmet_vc_05",1,
            "vn_o_helmet_vc_02",1,
            "vn_o_helmet_vc_01",1,
            "vn_o_boonie_vc_01_02",1,
            "vn_o_boonie_vc_01_01",1,
            "vn_o_boonie_vc_02_02",1,
            "vn_o_boonie_vc_02_01",1,
            "vn_o_cap_02",2,
            "vn_c_headband_01",1,
            "vn_c_headband_02",1,
            "vn_c_headband_03",1,
            "vn_c_headband_04",1,
            "vn_c_conehat_02",3,
            "vn_c_conehat_01",3
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "vn_o_helmet_vc_04",2,
            "vn_o_helmet_vc_03",2,
            "vn_o_helmet_vc_05",1,
            "vn_o_helmet_vc_02",1,
            "vn_o_helmet_vc_01",1,
            "vn_o_boonie_vc_01_02",1,
            "vn_o_boonie_vc_01_01",1,
            "vn_o_boonie_vc_02_02",1,
            "vn_o_boonie_vc_02_01",1,
            "vn_o_cap_02",2,
            "vn_c_headband_01",1,
            "vn_c_headband_02",1,
            "vn_c_headband_03",1,
            "vn_c_headband_04",1,
            "vn_c_conehat_02",3,
            "vn_c_conehat_01",3
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "vn_o_helmet_vc_04",2,
            "vn_o_helmet_vc_03",2,
            "vn_o_helmet_vc_05",1,
            "vn_o_helmet_vc_02",1,
            "vn_o_helmet_vc_01",1,
            "vn_o_boonie_vc_01_02",1,
            "vn_o_boonie_vc_01_01",1,
            "vn_o_boonie_vc_02_02",1,
            "vn_o_boonie_vc_02_01",1,
            "vn_o_cap_02",2,
            "vn_c_headband_01",1,
            "vn_c_headband_02",1,
            "vn_c_headband_03",1,
            "vn_c_headband_04",1,
            "vn_c_conehat_02",3,
            "vn_c_conehat_01",3
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