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
_unit addVest "UK3CB_BAF_V_PLCE_Webbing_Plate_OLI";
for "_i" from 1 to 3 do {_unit addItemToVest "UK3CB_BAF_SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_SmokeShellYellow";};
_unit addItemToVest "DemoCharge_Remote_Mag";
_unit addBackpack "UK3CB_B_Alice_Bedroll_K";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintGreen";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SatchelCharge_Remote_Mag";};
_unit addItemToBackpack "DemoCharge_Remote_Mag";
_unit addHeadgear "UK3CB_BAF_H_Mk6_DPMW_A";

comment "Add weapons";
_unit addWeapon "rhs_weap_l1a1";
_unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
_unit addPrimaryWeaponItem "rhsgref_acc_l1a1_l2a2";
_unit addWeapon "UK3CB_BAF_L9A1";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_20Rnd_762x51_m80_fnfal";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
	_unit addHeadgear "UK3CB_BAF_H_Mk6_DPMW_A";
    _unit addItemToBackpack "UK3CB_BAF_H_Beret_PR";
    _unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
