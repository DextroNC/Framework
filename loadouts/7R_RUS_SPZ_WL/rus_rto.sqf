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
_unit forceAddUniform "rhs_uniform_gorka_r_g";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "rhs_6b23_digi_6sh92_headset_spetsnaz";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "tf_mr3000_rhs";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellOrange";};
_unit addHeadgear "rhs_6b7_1m_bala2_flora";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak105_zenitco01_b33_grip1";
_unit addPrimaryWeaponItem "rhs_acc_pgs64";
_unit addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
_unit addPrimaryWeaponItem "rhs_acc_grip_ffg2";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_no_tracers";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK_no_tracers";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","RTO", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];