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
_unit forceAddUniform "UK3CB_CHD_B_U_CombatSmock_10";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "rhs_6b13_6sh92_vog";
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_nspd";};
_unit addBackpack "rhs_sidor";
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Red";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Green";};
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "rhs_headband";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_fullplum_gp25";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addHandgunItem "rhs_acc_6p9_suppressor";
_unit addWeapon "rhs_pdu4";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_plum_AK";};

_unit addItemToBackpack "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

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
	_unit addHeadgear "rhs_stsh81_butan";
	_unit addItemToBackpack "rhs_headband";
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];