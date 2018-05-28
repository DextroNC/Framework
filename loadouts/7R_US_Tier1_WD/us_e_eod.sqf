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
_unit forceAddUniform "VSM_MulticamTropic_Crye_SS_od_shirt_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_45cal_fnp";};
_unit addVest "milgp_v_mmac_marksman_belt_rgr";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
_unit addBackpack "VSM_MulticamTropic_Backpack_Kitbag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SatchelCharge_Remote_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "milgp_h_cap_03_goggles_CB";
_unit addGoggles "shemagh_looseodCG";

comment "Add weapons";
_unit addWeapon "rhs_weap_hk416d145_wd";
_unit addPrimaryWeaponItem "RH_qdss_nt4_tg";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_h";
_unit addWeapon "RH_fnp45t";
_unit addHandgunItem "RH_gemtech45";
_unit addHandgunItem "RH_X300";
_unit addHandgunItem "RH_docter";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit addHeadgear "H_HelmetB_light_black";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",2, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];