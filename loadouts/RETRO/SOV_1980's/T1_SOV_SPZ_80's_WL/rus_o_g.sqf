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
_unit forceAddUniform "UK3CB_CW_SOV_O_Late_U_VDV_Spetsnaz_Uniform_Gorka_02_KLMK";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "rhs_lifchik_vog";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
_unit addBackpack "UK3CB_UN_B_B_ASS";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_GRD40_White";};
_unit addHeadgear "H_Booniehat_khk";
_unit addGoggles "G_Bandanna_oli";

comment "Add weapons";
_unit addWeapon "rhs_weap_akms_gp25";
_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addHandgunItem "rhs_acc_6p9_suppressor";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_762x39mm_bakelite";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm_bakelite";};


if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_red";
	_unit addItemToBackpack "rhs_VG40OP_red";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
    _unit linkItem "Y_Headlamp_01";
	_unit addHeadgear "rhs_ssh68_2";
};
_unit setVariable ["SR_Class","G", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];