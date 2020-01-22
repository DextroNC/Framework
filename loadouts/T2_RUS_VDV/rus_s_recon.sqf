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
_unit forceAddUniform "UK3CB_CW_SOV_O_Late_U_CombatUniform_Ghillie_01_KLMK";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "UK3CB_B_Bedroll_Backpack";

comment "Add weapons";
_unit addWeapon "rhs_weap_asval_grip_npz";
_unit addPrimaryWeaponItem "rhs_acc_tgpa";
_unit addWeapon "rhsusf_bino_leopold_mk4";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addSecondaryWeaponItem "rhs_acc_6p9_suppressor";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS"; 

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_20rnd_9x39mm_SP5";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_20rnd_9x39mm_SP5";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "UK3CB_ANPVS7";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Recon", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];