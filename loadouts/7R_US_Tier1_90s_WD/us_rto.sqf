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
_unit forceAddUniform "usm_bdu_w";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";

_unit addVest "usm_vest_rba_lbv_rm";
_for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 3 do {_unit addItemToVest "RH_12Rnd_45cal_usp";};

_unit addBackpack "usm_pack_st138_prc77_empty";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellOrange";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};

_unit addHeadgear "rhsusf_protech_helmet_rhino";
_unit addGoggles "rhsusf_oakley_goggles_clr";

comment "Add weapons";
_unit addWeapon "hlc_smg_mp5a2";
_unit addPrimaryWeaponItem "RH_tundra";
_unit addPrimaryWeaponItem "hlc_acc_Surefiregrip";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_gemtech45";
_unit addHandgunItem "RH_X300";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_9x21_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";


if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","RTO", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];