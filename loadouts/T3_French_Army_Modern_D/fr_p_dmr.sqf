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
_unit forceAddUniform "OFrP_Uniform_T4S2_UBAS_SE02_FRBV_1CLBV";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
for "_i" from 1 to 4 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addVest "OFrP_Vest_SMB_Marksman2_Kaki";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "SOG_BAG_tan";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "rhsusf_acc_anpvs27";
_unit addHeadgear "H_Booniehat_oli";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "AMF_RFF2_01_F";
_unit addPrimaryWeaponItem "RKSL_optic_PMII_312_sunshade";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "10Rnd_762x54_Mag";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "10Rnd_762x54_Mag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit addHeadgear "OFrP_Helmet_FELIN_TAN";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];