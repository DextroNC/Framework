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
_unit forceAddUniform "OFrP_Uniform_T4S2_Short_CE_FRHV_LTNBV";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addVest "OFrP_Vest_CIRAS_TeamLeader_MJK";
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellYellow";};
_unit addBackpack "B_AssaultPack_Green";
for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_GAM_40";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_GAM_40_Smoke_White";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_GAM_40_Smoke_Red";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_GAM_40_Smoke_Yellow";};
_unit addItemToBackpack "ACE_SpraypaintGreen";
_unit addHeadgear "OFrP_Hat_Beret_2RPIMA";
_unit addGoggles "rhs_googles_clear";

comment "Add weapons";
_unit addWeapon "AMF_Famas_valo_01_F";
_unit addPrimaryWeaponItem "BWA3_acc_LLM01_irlaser";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_14";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_White";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_White";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_White";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_White";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_Red";
	_unit addItemToBackpack "1Rnd_GAM_40_Flare_Red";
	_unit addHeadgear "OFrP_Helmet_FELIN_CE";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
