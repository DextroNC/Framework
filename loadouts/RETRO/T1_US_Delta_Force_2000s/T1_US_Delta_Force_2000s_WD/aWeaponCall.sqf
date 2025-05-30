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
            "rhs_weap_m4a1_carryhandle"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "rhs_weap_m4a1_carryhandle"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_m4a1_carryhandle_m203"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "rhs_weap_m14_socom_rail"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_m249_pip_S"
        ];
        _primaryAmmo = "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch";
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
            "UK3CB_MP5A4"
        ];
        _primaryAmmo = "30Rnd_9x21_Mag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "rhs_weap_m16a4"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "rhs_weap_sr25"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "rhs_weap_m4a1_carryhandle"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "rhsusf_acc_anpeq15_bk",
            "rhsusf_acc_anpeq15"
        ];
    };
    if (_Rifle in [3,4,5,7,9]) then{
        _attachmentArray = [
            "rhsusf_acc_anpeq15side_bk",
            "rhsusf_acc_anpeq15side"
        ];
    };
    if ((_Rifle <= 3) or (_Rifle == 10) or (_Rifle == 7)) then{
        _gripArray = [
            "",
            "",
            "rhsusf_acc_kac_grip",
            "rhsusf_acc_kac_grip",
            "rhsusf_acc_kac_grip"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    if (_Rifle >= 1) then{
        _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    };
    if ((_Rifle <= 3) or (_Rifle == 10)) then{
        _unit addPrimaryWeaponItem selectRandom _gripArray;
    };
    if (_Rifle == 7) then{
        _unit addPrimaryWeaponItem "uk3cb_muzzle_snds_mp5";
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
        for "_i" from 1 to 3 do {_unit addItem _primaryAmmo;};
        for "_i" from 1 to 5 do {_unit addItem _primaryAmmo;};
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
    _unit addWeapon "rhsusf_weap_m9";
    _unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_15Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_15Rnd_9x19_JHP";