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
_unit forceAddUniform "U_I_HeliPilotCoveralls";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "UK3CB_AAF_O_V_Eagle_CREW_DIGI_GRN";
_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BHP_9_13Rnd";};
_unit addHeadgear "rhs_zsh7a_mike";

comment "Add weapons";
_unit addweapon "SMG_02_F";
_unit addWeapon "UK3CB_BHP";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";


for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_9x21_Mag_SMG_02";};
_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];