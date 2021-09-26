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
_unit addVest "milgp_v_marciras_assaulter_belt_mc";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_17Rnd_9x19_g17";};
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "VSM_Multicam_Backpack_Kitbag";
for "_i" from 1 to 8 do {_unit addItemToBackpack "UK3CB_BAF_1Rnd_60mm_Mo_Shells";};
_unit addHeadgear "milgp_h_opscore_04_MC";
_unit addGoggles "PBW_Balaclava_beigeR";
_unit linkItem "rhsusf_Rhino";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_zenitco01_grip1";
_unit addPrimaryWeaponItem "rhs_acc_uuk";
_unit addPrimaryWeaponItem "rhs_acc_perst3_2dp_light_h";
_unit addPrimaryWeaponItem "rhs_acc_grip_ffg2";
_unit addWeapon "UK3CB_BAF_M6";
_unit addWeapon "RH_g17";
_unit addHandgunItem "RH_gemtech9";
_unit addHandgunItem "RH_X300";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_plum_AK";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EH", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];