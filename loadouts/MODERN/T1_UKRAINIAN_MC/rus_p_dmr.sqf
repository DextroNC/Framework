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
_unit forceAddUniform "LOP_U_UKR_Fatigue_Multicam";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
_unit addVest "milgp_v_marciras_marksman_belt_mc";
for "_i" from 1 to 4 do {_unit addItemToVest "RH_17Rnd_9x19_g17";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "milgp_bp_Tomahawk_mc";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "rhsusf_acc_premier_anpvs27";
_unit addItemToBackpack "Laserbatteries";
_unit addItemToBackpack "VSM_Multicam_Boonie";
_unit addHeadgear "milgp_h_opscore_05_MC";

comment "Add weapons";
_unit addWeapon "rhs_weap_sr25_ec";
_unit addPrimaryWeaponItem "RH_Saker762";
_unit addPrimaryWeaponItem "rhs_acc_perst3";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541_mrds";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
_unit addWeapon "RH_g17";
_unit addHandgunItem "RH_gemtech9";
_unit addHandgunItem "RH_X300";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];