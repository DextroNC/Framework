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
_unit forceAddUniform "rhs_uniform_vdv_emr";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_18Rnd_9x19_gsh";};
_unit addVest "rhs_6b23_6sh92_radio";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addBackpack "UK3CB_BAF_B_Kitbag_OLI";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_ConstructionTool";
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "rhs_6b7_1m_bala2_olive";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_fullplum";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "RH_gsh18";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_no_tracers";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK_no_tracers";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];