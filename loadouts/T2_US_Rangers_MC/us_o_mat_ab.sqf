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
_unit forceAddUniform "VSM_Multicam_Crye_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
_unit addVest "milgp_v_mmac_assaulter_belt_RGR";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "VSM_Multicam_Backpack_Kitbag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "MRAWS_HEAT_F";
for "_i" from 1 to 2 do {_unit addItemToBackpack "MRAWS_HE_F";};
_unit addHeadgear "VSM_Mich2000_CamoSprayOD";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "SMA_MK16";
_unit addPrimaryWeaponItem "SMA_SFPEQ_SCARTOP_BLK";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","MATAB", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];