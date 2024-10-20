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
            "rhs_weap_hk416d15_smr_tan",
            "rhs_weap_hk416d15_smr_tan_kac",
            "rhs_weap_hk416d15_smr",
            "rhs_weap_hk416d15_smr_kac",
            "rhs_weap_hk416d15_smr",
            "rhs_weap_hk416d15_smr_kac"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
    };

    //2 - Rifle 2
    if (_Rifle == 2) then{
        _primaryArray = [
            "rhs_weap_hk416d10_smr_tan",
            "rhs_weap_hk416d10_smr_tan_kac",
            "rhs_weap_hk416d10_smr",
            "rhs_weap_hk416d10_smr_kac",
            "rhs_weap_hk416d10_smr",
            "rhs_weap_hk416d10_smr_kac"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
    };

    //3 - Grenadier
    if (_Rifle == 3) then{
        _primaryArray = [
            "rhs_weap_hk416d10_m320_d",
            "rhs_weap_hk416d10_m320"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
    };

    //4 - BattleRifle
    if (_Rifle == 4) then{
        _primaryArray = [
            "7r_weap_hk417vfg",
            "7r_weap_hk417"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //5 - AutoRifle
    if (_Rifle == 5) then{
        _primaryArray = [
            "rhs_weap_minimi_para_railed"
        ];
        _primaryAmmo = "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    };

    //6 - MMG
    if (_Rifle == 6) then{
        _primaryArray = [
            "UK3CB_MG3_KWS_B"
        ];
        _primaryAmmo = "UK3CB_MG3_250rnd_762x51_RM";
    };

    //7 - SPC
    if (_Rifle == 7) then{
        _primaryArray = [
            "rhsusf_weap_MP7A2"
        ];
        _primaryAmmo = "rhsusf_mag_40Rnd_46x30_AP";
    };

    //8 - DMR
    if (_Rifle == 8) then{
        _primaryArray = [
            "rhs_weap_hk416d145"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
    };

    //9 - PDMR
    if (_Rifle == 9) then{
        _primaryArray = [
            "7r_weap_hk417_16in"
        ];
        _primaryAmmo = "20Rnd_762x51_Mag";
    };

    //10 - Breacher
    if (_Rifle == 10) then{
        _primaryArray = [
            "rhs_weap_hk416d10_smr_tan",
            "rhs_weap_hk416d10_smr_tan_kac",
            "rhs_weap_hk416d10_smr",
            "rhs_weap_hk416d10_smr_kac",
            "rhs_weap_hk416d10_smr",
            "rhs_weap_hk416d10_smr_kac"
        ];
        _primaryAmmo = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
    };

//Selects random weapon from determined array, runs
    _unit addWeapon selectRandom _primaryArray;

//Appends _attachmentArray1 array with a light source based on _Rifle
    if (_Rifle >= 1) then{
        _attachmentArray = [
            "UK3CB_BAF_LLM_IR_Black"
        ];
    };
    if (_Rifle == 7) then{
        _gripArray = [
            "rhs_acc_grip_ffg2",
            "rhsusf_acc_tdstubby_blk",
            "rhs_acc_grip_ffg2"
        ];
    };
    if (_Rifle == 1) then{
        _gripArray = [
            "rhs_acc_m4_smr_d",
            "rhs_acc_m4_smr_d_bcm"
        ];
    };
    if (_Rifle in [2,10]) then{
        _gripArray = [
            "rhs_acc_mk18_smr_d_bcm",
            "rhs_acc_mk18_smr_d"
        ];
    };
    if (_Rifle == 5) then{
        _gripArray = [
            "rhsusf_acc_kac_grip_saw_bipod",
            "rhsusf_acc_grip4_bipod"
        ];
    };
//Selects random weapon attachment from determined array if rifle critera met, runs
    if (_Rifle >= 1) then{
        _unit addPrimaryWeaponItem selectRandom _attachmentArray;
    };
    if ((_Rifle <= 5) or (_Rifle == 10) or (_Rifle == 7)) then{
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
        for "_i" from 1 to 3 do {_unit addItem _primaryAmmo;};
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
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_acc_omega9k";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
    _unit addItem "rhsusf_mag_17Rnd_9x19_JHP";