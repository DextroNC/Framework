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
            "uk3cb_auga2_blk",
            "uk3cb_auga2",
            "uk3cb_auga2_tan"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "uk3cb_auga2_carb_blk",
            "uk3cb_auga2_carb",
            "uk3cb_auga2_carb_tan"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_m16a4_carryhandle_M203"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "UK3CB_FNFAL_PARA_RAILS",
            "UK3CB_FNFAL_FULL_RAILS"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_m249"
        ];
        _primaryAmmo = "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "rhs_weap_fnmag"
        ];
        _primaryAmmo = "rhsusf_100Rnd_762x51";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "rhs_weap_m4a1_handguard",
            "rhs_weap_m4a1_carryhandle",
            "rhs_weap_m4a1_carryhandle_mstock",
            "rhs_weap_m4a1_handguard",
            "rhs_weap_m4a1_carryhandle",
            "rhs_weap_m4a1_carryhandle_mstock",
            "rhs_weap_m4a1",
            "rhs_weap_m4a1_mstock"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "uk3cb_auga2_lsw_blk",
            "uk3cb_auga2_lsw",
            "uk3cb_auga2_lsw_tan"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "rhs_weap_sr25",
            "rhs_weap_sr25_d"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "uk3cb_auga2_carb_blk",
            "uk3cb_auga2_carb",
            "uk3cb_auga2_carb_tan"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "uk3cb_baf_llm_ir_black"
        ];
    };
    if ((_Rifle <= 3) or (_Rifle == 10)) then{
        _gripArray = [
            "rhsusf_acc_grip2",
            "rhsusf_acc_rvg_blk"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    if (_Rifle >= 1) then{
        _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    };
    if ((_Rifle <= 4) or (_Rifle == 10)) then{
        _unit addPrimaryWeaponItem selectRandom _gripArray;
    };

//Checks rifle type, adds ammunition based on ammount
    //Infantry-based rifles - 12 Magazines
    if (_Rifle <= 4 or _Rifle == 7) then{
        for "_i" from 1 to 10 do {_unit addItemToVest _primaryAmmo;};
        for "_i" from 1 to 2 do {_unit addItemToBackpack _primaryAmmo;};
    };
    //Adds UGLs for Grenadiers, SLs - 8 HE, 6 Smoke
    if (_Rifle == 3) then{
        _unit addPrimaryWeaponItem _uglHE;
        for "_i" from 1 to 7 do {_unit addItemToBackpack _uglHE;};
        for "_i" from 1 to 6 do {_unit addItemToBackpack _uglSmoke;};
    };
    //AutoRifle - 1000 RNDS/1200 for E/P
    if (_Rifle == 5) then{
        for "_i" from 1 to 3 do {_unit addItemToVest _primaryAmmo;};
        for "_i" from 1 to 5 do {_unit addItemToBackpack _primaryAmmo;};
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
        for "_i" from 1 to 8 do {_unit addItemToVest _primaryAmmo;};
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "UK3CB_BAF_L9A1";
    _unit addHandgunItem "UK3CB_BAF_9_13Rnd";
    _unit addItem "UK3CB_BAF_9_13Rnd";
    _unit addItem "UK3CB_BAF_9_13Rnd";