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
_unit forceAddUniform "rhs_uniform_cu_ocp_1stcav";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addVest "rhsusf_spcs_ocp_rifleman_alt";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 8 do {_unit addItemToVest "prpl_6Rnd_12Gauge_Pellets";};
for "_i" from 1 to 8 do {_unit addItemToVest "prpl_6Rnd_12Gauge_Slug";};
_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "RH_SFM952V";
_unit addItemToBackpack "prpl_benelli_14_rail";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
_unit addHeadgear "rhsusf_ach_helmet_ESS_ocp";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4a1_mstock_grip2";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a_top";
_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
    _unit addItemToBackpack "ACE_IR_Strobe_Item";
	_unit addHeadgear "rhsusf_ach_helmet_ocp_norotos";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","B", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];