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
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiRed";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "VSM_RAV_operator_OGA_OD";
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
    _unit addItemToVest "SmokeShell";
    _unit addItemToVest "SmokeShellRed";

comment "Add Backpack/Items";
    _unit addBackpack "milgp_bp_Tomahawk_rgr";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "uk3cb_baf_maxikite";

comment "Add Drip";
    _unit addGoggles "VSM_Shemagh_Tan";

comment "Add Primary/Attachments";
    _unit addWeapon "UK3CB_BAF_L115A3";
    _unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
    _unit addPrimaryWeaponItem "uk3cb_underbarrel_acc_bipod";

comment "Add Secondary/Attachments";
    _unit addWeapon "UK3CB_BAF_L105A1";
    _unit addHandgunItem "UK3CB_BAF_9_13Rnd";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";
    for "_i" from 1 to 4 do {_unit addItemToUniform "UK3CB_BAF_9_13Rnd";};
    for "_i" from 1 to 10 do {_unit addItemToVest "UK3CB_BAF_338_5Rnd";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    

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