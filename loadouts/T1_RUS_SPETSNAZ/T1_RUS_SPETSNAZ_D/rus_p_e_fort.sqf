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
_unit forceAddUniform "rhs_uniform_gorka_r_y";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addVest "rhs_6b23_digi_6sh92_spetsnaz2";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_nspd";};
_unit addBackpack "B_Carryall_oli";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addItemToBackpack "ACE_ConstructionTool";
for "_i" from 1 to 4 do {_unit addItemToBackpack "APERSTripMine_Wire_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mine_tm62m_mag";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_Fortication_Material";};
_unit addItemToBackpack "rhs_beret_vdv2";
_unit addHeadgear "rhs_altyn_novisor_ess";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak104_zenitco01_b33";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addPrimaryWeaponItem "rhs_acc_perst3_2dp_h";
_unit addPrimaryWeaponItem "rhs_acc_grip_rk2";
_unit addWeapon "hgun_Rook40_F";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS";

for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm_polymer_89";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm_polymer_89";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];