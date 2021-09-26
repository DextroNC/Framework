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
_unit forceAddUniform "BWA3_Uniform2_Ghillie_Fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_12Rnd_45cal_usp";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "BWA3_optic_NSA80";
_unit addBackpack "B_UAV_01_backpack_F";

comment "Add weapons";
_unit addWeapon "BWA3_G36KA4_green";
_unit addPrimaryWeaponItem "BWA3_muzzle_snds_Rotex_IIIC_green";
_unit addPrimaryWeaponItem "BWA3_acc_LLM01_irlaser_green";
_unit addPrimaryWeaponItem "BWA3_bipod_Harris_green";
_unit addWeapon "rhsusf_bino_leopold_mk4";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "RH_aacusp";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "B_UavTerminal";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Recon", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];