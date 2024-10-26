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
_unit forceAddUniform "7r_afghanka_lpdf_rain";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_nspd";};
_unit addItemToUniform "ACE_Chemlight_HiGreen";
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "rhs_belt_AK";
_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
_unit addHeadgear "rhs_zsh7a_mike_green";
_unit addBackpack "UK3CB_B_Invisible";
_unit addItemToBackpack "ToolKit";

comment "Add weapons";
_unit addWeapon "rhs_weap_aks74un";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";



for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6_AK";};
_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "A3_GPNVG18_BLK_F";
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];