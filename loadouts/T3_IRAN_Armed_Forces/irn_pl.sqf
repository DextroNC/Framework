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
_unit forceAddUniform "LOP_U_IRAN_M93_basij_01";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_SIG";};
_unit addVest "UK3CB_TKP_I_V_6Sh92_Radio_Khk";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_nspd";};
for "_i" from 1 to 1 do {_unit addItemToVest "rhs_mag_nspd";};
_unit addBackpack "B_FieldPack_cbr";
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Red";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Green";};
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "UK3CB_ANA_B_H_Beret_GRN";

comment "Add weapons";
_unit addWeapon "rhs_weap_akm_gp25";
_unit addWeapon "RH_p226";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_white";
	_unit addItemToBackpack "rhs_VG40OP_red";
	_unit addItemToBackpack "rhs_VG40OP_red";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];