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
_unit forceAddUniform "unif_SWEAT_daguet_mecha_L";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
_unit addVest "6094_HEAVY_tan";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
_unit addBackpack "SOG_BAG_TAN";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SatchelCharge_Remote_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "Mohawk_Core_cyalumen_tan";
_unit addGoggles "BALA_SWAT_ESS_TAN";

comment "Add weapons";
_unit addWeapon "SPS_hk416_11_vfg_black_f";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addWeapon "RH_g19t";
_unit addHandgunItem "RH_M6X";
_unit addHandgunItem "RH_gemtech9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","EE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];