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
    _uglHE = "rhs_VOG25";
    _uglSmoke = "rhs_GRD40_White";

//Appends _primaryArray array with set of weapons and _primaryAmmo array with set of ammo based on _Rifle
    //1 - Rifle 1
    if (_Rifle == 1) then{
        _primaryArray = [
            "rhs_weap_ak103"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm_polymer";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "rhs_weap_ak104"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm_polymer";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_ak103_gp25"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm_polymer";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "UK3CB_FNFAL_STG58"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_rpk74m"
        ];
        _primaryAmmo = "rhs_60Rnd_545X39_7N10_AK_mixed";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "rhs_weap_pkp"
        ];
        _primaryAmmo = "rhs_100Rnd_762x54mmR";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "arifle_CTAR_blk_F"
        ];
        _primaryAmmo = "30Rnd_580x42_Mag_F";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "rhs_weap_ak103_zenitco01"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm_polymer";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "rhs_weap_svds_npz"
        ];
        _primaryAmmo = "rhs_10Rnd_762x54mmR_7N1";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "rhs_weap_ak104"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm_polymer";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "rhs_acc_perst1ik"
        ];
    };

    if (_Rifle in [7,8]) then{
        _attachmentArray = [
            "rhs_acc_perst3"
        ];
    };

//Selects random weapon attachment from determined array if rifle critera met, runs
    if (_Rifle >= 1) then{
        _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    };
    if ((_Rifle <= 4) or (_Rifle == 10) or (_Rifle == 7)) then{
        _unit addPrimaryWeaponItem selectRandom _gripArray;
    };


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
        for "_i" from 1 to 20 do {_unit addItem _primaryAmmo;};
    };
    //MMG - 500 RNDS
    if (_Rifle == 6) then{
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 4 do {_unit addItem _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 8 or _Rifle == 9) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //Breacher - 8 Magazines
    if (_Rifle == 10) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "rhs_weap_6p53";
    _unit addHandgunItem "rhs_18rnd_9x21mm_7N28";
    _unit addItem "rhs_18rnd_9x21mm_7N28";
    _unit addItem "rhs_18rnd_9x21mm_7N28";