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
_unit forceAddUniform "rhsgref_uniform_ttsko_forest";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_18rnd_9x21mm_7N28";};
_unit addVest "rhs_6b23_digi_6sh92_spetsnaz";
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "B_AssaultPack_sgg";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "Vorona_HEAT";
_unit addHeadgear "rhs_6b7_1m_bala2_flora";

comment "Add weapons";
_unit addWeapon "rhs_weap_aks74un";
_unit addPrimaryWeaponItem "rhs_acc_pgs64_74un";
_unit addWeapon "rhs_weap_6p53";
_unit addWeapon "launch_O_Vorona_green_F";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_plum_AK";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N6M_plum_AK";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EH", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];