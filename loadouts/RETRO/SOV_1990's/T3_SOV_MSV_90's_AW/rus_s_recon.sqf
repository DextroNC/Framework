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
for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "rhs_6b5_officer_spetsodezhda";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};

comment "Add weapons";
_unit addWeapon "rhs_weap_asval";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addHandgunItem "rhs_acc_6p9_suppressor";
_unit addHandgunItem "rhs_mag_9x18_8_57N181S";
_unit addWeapon "rhsusf_bino_leopold_mk4";
_unit addGoggles "rhs_scarf";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS"; 

for "_i" from 1 to 14 do {_unit addItemToVest "rhs_20rnd_9x39mm_SP6";};

_unit addItemToVest "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",0.9];
	_unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","Recon", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];