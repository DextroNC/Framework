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
_unit forceAddUniform "usm_bdu_w";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

_unit addVest "usm_vest_pasgt_lbv_rmp";
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 8 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "RH_15Rnd_9x19_M9";};

_unit addBackpack "usm_pack_abag_m60";

for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
_unit addHeadgear "usm_bdu_8point_wdl";

comment "Add weapons";
_unit addWeapon "gst_m16a2_gl";
_unit addWeapon "RH_m9";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";



if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItemToVest "UGL_FlareWhite_F";
	_unit addItemToVest "UGL_FlareWhite_F";
	_unit addItemToVest "UGL_FlareWhite_F";
	_unit addItemToVest "UGL_FlareWhite_F";
	_unit addItemToVest "UGL_FlareRed_F";
	_unit addItemToVest "UGL_FlareRed_F";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
