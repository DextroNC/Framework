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
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _uniformArray = [
            "7r_afghanka_lpdf_amoeba",
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2",
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2",
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2",
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _uniformArray = [
            "7r_afghanka_lpdf_mixed_1",
            "7r_afghanka_lpdf_mixed_2"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _uniformArray = [
            "rhs_uniform_gorka_1_a"
        ];
    };
    
//Selects random uniform from determined array, runs
_unit forceAddUniform selectRandom _uniformArray;

//Appends array of hats with desired uniforms based on _Class
    //Echo
    if (_Class == 1) then{
        _hatArray = [
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_back",
            "7r_fieldcap_lpdf_rain_back"
        ];
    };

    //Squad
    if (_Class == 2) then{
        _hatArray = [
            "rhs_ssh60"
        ];
    };

    //Platoon 
    if (_Class == 3) then{
        _hatArray = [
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_rain",
            "7r_fieldcap_lpdf",
            "7r_fieldcap_lpdf_back",
            "7r_fieldcap_lpdf_rain_back",
            "7r_pilotka_lpdf",
            "7r_pilotka_lpdf",
            "7r_pilotka_lpdf",
            "7r_pilotka_lpdf"
        ];
    };

    //Sierra
    if (_Class == 4) then{
        _hatArray = [
            "rhs_beanie_green"
        ];
    };

    //Selects random hat from determined array, runs
_unit addHeadgear selectRandom _hatArray;

//Appends array of goggleswith desired values
    _goggleArray =[
		"", 0.94,
		"G_Aviator", 0.02,
		"G_Spectacles", 0.02,
		"G_Squares", 0.02
    ];

    if (_Class == 2) then {
        _goggleArray = [
            "7r_scrim_semi", 0.75,
            "", 0.19,
            "G_Aviator", 0.02,
            "G_Spectacles", 0.02,
            "G_Squares", 0.02
        ];
    };

    //Selects random googles from determined array
_unit addGoggles selectRandomWeighted _goggleArray;