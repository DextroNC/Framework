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
_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
for "_i" from 1 to 2 do {_unit addItemToUniform "UK3CB_BAF_9_15Rnd";};
_unit addVest "UK3CB_BAF_V_Osprey_DPMT5";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "UK3CB_BAF_B_Bergen_DPMT_Rifleman_B";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "UK3CB_BAF_338_5Rnd";};
_unit addItemToBackpack "UK3CB_BAF_MaxiKite";
_unit addItemToBackpack "optic_LRPS";
_unit addItemToBackpack "UK3CB_BAF_L115A3";
_unit addItemToBackpack "UK3CB_BAF_H_Boonie_DPMT_PRR";
_unit addHeadgear "UK3CB_BAF_H_Mk6_DPMT_d";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L85A2";
_unit addWeapon "UK3CB_BAF_L105A2";

_unit addMagazine "Laserbatteries";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	
	_unit linkItem "Y_Headlamp_01";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];