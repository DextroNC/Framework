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
_unit forceAddUniform "BWA3_Uniform_Ghillie_Tropen";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addItemToUniform "rhsusf_mag_40Rnd_46x30_FMJ";
_unit addItemToUniform "rhsusf_mag_40Rnd_46x30_FMJ";
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_RangeCard";
_unit addItemToVest "Laserbatteries";
_unit addItemToVest "UK3CB_BAF_MaxiKite";

comment "Add weapons";
_unit addWeapon "BWA3_G29";
_unit addPrimaryWeaponItem "BWA3_optic_M5Xi_MSR";
_unit addPrimaryWeaponItem "RH_HBLM";
_unit addWeapon "UK3CB_BAF_Soflam_UK3CB_BAF_Soflam_Laserdesignator";
_unit addWeapon "BWA3_MP7";
_unit addHandgunItem "BWA3_muzzle_snds_Rotex_II";
_unit addHandgunItem "BWA3_acc_VarioRay_irlaser";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 4 do {_unit addItemToVest "BWA3_10Rnd_86x70_G29";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];