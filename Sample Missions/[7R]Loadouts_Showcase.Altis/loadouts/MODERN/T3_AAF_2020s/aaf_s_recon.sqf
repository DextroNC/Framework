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
[_unit, 4] call compile preprocessFileLineNumbers "loadouts\MODERN\T3_AAF_2020s\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};


comment "Add Vest/Items";
_unit addVest "V_SmershVest_01_F";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    _unit addItemToVest "rhs_mag_an_m8hc";
    _unit addItemToVest "rhs_mag_m18_red";

comment "Add Backpack/Items";
    _unit addBackpack "B_UAV_01_backpack_F";

comment "Add Drip";
    _unit addGoggles "shemagh_loosetan";

comment "Add Primary/Attachments";
    _unit addWeapon "UK3CB_G36_TAC";
    _unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
    _unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";

comment "Add Secondary/Attachments";
    _unit addWeapon "hgun_ACPC2_F";
    _unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_MX2A";

comment "Add Ammunition";
    for "_i" from 1 to 3 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
    for "_i" from 1 to 12 do {_unit addItemToVest "rhssaf_30rnd_556x45_EPR_G36";};

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
    _unit linkItem "UK3CB_BAF_HMNVS";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];