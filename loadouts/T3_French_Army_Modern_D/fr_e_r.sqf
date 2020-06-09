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
_unit forceAddUniform "OFrP_Uniform_T4S2_UBAS_SE02_FRBV_1CLBV";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addVest "OFrP_Vest_SMB_Rifleman_Kaki";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "KIT_BAG_pince_TAN";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_Fortication_Material";};
_unit addHeadgear "OFrP_Helmet_TC3000_cover_DA";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "SPS_hk416_14_5_vfg_black_f";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_Flashlight_Black";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","ER", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];