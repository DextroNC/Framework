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
_unit addWeapon "vn_m16_m203_camo";
_unit addPrimaryWeaponItem "vn_40mm_m406_he_mag";
_unit addWeapon "vn_m1911";
_unit addHandgunItem "vn_m1911_mag";

comment "Add containers";
_unit forceAddUniform "vn_b_uniform_macv_01_07";
_unit addVest "vn_b_vest_usarmy_09";
_unit addBackpack "vn_b_pack_lw_01";

comment "Add binoculars";
_unit addWeapon "vn_mk21_binocs";

comment "Add items to containers";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "vn_m1911_mag";

_unit addItemToUniform "SmokeShell";
for "_i" from 1 to 5 do {_unit addItemToVest "vn_m16_20_mag";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellRed";
_unit addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 11 do {_unit addItemToBackpack "vn_m16_20_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "vn_m34_grenade_mag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "vn_40mm_m406_he_mag";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "vn_40mm_m680_smoke_w_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "vn_40mm_m682_smoke_r_mag";};
_unit addHeadgear "vn_b_helmet_m1_04_01";
_unit addGoggles "G_Bandanna_oli";
_unit addItemToBackpack "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_m112_mag";};
_unit addItemToBackpack "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

comment "Add items";
_unit linkItem "vn_b_item_map";
_unit linkItem "vn_b_item_compass";
_unit linkItem "ItemWatch";


if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItemToBackpack "vn_40mm_m583_flare_w_mag";
	_unit addItemToBackpack "vn_40mm_m583_flare_w_mag";
	_unit addItemToBackpack "vn_40mm_m583_flare_w_mag";
	_unit addItemToBackpack "vn_40mm_m583_flare_w_mag";
	_unit addItemToBackpack "vn_40mm_m662_flare_r_mag";
	_unit addItemToBackpack "vn_40mm_m662_flare_r_mag";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","SL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];



