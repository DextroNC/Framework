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
_unit forceAddUniform "UK3CB_TKA_B_U_CombatUniform_Ghillie_DES_MARPAT";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 3 do {_unit addItemToVest "RH_15Rnd_9x19_SIG";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_Kestrel4500";
_unit addItemToVest "ACE_RangeCard";
_unit addBackpack "B_Kitbag_sgg";
_unit addItemToBackpack "ACE_Tripod";

comment "Add weapons";
_unit addWeapon "hlc_rifle_PSG1A1_RIS";
_unit addPrimaryWeaponItem "rhs_acc_dh520x56";
_unit addPrimaryWeaponItem "rhs_acc_harris_swivel";
_unit addWeapon "ACE_Vector";
_unit addWeapon "RH_p226";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Spotter", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];