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
    _unit addVest "V_PlateCarrier1_wdl";
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
    _unit addItemToVest "SmokeShell";
    _unit addItemToVest "SmokeShellRed";

comment "Add Backpack/Items";
    _unit addBackpack "7r_backpanel_odg";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "uk3cb_baf_maxikite";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "srifle_GM6_F";
    _unit addPrimaryWeaponItem "rhsusf_acc_premier_low";

comment "Add Secondary/Attachments";
    _unit addWeapon "hgun_P07_khk_F";
    _unit addHandgunItem "muzzle_snds_L";
    _unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";
    for "_i" from 1 to 4 do {_unit addItemToVest "16Rnd_9x21_Mag";};
    for "_i" from 1 to 4 do {_unit addItem "5Rnd_127x108_Mag";};
    for "_i" from 1 to 2 do {_unit addItem "5Rnd_127x108_APDS_Mag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "ACE_NVG_Gen4_Green_WP";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];