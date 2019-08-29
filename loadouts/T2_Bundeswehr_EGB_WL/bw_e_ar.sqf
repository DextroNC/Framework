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
_unit forceAddUniform "BWA3_Uniform2_sleeves_Fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "BWA3_DM25";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "BWA3_15Rnd_9x19_P8";};
_unit addVest "BWA3_Vest_Rifleman_Fleck";
for "_i" from 1 to 3 do {_unit addItemToVest "BWA3_DM25";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "BWA3_AssaultPack_Fleck";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "PBW_Helm2_fleck";
_unit addGoggles "shemagh_goggclr_tan";

comment "Add weapons";
_unit addWeapon "BWA3_MG4";
_unit addPrimaryWeaponItem "BWA3_acc_VarioRay_irlaser";
_unit addPrimaryWeaponItem "BWA3_optic_ZO4x30_brown";
_unit addWeapon "BWA3_P8";
_unit addHandgunItem "BWA3_acc_LLM01_irlaser";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 3 do {_unit addItemToVest "rhs_200rnd_556x45_M_SAW";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EAR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];