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
_unit forceAddUniform "rhs_uniform_vdv_emr";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_18Rnd_9x19_gsh";};
_unit addVest "rhs_6b23_digi_vydra_3m";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addBackpack "B_FieldPack_oli";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "rhs_6b7_1m_emr_ess_bala";

comment "Add weapons";
_unit addWeapon "hlc_rifle_rpk74n";
_unit addWeapon "RH_gsh18";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 5 do {_unit addItemToVest "SR_60Rnd_545x39_rpk";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "SR_60Rnd_545x39_rpk";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","AR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];