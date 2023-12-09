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
[_unit, 3] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

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
    _unit addVest "JCA_MCRP_V_CarrierRigKBT_01_heavy_tropic_F";
    for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};

comment "Add Backpack/Items";
    _unit addBackpack "B_Carryall_oli";
    _unit addItemToBackpack "ACE_Clacker";
    _unit addItemToBackpack "ACE_EntrenchingTool";
    _unit addItemToBackpack "ACE_DefusalKit";
    _unit addItemToBackpack "MineDetector";
    _unit addItemToBackpack "ACE_EntrenchingTool";
    _unit addItemToBackpack "ACE_SpraypaintRed";
    _unit addItemToBackpack "ACE_SpraypaintGreen";
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_m112_mag";};

comment "Add Drip";
    _unit addHeadgear "H_HelmetB_Enh_tna_F";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 4] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

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
    _unit linkItem "ACE_NVG_Gen4_Green_WP";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",true,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];