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
_unit forceAddUniform "U_B_FullGhillie_sard";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "SmokeShellRed";
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_12Rnd_45cal_usp";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_Kestrel4500";
_unit addItemToVest "ACE_RangeCard";
_unit addBackpack "rhsusf_falconii_coy";
_unit addItemToBackpack "ACE_Tripod";

comment "Add weapons";
_unit addweapon "arifle_TRG20_F";           
_unit addPrimaryWeaponItem "RH_peq15b";
_unit addPrimaryWeaponItem "muzzle_snds_M";
_unit addWeapon "ACE_Vector";
_unit addWeapon "RH_usp";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "RH_aacusp";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_14";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Spotter", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];