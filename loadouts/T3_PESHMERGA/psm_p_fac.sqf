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
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "LOP_V_6B23_CrewOfficer_M81";
_unit addItemToVest "SmokeShell";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
_unit addBackpack "UK3CB_BAF_B_Bergen_OLI_JTAC_A";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "rhs_6b7_1m";


comment "Add weapons";
_unit addWeapon "UK3CB_M16A2";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 7 do {_unit addItemTobackpack "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","FAC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];