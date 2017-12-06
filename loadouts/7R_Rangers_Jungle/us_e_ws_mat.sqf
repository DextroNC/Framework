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
_unit forceAddUniform "VSM_MulticamTropic_Crye_SS_grey_shirt_Camo";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addVest "milgp_v_marciras_assaulter_RGR";
for "_i" from 1 to 5 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addBackpack "VSM_MulticamTropic_Backpack_Compact";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "tf47_m3maaws_HEDP";};
_unit addHeadgear "VSM_Mich2000_2_CamoSprayOD";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "SMA_Mk16_GreenQCB";
_unit addPrimaryWeaponItem "SMA_SFPEQ_SCARTOP_BLK";
_unit addWeapon "tf47_m3maaws";
_unit addSecondaryWeaponItem "tf47_optic_m3maaws";
_unit addWeapon "RH_g19t";
_unit addHandgunItem "RH_X300";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","WMAT", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
