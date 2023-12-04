
comment "Exported from Arsenal by Jem";

_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_khk_F";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_P07_khk_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_T_Soldier_F";
_unit addVest "V_PlateCarrier1_tna_F";
_unit addBackpack "B_TacticalPack_rgr";

comment "Add binoculars";
_unit addWeapon "ACE_Vector";

comment "Add items to containers";
for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_khaki_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
_unit addItemToVest "16Rnd_9x21_Mag";
_unit addItemToBackpack "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellYellow";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "ACE_HuntIR_monitor";
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HuntIR_M203";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "30Rnd_65x39_caseless_khaki_mag";};
_unit addHeadgear "H_Beret_02";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit addItemToBackpack "H_HelmetB_Enh_tna_F";;
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareWhite_F";
	_unit addItemToBackpack "UGL_FlareRed_F";
	_unit addItemToBackpack "UGL_FlareRed_F";
	_unit linkItem "ACE_NVG_Gen4_Green_WP";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];