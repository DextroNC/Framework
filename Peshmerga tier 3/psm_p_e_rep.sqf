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
_unit forceAddUniform "LOP_U_PESH_Fatigue_04_slv";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
_unit addVest "LOP_V_6B23_6Sh92_M81_OLV";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
_unit addBackpack "B_Carryall_oli";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "rhs_6b7_1m";

comment "Add weapons";
_unit addWeapon "rhs_weap_l1a1";
_unit addWeapon "RH_m9";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_20Rnd_762x51_m80_fnfal";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",2, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
