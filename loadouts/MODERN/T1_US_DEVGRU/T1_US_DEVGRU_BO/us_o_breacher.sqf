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
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiRed";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "dr_Blklbt_op";
    for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
    for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};

comment "Add Backpack/Items";
    _unit addBackpack "Black_Backpack_Kitbag";
    for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_8Rnd_00Buck";};
    for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_8Rnd_Slug";};
    for "_i" from 1 to 2 do {_unit addItemToVest "tsp_stickCharge_auto_mag";};
    _unit addItemToVest "tsp_frameCharge_mag";
    _unit addItemToVest "ACE_Clacker";

comment "Add Drip";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 10] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";
    _unit addItem "rhs_weap_M590_8RD";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "rhsusf_ANPVS_15";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","B", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];