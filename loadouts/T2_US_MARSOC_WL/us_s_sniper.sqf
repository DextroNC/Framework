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
_unit forceAddUniform "U_B_FullGhillie_sard";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addVest "V_Chestrig_rgr";
for "_i" from 1 to 6 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_RangeCard";
_unit addItemToVest "Laserbatteries";
_unit addItemToVest "optic_NVS";

comment "Add weapons";
_unit addWeapon "rhs_weap_m40a5_wd";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541_low_wd";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
_unit addWeapon "UK3CB_BAF_Soflam_UK3CB_BAF_Soflam_Laserdesignator";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_5Rnd_762x51_AICS_m118_special_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_5Rnd_762x51_AICS_m993_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];