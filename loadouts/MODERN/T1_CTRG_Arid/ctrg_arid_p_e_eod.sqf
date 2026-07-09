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
_unit addWeapon "srifle_EBR_F";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
_unit addWeapon "RH_fnp45";
_unit addHandgunItem "RH_X300";
_unit addHandgunItem "RH_15Rnd_45cal_fnp";

comment "Add containers";
_unit forceAddUniform "U_B_CTRG_3";
_unit addVest "milgp_v_marciras_assaulter_belt_b";
_unit addBackpack "B_Kitbag_rgr";

comment "Add binoculars";
_unit addWeapon "ACE_Vector";

comment "Add items to containers";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_45cal_fnp";};
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "H_HelmetSpecB_snakeskin";
_unit addGoggles "G_Combat";
_unit addItemToBackpack "SR_PAK";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintRed";
_unit addItemToBackpack "ACE_SpraypaintGreen";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_m112_mag";};
_unit addItemToBackpack "ACRE_PRC152";

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
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",true,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];