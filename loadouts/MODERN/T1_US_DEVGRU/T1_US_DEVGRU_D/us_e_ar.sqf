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
_unit forceAddUniform "VSM_AOR1_Crye_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
_unit addVest "milgp_v_mmac_hgunner_KHK";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "VSM_AOR1_Backpack_Compact";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "rhsusf_opscore_aor1";
_unit addGoggles "shemagh_loosetanCG";

comment "Add weapons";
_unit addWeapon "rhs_weap_m249_light_S";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a_light";
_unit addPrimaryWeaponItem "rhsusf_acc_grip4_bipod";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN_ard";
_unit addWeapon "RH_kimber";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "RH_osprey";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
_unit linkItem "A3_GPNVG18_F";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EAR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
