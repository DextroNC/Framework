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
    _uglHE = "vn_40mm_m406_he_mag";
    _uglSmoke = "vn_40mm_m680_smoke_w_mag";

//Appends _primaryArray array with set of weapons and _primaryAmmo array with set of ammo based on _Rifle
    //1 - Rifle 1
    if (_Rifle == 1) then{
        _primaryArray = [
            "vn_m63a"
        ];
        _primaryAmmo = "vn_m63a_30_mag";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "vn_m45",
            "vn_m45_camo"
        ];
        _primaryAmmo = "vn_m45_mag";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "vn_xm177_xm148",
            "vn_xm177_xm148_camo"
        ];
        _primaryAmmo = "vn_m16_30_mag";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "vn_m14a1"
        ];
        _primaryAmmo = "vn_m14_mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "vn_m63a_lmg"
        ];
        _primaryAmmo = "vn_m63a_100_mag";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "vn_m60"
        ];
        _primaryAmmo = "vn_m60_100_mag";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "vn_xm177e1",
            "vn_xm177e1_camo",
            "vn_xm177",
            "vn_xm177_camo",
            "vn_xm177_fg",
            "vn_xm177_fg",
            "vn_xm177_stock",
            "vn_xm177_stock_camo"
        ];
        _primaryAmmo = "vn_m16_30_mag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "vn_m16_camo"
        ];
        _primaryAmmo = "vn_m16_30_mag";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "vn_m14_camo"
        ];
        _primaryAmmo = "vn_m14_mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "vn_m1897"
        ];
        _primaryAmmo = ["vn_m1897_buck_mag","vn_m1897_fl_mag"];
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle in [5]) then{
        _attachmentArray = [
            "vn_bipod_m63a"
        ];
    };
    if (_Rifle in [10]) then{
        _attachmentArray = [
            "vn_b_m1897"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    _unit addPrimaryWeaponItem selectRandom _attachmentArray;

//Checks rifle type, adds ammunition based on ammount
    //Infantry-based rifles - 12 Magazines
    if (_Rifle <= 2 or _Rifle == 4 or _Rifle == 7) then{
        for "_i" from 1 to 10 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //Adds UGLs for Grenadiers, SLs - 8 HE, 6 Smoke
    if (_Rifle == 3) then{
        for "_i" from 1 to 12 do {_unit addItem _primaryAmmo;};
        _unit addPrimaryWeaponItem _uglHE;
        for "_i" from 1 to 7 do {_unit addItem _uglHE;};
        for "_i" from 1 to 6 do {_unit addItem _uglSmoke;};
    };
    //AutoRifle - 1000 RNDS/1200 for E/P
    if (_Rifle == 5) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
    };
    //MMG - 500 RNDS
    if (_Rifle == 6) then{
        for "_i" from 1 to 5 do {_unit addItem _primaryAmmo;};
    };
    //DMR - 10 Magazines
    if (_Rifle == 8 or _Rifle == 9) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItem _primaryAmmo;};
    };
    //Breacher - 8 Magazines
    if (_Rifle == 10) then{
        {
            for "_i" from 1 to 15 do {_unit addItem _x;};
        } forEach _primaryAmmo;
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "vn_mk22";
    _unit addHandgunItem "vn_mk22_mag";
    _unit addItem "vn_mk22_mag";
    _unit addItem "vn_mk22_mag";