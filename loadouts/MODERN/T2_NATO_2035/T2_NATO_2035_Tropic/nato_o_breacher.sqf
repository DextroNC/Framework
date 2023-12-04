
comment "Exported from Arsenal by Jem";

_unit = (_this select 1);
if( !local _unit ) exitWith {};

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
_unit addWeapon "arifle_MXC_khk_F";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addWeapon "hgun_P07_khk_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_T_Soldier_F";
_unit addVest "JCA_MCRP_V_CarrierRigKBT_01_cqb_tropic_F";
_unit addBackpack "B_AssaultPack_tna_F";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_65x39_caseless_khaki_mag";};
_unit addItemToVest "16Rnd_9x21_Mag";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
_unit addHeadgear "H_HelmetB_Enh_tna_F";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "ACE_NVG_Gen4_Green_WP";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","LAT", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];