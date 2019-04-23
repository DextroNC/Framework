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
_unit forceAddUniform "VSM_Multicam_Crye_SS_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
_unit addVest "milgp_v_mmac_marksman_belt_RGR";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
_unit addBackpack "VSM_Multicam_Backpack_Kitbag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addHeadgear "milgp_h_opscore_03_goggles_RGR_hexagon";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "SMA_Mk17";
_unit addPrimaryWeaponItem "SMA_SFPEQ_SCARTOP_BLK";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "20Rnd_762x51_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",2, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];