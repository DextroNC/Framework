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
_unit forceAddUniform "BWA3_Uniform_Ghillie_Fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addVest "BWA3_Vest_JPC_Leader_Fleck";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_12Rnd_45cal_usp";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_Kestrel4500";
_unit addItemToVest "ACE_RangeCard";
_unit addBackpack "B_AssaultPack_rgr";
_unit addItemToBackpack "ACE_Tripod";

comment "Add weapons";
_unit addWeapon "rhsusf_weap_MP7A2_grip3";
_unit addPrimaryWeaponItem "rhsusf_acc_rotex_mp7";
_unit addPrimaryWeaponItem "FHQ_acc_LLM01F";
_unit addPrimaryWeaponItem "rhs_acc_grip_ffg2";
_unit addWeapon "ACE_Vector";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_gemtech45";
_unit addHandgunItem "RH_X300";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "NVGoggles_OPFOR";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Spotter", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];