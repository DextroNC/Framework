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
_unit forceAddUniform "PBW_Uniform1H_fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
_unit addVest "pbw_splitter_grpfhr";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "BWA3_AssaultPack_Fleck";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "optic_NVS";
_unit addHeadgear "BWA3_Booniehat_Fleck";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "hlc_rifle_g3sg1ris";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO";
_unit addWeapon "RH_usp";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 7 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addHeadgear "PBW_Helm2_fleck";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];