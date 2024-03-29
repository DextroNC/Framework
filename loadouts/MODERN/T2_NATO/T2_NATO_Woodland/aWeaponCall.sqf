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
            "arifle_MX_Black_F",
            "arifle_MX_khk_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "arifle_MX_Black_F",
            "arifle_MX_khk_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "arifle_MX_GL_Black_F",
            "arifle_MX_GL_khk_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "arifle_SPAR_03_blk_F"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "LMG_Mk200_black_F"
        ];
        _primaryAmmo = "200Rnd_65x39_cased_Box";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "MMG_02_black_F"
        ];
        _primaryAmmo = "130Rnd_338_Mag";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "arifle_MXC_khk_F",
            "arifle_MXC_Black_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "arifle_MXM_khk_F",
            "arifle_MXM_Black_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "srifle_EBR_F"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "arifle_MX_Black_F",
            "arifle_MXC_khk_F"
        ];
        _primaryAmmo = "30Rnd_65x39_caseless_black_mag";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "ACE_DBAL_A3_Green"
        ];
    };
    if (_Rifle == 5 or _Rifle == 7) then{
        _attachmentArray = [
            "ACE_DBAL_A3_Green"
        ];
    };
    if (_Rifle == 5 or _Rifle == 5) then{
        _gripArray = [
            "bipod_01_F_blk"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    _unit addPrimaryWeaponItem selectRandom _gripArray;

//Checks rifle type, adds ammunition based on ammount
    //Infantry-based rifles - 12 Magazines
    if (_Rifle <= 4 or _Rifle == 7) then{
        for "_i" from 1 to 10 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //Adds UGLs for Grenadiers, SLs - 8 HE, 6 Smoke
    if (_Rifle == 3) then{
        _unit addPrimaryWeaponItem _uglHE;
        for "_i" from 1 to 7 do {_unit addItem _uglHE;};
        for "_i" from 1 to 6 do {_unit addItem _uglSmoke;};
    };
    //AutoRifle - 1000 RNDS/1200 for E/P
    if (_Rifle == 5) then{
        for "_i" from 1 to 5 do {_unit addItem _primaryAmmo;};
    };
    //MMG - 500 RNDS
    if (_Rifle == 6) then{
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 9) then{
        for "_i" from 1 to 10 do {_unit addItem _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 8) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //Breacher - 8 Magazines
    if (_Rifle == 10) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "hgun_P07_blk_F";
    _unit addHandgunItem "16Rnd_9x21_Mag";
    _unit addItem "16Rnd_9x21_Mag";