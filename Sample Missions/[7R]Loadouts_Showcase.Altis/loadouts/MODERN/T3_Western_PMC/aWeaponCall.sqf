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
        [_unit, 1] call compile preprocessFileLineNumbers "loadouts\MODERN\T3_Western_PMC\aWeaponCall.sqf";

    Return:
        --> Nada, performs functions within script.
*/

//Pulls information from loadout, looks for rifletype
    params ["_unit", "_Rifle"];

//Creates array of weapons, ammunition
    _primaryArray = "";
    _primaryAmmo = "";
    _attachmentArray = "";
    _gripArray = "";
    _uglHE = "1Rnd_HE_Grenade_shell";
    _uglSmoke = "1Rnd_Smoke_Grenade_shell";

//Appends _primaryArray array with set of weapons and _primaryAmmo array with set of ammo based on _Rifle
    //1 - Rifle 1
    if (_Rifle == 1) then{
        _primaryArray = [
            "rhs_weap_mk18",
            "rhs_weap_mk18_bk",
            "rhs_weap_mk18_d",
            "rhs_weap_mk18",
            "rhs_weap_mk18_bk",
            "rhs_weap_mk18_d",
            "rhs_weap_hk416d10",
            "rhs_weap_hk416d10",
            "rhs_weap_hk416d10",
            "rhs_weap_m4a1_carryhandle_mstock",
            "rhs_weap_m4a1_carryhandle_mstock",
            "rhs_weap_m4a1_carryhandle_mstock",
            "rhs_weap_m4a1_carryhandle_mstock"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "arifle_TRG20_F",
            "arifle_TRG20_F",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "arifle_Mk20C_plain_F",
            "arifle_Mk20C_plain_F"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_mk18_m320",
            "rhs_weap_mk18_m320",
            "rhs_weap_mk18_m320",
            "rhs_weap_hk416d10_m320",
            "rhs_weap_hk416d10_m320",
            "rhs_weap_m4a1_carryhandle_m203S",
            "rhs_weap_m4a1_carryhandle_m203S",
            "rhs_weap_m4a1_carryhandle_m203S"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

    //3 - Grenadier
    if (_Rifle == 32) then{
        _primaryArray = [
            "arifle_TRG20_F",
            "arifle_TRG20_F",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "arifle_Mk20C_plain_F",
            "arifle_Mk20C_plain_F"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "rhs_weap_m14_ris_fiberglass",
            "rhs_weap_m14_ris",
            "rhs_weap_m14_ris_d"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_m249_pip",
            "rhs_weap_m249_pip_ris",
            "rhs_weap_m249_light_S",
            "rhs_weap_m249_pip_S_para",
            "rhs_weap_m249_pip_S"
        ];
        _primaryAmmo = "rhsusf_200Rnd_556x45_soft_pouch_coyote";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "rhs_weap_m240B",
            "rhs_weap_m240G",
            "rhs_weap_fnmag"
        ];
        _primaryAmmo = "rhsusf_100Rnd_762x51";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "SMG_03C_TR_black",
            "SMG_03C_TR_camo",
            "SMG_03C_TR_khaki"
        ];
        _primaryAmmo = "50Rnd_570x28_SMG_03";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "rhs_weap_m27iar_grip",
            "rhs_weap_m27iar_grip",
            "rhs_weap_m4a1_blockII",
            "rhs_weap_m4a1_blockII_blk",
            "rhs_weap_m4a1_blockII_d"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "rhs_weap_sr25_ec",
            "rhs_weap_sr25_ec_d"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "arifle_TRG20_F",
            "arifle_TRG20_F",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "7r_weap_ef88_c",
            "7r_weap_ef88_c_black",
            "arifle_Mk20C_plain_F",
            "arifle_Mk20C_plain_F"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "uk3cb_baf_llm_flashlight_black"
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
    if ((_Rifle <= 3) or (_Rifle == 10)) then{
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
    if (_Rifle == 10 or _Rifle == 32) then{
        for "_i" from 1 to 8 do {_unit addItem _primaryAmmo;};
    };

//Adds sidearm, secondary as well as ammunition, attachments
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";