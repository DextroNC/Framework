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
_unit forceAddUniform "rhs_uniform_gorka_1_a";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "rhs_chicom_khk";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_nspd";};
_unit addBackpack "UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintRed";
_unit addHeadgear "H_Booniehat_khk";
_unit addGoggles "rhs_scarf";

comment "Add weapons";
_unit addWeapon "rhs_weap_akms";
_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addHandgunItem "rhs_acc_6p9_suppressor";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm_bakelite";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm_bakelite";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
    _unit linkItem "Y_Headlamp_01";
	_unit addHeadgear "rhs_ssh68_2";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
    
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",true,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];