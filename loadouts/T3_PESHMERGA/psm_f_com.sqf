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
_unit forceAddUniform "LOP_U_PESH_Fatigue_04_slv";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
_unit addVest "UK3CB_TKA_B_V_GA_LITE_BLK";
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_nspd";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addHeadgear "rhs_tsh4";
_unit addGoggles "G_Bandanna_oli";

comment "Add weapons";
_unit addWeapon "prpl_benelli_14_rail";
_unit addPrimaryWeaponItem "rhsusf_acc_mrds";
_unit addWeapon "RH_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 4 do {_unit addItemToVest "prpl_6Rnd_12Gauge_Pellets";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];