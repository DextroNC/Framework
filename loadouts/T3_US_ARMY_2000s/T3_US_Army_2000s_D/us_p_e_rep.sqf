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
_unit forceAddUniform "usm_bdu_btisrl_dcu";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addVest "usm_vest_pasgt_lbe_rm2";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
_unit addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "usm_helmet_pasgt_rms_dcu";
_unit addItemToBackpack "usm_bdu_8point_dcu";

comment "Add weapons";
_unit addWeapon "rhs_weap_m14_ris_d";
_unit addPrimaryWeaponItem "rhsusf_acc_M952V";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
	_unit addHeadgear "usm_helmet_pasgt_rm_dcu"; 
	_unit linkItem "UK3CB_ANPVS7";
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",2, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
