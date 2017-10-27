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
_unit forceAddUniform "VSM_M81_Crye_SS_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};

_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 5 do {_unit addItemToVest "prpl_6Rnd_12Gauge_Pellets";};

_unit addBackpack "fatpack_coy";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "RH_SFM952V";
_unit addItemToBackpack "prpl_benelli_14_rail";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "prpl_6Rnd_12Gauge_Pellets";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "prpl_6Rnd_12Gauge_Slug";};
_unit addHeadgear "rhsusf_opscore_paint_pelt";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "rhs_weap_mk18_grip2_KAC";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_light";
_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
_unit addWeapon "RH_kimber_nw";
_unit addHandgunItem "RH_X300";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","BR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];