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
_unit forceAddUniform "UK3CB_BAF_U_Smock_DPMW_OLI";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "UK3CB_BAF_SmokeShell";
for "_i" from 1 to 2 do {_unit addItemToUniform "UK3CB_BAF_9_13Rnd";};
_unit addVest "UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW";
_unit addItemToVest "UK3CB_BAF_SmokeShell";
_unit addItemToVest "UK3CB_BAF_SmokeShellGreen";
_unit addItemToVest "UK3CB_BAF_SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_SmokeShellOrange";};
_unit addBackpack "UK3CB_B_O_Radio_Backpack";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "UK3CB_BAF_H_Beret_PR";

comment "Add weapons";
_unit addWeapon "UK3CB_Sten";
_unit addWeapon "UK3CB_BAF_L9A1";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 8 do {_unit addItemToVest "UK3CB_Sten_34Rnd_Magazine_W";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UK3CB_Sten_34Rnd_Magazine_W";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Scrim_F";
    _unit addItemToBackpack "UK3CB_BAF_H_Beret_PR";
    _unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","FAC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];