/*
    Parameters:
        <--Rifle

    Description:
        List which selects a random rifle based on what rifle type they need (_Rifle).

    _Rifle
        1 - Rifle 1
        2 - Rifle 2
        3 - Grenadier
        4 - Battlerifle
        5 - AutoRifle
        6 - MMG
        7 - SPC
        8 - DMR
        9 - MMG 2
        10 - Breacher

    Example (call script):
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

    Return:
        --> Nada, performs functions within script.
*/

//Pulls information from loadout, looks for rifletype
    params ["_unit", "_Rifle"];

//Creates array of weapons, ammunition
    _primaryArray = "";
    _primaryAmmo = "";
    _attachmentArray = [];
    _gripArray = [];
    _uglHE = "1Rnd_HE_Grenade_shell";
    _uglSmoke = "1Rnd_Smoke_Grenade_shell";

//Appends _primaryArray array with set of weapons and _primaryAmmo array with set of ammo based on _Rifle
    //1 - Rifle 1
    if (_Rifle == 1) then{
        _primaryArray = [
            "UK3CB_BAF_L85A3",
            "UK3CB_BAF_L85A3",
            "UK3CB_BAF_L85A3_afg",
            "UK3CB_BAF_L85A3_afg_t",
            "UK3CB_BAF_L85A3_afg_g",
            "UK3CB_BAF_L85A3_grippod",
            "UK3CB_BAF_L85A3_grippod"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "UK3CB_BAF_L85A3",
            "UK3CB_BAF_L85A3",
            "UK3CB_BAF_L85A3_afg",
            "UK3CB_BAF_L85A3_afg_t",
            "UK3CB_BAF_L85A3_afg_g",
            "UK3CB_BAF_L85A3_grippod",
            "UK3CB_BAF_L85A3_grippod"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "UK3CB_BAF_L85A3_UGL"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "UK3CB_BAF_L129A1",
            "UK3CB_BAF_L129A1_Fgrip",
            "UK3CB_BAF_L129A1_afg",
            "UK3CB_BAF_L129A1_afg_t",
            "UK3CB_BAF_L129A1_afg_g",
            "UK3CB_BAF_L129A1_grippod",
            "UK3CB_BAF_L129A1_grippod"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "UK3CB_BAF_L110A2RIS",
            "UK3CB_BAF_L110A3"
        ];
        _primaryAmmo = "rhsusf_200Rnd_556x45_soft_pouch";
    };
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "rhs_weap_m240G"
        ];
        _primaryAmmo = "rhsusf_100Rnd_762x51";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "UK3CB_BAF_L119A1_RIS",
            "UK3CB_BAF_L119A1_RIS",
            "UK3CB_BAF_L119A1_RIS_afg",
            "UK3CB_BAF_L119A1_RIS_afg_t",
            "UK3CB_BAF_L119A1_RIS_afg_g",
            "UK3CB_BAF_L119A1_RIS_grippod",
            "UK3CB_BAF_L119A1_RIS_grippod"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "UK3CB_BAF_L86A3"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "UK3CB_BAF_L129A1_Fgrip_Bipod"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "UK3CB_BAF_L119A1_RIS",
            "UK3CB_BAF_L119A1_RIS",
            "UK3CB_BAF_L119A1_RIS_afg",
            "UK3CB_BAF_L119A1_RIS_afg_t",
            "UK3CB_BAF_L119A1_RIS_afg_g",
            "UK3CB_BAF_L119A1_RIS_grippod",
            "UK3CB_BAF_L119A1_RIS_grippod"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "uk3cb_baf_llm_ir_black",
            "uk3cb_baf_llm_ir_black",
            "UK3CB_BAF_LLM_IR_Tan"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    if (_Rifle >= 1) then{
        _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    };

//Checks rifle type, adds ammunition based on ammount
    //Infantry-based rifles - 12 Magazines
    if (_Rifle <= 4 or _Rifle == 7) then{
        for "_i" from 1 to 12 do {_unit addItem _primaryAmmo;};
    };
    //Adds UGLs for Grenadiers, SLs - 8 HE, 6 Smoke
    if (_Rifle == 3) then{
        _unit addPrimaryWeaponItem _uglHE;
        for "_i" from 1 to 7 do {_unit addItemToBackpack _uglHE;};
        for "_i" from 1 to 6 do {_unit addItemToBackpack _uglSmoke;};
    };
    //AutoRifle - 1000 RNDS/1200 for E/P
    if (_Rifle == 5) then{
        for "_i" from 1 to 6 do {_unit addItem _primaryAmmo;};
    };
    //MMG - 500 RNDS
    if (_Rifle == 6) then{
        for "_i" from 1 to 2 do {_unit addItemToVest _primaryAmmo;};
        for "_i" from 1 to 4 do {_unit addItemToBackpack _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 8 or _Rifle == 9) then{
        for "_i" from 1 to 8 do {_unit addItemToVest _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItemToBackpack _primaryAmmo;};
    };
    //Breacher - 8 Magazines
    if (_Rifle == 10) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";