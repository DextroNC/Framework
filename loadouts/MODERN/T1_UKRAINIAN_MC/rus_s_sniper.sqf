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
_unit forceAddUniform "UK3CB_CW_SOV_O_Late_U_CombatUniform_Ghillie_02_KLMK";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "V_BandollierB_oli";
for "_i" from 1 to 3 do {_unit addItemToVest "RH_17Rnd_9x19_g17";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "B_Kitbag_sgg";
_unit addItemToBackpack "rhsusf_acc_premier_anpvs27";

comment "Add weapons";
_unit addWeapon "rhs_weap_M107";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541";
_unit addWeapon "RH_g17";
_unit addHandgunItem "RH_gemtech9";
_unit addHandgunItem "RH_X300";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS"; 

for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_M33";};
for "_i" from 1 to 1 do {_unit addItemToVest "rhsusf_mag_10Rnd_STD_50BMG_mk211";};

_unit addItemToVest "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];