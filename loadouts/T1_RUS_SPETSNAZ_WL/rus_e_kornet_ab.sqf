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
_unit forceAddUniform "LOP_U_IRA_Fatigue_GRK_OLV";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_18Rnd_9x19_gsh";};
_unit addVest "rhs_6b23_digi_6sh92_Spetsnaz";
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "RHS_Kornet_Tripod_Bag";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
_unit addHeadgear "rhs_beanie_green";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_zenitco01_b33_grip1";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Black";
_unit addPrimaryWeaponItem "rhs_acc_grip_rk2";
_unit addWeapon "RH_gsh18";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS";

for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_30Rnd_545x39_7N22_AK";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
	_unit addHeadgear "rhs_altyn_novisor_ess";
};
_unit setVariable ["SR_Class","EH", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];