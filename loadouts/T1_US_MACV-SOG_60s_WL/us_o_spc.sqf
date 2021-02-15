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
_unit forceAddUniform "usm_bdu_btisrl_tgrstp";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
_unit addVest "usm_vest_lbe_rm2";
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_an_m8hc";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_grenade_mkii_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_grenade_mkiiia1_mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "UK3CB_CHC_C_B_HIKER";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_Fortication_Material";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_grenade_m15_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_an_m14_th3";};
_unit addHeadgear "usm_headwrap_odg1";

comment "Add weapons";
_unit addWeapon "KA_Model_723";
_unit addWeapon "rhsusf_weap_m1911a1";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_red";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_red";};

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","SPC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];