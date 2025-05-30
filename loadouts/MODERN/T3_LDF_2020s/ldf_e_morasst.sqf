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
[_unit, 1] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest selectRandom ["JCA_V_CarrierRigKBT_01_command_EAF_F","JCA_V_CarrierRigKBT_01_CQB_EAF_F","JCA_V_CarrierRigKBT_01_combat_EAF_F","JCA_V_CarrierRigKBT_01_recon_EAF_F","JCA_V_CarrierRigKBT_01_compact_EAF_F"];
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};

comment "Add Backpack/Items";
    _unit addBackpack "B_Carryall_eaf_F";
    _unit addItem "7r_compact_drone";
    _unit addItem "ACE_UAVBattery";
    for "_i" from 1 to 8 do {_unit addItemToBackpack "UK3CB_BAF_1Rnd_60mm_Mo_Shells";};
    for "_i" from 1 to 6 do {_unit addItemToBackpack "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White";};
    _unit addItemToBackpack "ACE_EntrenchingTool";

comment "Add Drip";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 2] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

comment "Add Ammunition";

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "B_UavTerminal";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS14_WP", "USP_PVS14_WP_TAR"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EAH", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];