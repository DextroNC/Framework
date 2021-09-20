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
_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_DPMW_Ghillie_RM";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "UK3CB_BAF_SmokeShell";};
_unit addItemToUniform "UK3CB_BAF_SmokeShellGreen";
_unit addItemToUniform "UK3CB_BAF_SmokeShellRed";
_unit addVest "V_BandollierB_oli";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_9_13Rnd";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_Kestrel4500";
_unit addItemToVest "ACE_RangeCard";
_unit addBackpack "rhsgref_hidf_alicepack";
_unit addItemToBackpack "ACE_Tripod";

comment "Add weapons";
_unit addWeapon "UK3CB_Sten";
_unit addWeapon "ACE_Vector";
_unit addWeapon "UK3CB_BAF_L9A1";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_Sten_34Rnd_Magazine_W";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "UK3CB_Sten_34Rnd_Magazine_W";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",0.9];
	_unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","Spotter", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];