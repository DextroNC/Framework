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
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};


comment "Add Vest/Items";
_unit addVest "rhs_lifchik";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    _unit addItemToVest "rhs_mag_rdg2_white";
    _unit addItemToVest "rhs_mag_nspn_red";

comment "Add Backpack/Items";
    _unit addBackpack "UK3CB_KDF_B_B_Sidor_RIF_OLI";
    _unit addItemToBackpack "ACE_Kestrel4500";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "ACE_Tripod";
    _unit addItemToBackpack "ACRE_PRC117F";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_aks74n_2";
    _unit addPrimaryWeaponItem "rhs_acc_dtk4short";
    _unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
    _unit addPrimaryWeaponItem "rhs_acc_pso1m21";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhs_weap_tt33";
    _unit addHandgunItem "rhs_mag_762x25_8";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_VectorDay";

comment "Add Ammunition";
    for "_i" from 1 to 3 do {_unit addItem "rhs_mag_762x25_8";};
    for "_i" from 1 to 12 do {_unit addItem "rhs_30Rnd_545x39_7N6_AK";};

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