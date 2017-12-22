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
_unit forceAddUniform "AOR2_Camo_Cyre_GS";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_45cal_fnp";};

_unit addVest "milgp_v_mmac_assaulter_belt_rgr";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};

_unit addBackpack "tf_rt1523g_bwmod";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellOrange";};

_unit addHeadgear "AOR2_Cap";
_unit addGoggles "shemagh_looseodCG";

comment "Add weapons";
_unit addWeapon "rhsusf_weap_MP7A2_desert_grip3";
_unit addPrimaryWeaponItem "rhsusf_acc_rotex_mp7";
_unit addPrimaryWeaponItem "FHQ_acc_LLM01L";
_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
_unit addWeapon "RH_fnp45";
_unit addHandgunItem "RH_gemtech45";
_unit addHandgunItem "RH_X300";
_unit addHandgunItem "RH_docter";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};
for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};


_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit addHeadgear "H_HelmetB_light_black";
	_unit addGoggles "shemagh_goggclr_tan";
	_unit addItemToBackpack "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","RTO", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
