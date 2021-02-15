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
_unit forceAddUniform "rhs_uniform_emr_des_patchless";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
_unit addVest "rhs_6b13_EMR_6sh92_radio";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_plamyam";};
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_9x19mm_7n21_44";};
_unit addBackpack "rhs_assault_umbts";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
_unit addHeadgear "rhs_6b7_1m_emr_ess";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m";
_unit addWeapon "rhs_weap_pp2000_folded";
_unit addHandgunItem "rhsusf_acc_mrds";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N22_AK";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
    _unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","B", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];