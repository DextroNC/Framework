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
_unit forceAddUniform "rhs_uniform_flora";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_18Rnd_9x19_gsh";};
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "rhs_6b23_6sh92_vog_headset";
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_nspd";};
_unit addBackpack "rhs_rd54_vest_flora2";
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Red";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Green";};
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addItemToBackpack "rhs_fieldcap";
_unit addHeadgear "rhs_6b27m_ess";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_fullplum_gp25";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "RH_gsh18";
_unit addWeapon "rhs_pdu4";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N22_AK";};

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
    _unit linkItem "Y_Headlamp_01";
	_unit addHeadgear "rhs_6b27m_bala";
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
