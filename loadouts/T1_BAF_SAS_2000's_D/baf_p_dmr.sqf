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
_unit forceAddUniform "UK3CB_BAF_U_Smock_DDPM";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
for "_i" from 1 to 2 do {_unit addItemToUniform "UK3CB_BAF_9_13Rnd";};
_unit addVest "UK3CB_BAF_V_PLCE_Webbing_Plate_DDPM";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "UK3CB_BAF_B_Bergen_OLI_Rifleman_B";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "UK3CB_BAF_MaxiKite";
_unit addItemToBackpack "UK3CB_BAF_H_Boonie_DDPM_PRR";
_unit addItemToBackpack "optic_LRPS";
_unit addItemToBackpack "UK3CB_BAF_L115A3_DE";
_unit addGoggles "PBW_shemagh_beige";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L119A1_CQB";
_unit addWeapon "UK3CB_BAF_L9A1";
_unit addMagazine "Laserbatteries";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_338_5Rnd";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "UK3CB_ANPVS7";
    removeHeadgear _unit;
    _unit addGoggles "BALA_SWAT_BW_BLK";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];