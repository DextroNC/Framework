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
_unit forceAddUniform "BWA3_Uniform3_idz_Fleck";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
_unit addVest "UK3CB_BAF_V_Osprey_Marksman_A";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "UK3CB_BAF_Kite";
_unit addHeadgear "UK3CB_BAF_H_Boonie_MTP_PRR";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L129A1_FGrip";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO";
_unit addPrimaryWeaponItem "RH_HBLM";
_unit addWeapon "RH_usp";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Scrim_A";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];