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
_unit forceAddUniform "VSM_AOR1_Crye_SS_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};

_unit addVest "milgp_v_mmac_hgunner_belt_CB";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};

_unit addBackpack "milgp_bp_Pointman_cb";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "rhsusf_mich_bare_norotos_arc_alt_tan";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "hlc_lmg_mk46";
_unit addPrimaryWeaponItem "FHQ_acc_LLM01L";
_unit addWeapon "RH_kimber_nw";
_unit addHandgunItem "RH_X300";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 4 do {_unit addItemToVest "rhs_200rnd_556x45_M_SAW";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
for "_i" from 1 to 1 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","AR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];