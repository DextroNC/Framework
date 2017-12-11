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
_unit forceAddUniform "VSM_Multicam_Crye_SS_tan_shirt_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
_unit addVest "milgp_v_marciras_medic_belt_RGR";
for "_i" from 1 to 5 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addBackpack "VSM_Multicam_Backpack_Kitbag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_MAK";};
_unit addItemToBackpack "SR_BloodIV_Pack";

_unit addHeadgear "milgp_h_opscore_06_goggles_RGR";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "SMA_Mk16QCB";
_unit addPrimaryWeaponItem "SMA_SFPEQ_SCARTOP_BLK";
_unit addWeapon "RH_g19t";
_unit addHandgunItem "RH_X300";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";


for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit setVariable ["ace_medical_medicClass",1,true];

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PM", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",2,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];