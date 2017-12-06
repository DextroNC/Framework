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
_unit forceAddUniform "usm_bdu_w";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

_unit addVest "usm_vest_pasgt_lbe_rm";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 2 do {_unit addItemToVest "RH_15Rnd_9x19_M9";};

_unit addHeadgear "usm_helmet_pasgt_w";

comment "Add weapons";
_unit addWeapon "gst_m16a2_2";
_unit addWeapon "RH_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";


if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","LAT", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];