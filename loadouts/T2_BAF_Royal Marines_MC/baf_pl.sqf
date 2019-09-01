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
_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
_unit addVest "UK3CB_BAF_V_Osprey_SL_C";
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
_unit addBackpack "UK3CB_BAF_B_Bergen_MTP_SL_L_A";
for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HuntIR_M203";};
_unit addItemToBackpack "ACE_HuntIR_monitor";
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "UK3CB_BAF_H_Beret_RM_Officer_PRR";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L85A2_UGL";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "UK3CB_BAF_HMNVS";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareRed_F";
	_unit addItemToBackpack "UGL_FlareRed_F";
	_unit addHeadgear "UK3CB_BAF_H_Mk7_Net_ESS_A";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
