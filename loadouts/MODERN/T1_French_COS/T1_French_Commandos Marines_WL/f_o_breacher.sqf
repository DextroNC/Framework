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
_unit forceAddUniform "unif_SWEAT_ce_aloha_L";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
_unit addVest "JPC_3_OD";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "KIT_BAG_pince_OD";
_unit addItemToBackpack "prpl_benelli_rail";
_unit addItemToBackpack "rhsusf_acc_anpeq15_bk_light";
for "_i" from 1 to 6 do {_unit addItemToVest "prpl_8Rnd_12Gauge_Pellets";};
for "_i" from 1 to 6 do {_unit addItemToVest "prpl_8Rnd_12Gauge_Slug";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addHeadgear "Mich2001_ess_OD";
_unit addGoggles "milgp_f_face_shield_tactical_shemagh_RGR";

comment "Add weapons";
_unit addWeapon "SPS_hk416_11_afg_black_f";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "RH_aacusp";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","B", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];