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
_unit forceAddUniform "VSM_OGA_Crye_od_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
_unit addVest "milgp_v_marciras_marksman_belt_mc";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_15Rnd_45cal_fnp";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "rhsusf_acc_ACOG_anpvs27";
_unit addBackpack "milgp_bp_hydration_mc";
_unit addItemToBackpack "VSM_Multicam_Boonie";
_unit addHeadgear "rhsusf_opscore_mc";
_unit addGoggles "LBG_Shemagh_OD";

comment "Add weapons";
_unit addWeapon "rhs_weap_sr25_ec";
_unit addPrimaryWeaponItem "RH_Saker762";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
_unit addPrimaryWeaponItem "RKSL_optic_PMII_312_sunshade";
_unit addPrimaryWeaponItem "RH_HBLM";
_unit addWeapon "RH_fnp45t";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "optic_MRD";
_unit addMagazine "Laserbatteries";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};

_unit addItemToVest "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];