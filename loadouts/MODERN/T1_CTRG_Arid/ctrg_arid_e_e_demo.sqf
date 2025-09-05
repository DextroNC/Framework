_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Jem";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_Black_F";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
_unit addWeapon "RH_fnp45";
_unit addHandgunItem "RH_X300";
_unit addHandgunItem "RH_15Rnd_45cal_fnp";

comment "Add containers";
_unit forceAddUniform "U_B_CTRG_2";
_unit addVest "milgp_v_marciras_assaulter_belt_b";
_unit addBackpack "B_Kitbag_rgr";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_45cal_fnp";};
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "H_HelmetSpecB_snakeskin";
_unit addGoggles "G_Combat";
_unit addItemToBackpack "SR_PAK";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 1 do {_unit addItemToBackpack "rhsusf_m112x4_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_m112_mag";};

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "A3_GPNVG18_F";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];