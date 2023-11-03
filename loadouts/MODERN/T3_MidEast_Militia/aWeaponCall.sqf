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
            "rhs_weap_pm63",
            "rhs_weap_pm63",
            "rhs_weap_pm63",
            "rhs_weap_akm",
            "rhs_weap_akm",
            "rhs_weap_m70b1"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "rhs_weap_akms",
            "rhs_weap_akms",
            "rhs_weap_m70ab2",
            "rhs_weap_m70ab2",
            "rhs_weap_m92",
            "rhs_weap_m92",
            "rhs_weap_m92",
            "rhs_weap_m92",
            "rhs_weap_m92_fold",
            "rhs_weap_m92_fold",
            "rhs_weap_m70ab2_fold",
            "rhs_weap_akms_folded"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_akm_gp25",
            "rhs_weap_akms_gp25",
            "rhs_weap_m70b3n_pbg40"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "rhs_weap_l1a1_wood"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_rpk74_wood"
        ];
        _primaryAmmo = "rhs_60Rnd_545X39_7N10_AK";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "rhs_weap_pkm"
        ];
        _primaryAmmo = "rhs_100Rnd_762x54mmR";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "rhs_weap_m4_carryhandle"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855_Stanag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "rhs_weap_akmn",
            "rhs_weap_m70b1n"
        ];
        _primaryAmmo = "rhs_30Rnd_762x39mm";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "UK3CB_SVD_OLD_NPZ"
        ];
        _primaryAmmo = "rhs_10Rnd_762x54mmR_7N1";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "sgun_HunterShotgun_01_F"
        ];
        _primaryAmmo = ["2Rnd_12Gauge_Pellets","2Rnd_12Gauge_Slug"];
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle == 7) then{
        _attachmentArray = ["rhsusf_acc_m952v"];
        _gripArray = ["rhsusf_acc_grip1","rhsusf_acc_grip1",""];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    _unit addPrimaryWeaponItem selectRandom _attachmentArray;
     _unit addPrimaryWeaponItem selectRandom _gripArray;

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
        for "_i" from 1 to 20 do {_unit addItem _primaryAmmo;};
    };
    //MMG - 500 RNDS
    if (_Rifle == 6) then{
        for "_i" from 1 to 5 do {_unit addItem _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 8 or _Rifle == 9) then{
        for "_i" from 1 to 10 do {_unit addItem _primaryAmmo;};
    };
    //Breacher - 80 Shells
    if (_Rifle == 10) then{
        {
            for "_i" from 1 to 20 do {_unit addItem _x;};
            
        } forEach _primaryAmmo;
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "rhs_weap_tt33";
    _unit addHandgunItem "rhs_mag_762x25_8";
    _unit addItem "rhs_mag_762x25_8";
    _unit addItem "rhs_mag_762x25_8";