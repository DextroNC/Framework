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
[_unit, 2] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest selectRandomWeighted [
		"rhs_6b3_AK",1,
		"rhs_6b3_AK_2",1,
		"rhs_6b3_AK_3",1];
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_plamyam";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};

comment "Add Backpack/Items";
    _unit addBackpack "UK3CB_B_Bedroll_Backpack_KHK";
    _unit addItemToBackpack "ACE_RangeCard";

comment "Add Drip";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 8] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";
    _unit addPrimaryWeaponItem "rhs_acc_pso1m2";
    _unit addPrimaryWeaponItem "rhsusf_acc_grip1";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "rhsusf_ANPVS_14";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","SDMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];