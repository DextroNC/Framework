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
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "V_Chestrig_rgr";
for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "B_UAV_01_backpack_F";

comment "Add weapons";
_unit addWeapon "rhs_weap_mk18_KAC_wd";
_unit addPrimaryWeaponItem "RH_qdss_nt4_wdl";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addPrimaryWeaponItem "rhsusf_acc_grip2_wd";
_unit addPrimaryWeaponItem "rhsusf_acc_su230a_mrds";
_unit addWeapon "ACE_MX2A";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "muzzle_snds_acp";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "B_UavTerminal";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Recon", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];