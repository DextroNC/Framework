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
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "UK3CB_BAF_9_13Rnd";};
_unit addVest "UK3CB_BAF_V_PLCE_Webbing_Plate_OLI";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
_unit addBackpack "UK3CB_BAF_B_Bergen_OLI_Rifleman_A";
_unit addItemToBackpack "ACE_SpraypaintBlue";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_surgicalKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_Bandage_Pack";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_Medicine_Pack";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "SR_BloodIV_Pack";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SR_Utility_Pack";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};
_unit addItemToBackpack "UK3CB_BAF_H_Boonie_DDPM_PRR";
_unit addGoggles "PBW_shemagh_beige";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L119A1_CQB";
_unit addWeapon "UK3CB_BAF_L9A1";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "UK3CB_ANPVS7";
    removeHeadgear _unit;
    _unit addGoggles "BALA_SWAT_BW_OD";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PM", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",2,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
