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
_unit forceAddUniform "BWA3_Uniform2_Tropen";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "BWA3_DM25";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
_unit addVest "BWA3_Vest_JPC_Rifleman_Tropen";
for "_i" from 1 to 4 do {_unit addItemToVest "BWA3_DM25";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "BWA3_Carryall_Tropen";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "UK3CB_BAF_1Rnd_60mm_Mo_Shells";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White";};
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addBackpack "ACE_EntrenchingTool";
_unit addHeadgear "BWA3_CrewmanKSK_Tropen_Headset";
_unit addGoggles "shemagh_loosetan";

comment "Add weapons";
_unit addWeapon "rhs_weap_hk416d10_LMT_d";
_unit addPrimaryWeaponItem "RH_qdss_nt4_des";
_unit addPrimaryWeaponItem "BWA3_acc_VarioRay_irlaser";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_gemtech45";
_unit addHandgunItem "RH_X300";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "A3_GPNVG18_BLK_F";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EAH", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];