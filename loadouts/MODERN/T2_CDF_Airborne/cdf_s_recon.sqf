_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Arsenal Gameplay by Roy, Ionaru";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// 1 - Echo | 2 - Squad | 3 - Platoon | 4 - Sierra
[_unit, 4] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};


comment "Add Vest/Items";
_unit addVest "milgp_v_jpc_Marksman_rgr";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    _unit addItemToVest "rhs_mag_rdg2_white";
    _unit addItemToVest "rhs_mag_nspn_red";

comment "Add Backpack/Items";
    _unit addBackpack "B_UAV_01_backpack_F";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_ak105_zenitco01_b33";
    _unit addPrimaryWeaponItem "rhsusf_acc_grip1";
    _unit addPrimaryWeaponItem "rhs_acc_tgpa";
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a_blk";
    _unit addPrimaryWeaponItem "rhsusf_acc_acog3_usmc";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_FMJ";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_MX2A";

comment "Add Ammunition";
    for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";};
    for "_i" from 1 to 12 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";
    _unit linkItem "B_UavTerminal";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS31_WP_BLK", "USP_PVS31_WP_TAN","USP_PVS31_WP_HIGH_BLK","USP_PVS31_WP_HIGH_TAN","USP_PVS31_WP_MID_BLK","USP_PVS31_WP_MID_TAN","USP_PVS31_WP_TAR_BLK", "USP_PVS31_WP_TAR_TAN","USP_PVS31_WP_TAR_HIGH_BLK","USP_PVS31_WP_TAR_HIGH_TAN","USP_PVS31_WP_TAR_MID_BLK","USP_PVS31_WP_TAR_MID_TAN","USP_PVS31_WP_BLK2", "USP_PVS31_WP_TAN2", "USP_PVS31_WP_HIGH_BLK2", "USP_PVS31_WP_HIGH_TAN2", "USP_PVS31_WP_MID_BLK2", "USP_PVS31_WP_MID_TAN2", "USP_PVS31_WP_TAR_BLK2", "USP_PVS31_WP_TAR_TAN2", "USP_PVS31_WP_TAR_HIGH_BLK2", "USP_PVS31_WP_TAR_HIGH_TAN_BLK2", "USP_PVS31_WP_TAR_MID_BLK2", "USP_PVS31_WP_TAR_MID_TAN2"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];