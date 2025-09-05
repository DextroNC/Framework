_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Jem";

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
_unit addWeapon "vn_xm177_camo";

_unit addWeapon "vn_m1911";

_unit addHandgunItem "vn_m1911_mag";

comment "Add containers";
_unit forceAddUniform "vn_b_uniform_macv_03_01";
_unit addVest "vn_b_vest_usarmy_02";
_unit addBackpack "vn_b_pack_prc77_01";

comment "Add items to containers";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "vn_m1911_mag";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addItemToBackpack "vn_m34_grenade_mag";
_unit addItemToBackpack "Laserbatteries";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellOrange";};
for "_i" from 1 to 6 do {_unit addItemToUniform "vn_m16_20_mag";};
for "_i" from 1 to 11 do {_unit addItemToVest "vn_m16_20_mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "vn_b_helmet_m1_03_01";

_unit addItemToBackpack "SR_PAK";
_unit addWeapon "vn_mk21_binocs";

comment "Add items";
_unit linkItem "vn_b_item_map";
_unit linkItem "vn_b_item_compass";
_unit linkItem "ItemWatch";


_unit addItemToVest "ACRE_PRC152";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","FAC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];