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
[_unit, 4] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_CDF_90s_2000s\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "rhs_lifchik";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    _unit addItemToVest "rhs_mag_rdg2_white";
    _unit addItemToVest "rhs_mag_nspn_red";

comment "Add Backpack/Items";
    _unit addBackpack "B_Kitbag_invisible";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "rhs_acc_1pn93_2";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "UK3CB_SVD_OLD_NPZ";
    _unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
    _unit addPrimaryWeaponItem "rhs_acc_tgpv";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhs_weap_tt33";
    _unit addHandgunItem "rhs_mag_762x25_8";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";
    for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_762x25_8";};
    for "_i" from 1 to 3 do {_unit addItem "rhs_20rnd_9x39mm_SP6";};
    for "_i" from 1 to 10 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];