_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Dextro";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "PBW_Uniform4_fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_18Rnd_9x19_VP";};
_unit addVest "pbw_splitter_grpfhr";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "BWA3_Carryall_Fleck";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "SmokeShellRed";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "ACE_ConstructionTool";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "PBW_Helm2_fleck_H";

comment "Add weapons";
_unit addWeapon "hlc_rifle_G36KA1";
_unit addPrimaryWeaponItem "HLC_Optic_G36Dualoptic15x";
_unit addWeapon "RH_vp70";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];