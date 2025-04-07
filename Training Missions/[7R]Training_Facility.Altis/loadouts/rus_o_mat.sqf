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
_unit forceAddUniform "7r_bdu_srl_ttsko_d";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "7r_ttsko_d_modvest_compact";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "rhs_rpg_2";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
for "_i" from 1 to 1 do {_unit addItemToBackpack "rhs_rpg7_PG7VR_mag";};
_unit addHeadgear "7r_ttsko_d_wz2005_headset_ess";
_unit addGoggles "7r_scrim_arid";

comment "Add weapons";
_unit addWeapon "rhs_weap_aks74n_2";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "rhs_weap_rpg7";
_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_plum_AK";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N6M_plum_AK";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","MAT", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];