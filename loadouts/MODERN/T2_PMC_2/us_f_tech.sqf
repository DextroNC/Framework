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
_unit forceAddUniform "VSM_OGA_grey_casual_Camo";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addVest "milgp_v_marciras_light_mc";
for "_i" from 1 to 2 do {_unit addItemToVest "RH_14Rnd_9x19_sw";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_SmokeShellCableTie";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "rhsusf_falconii_mc";
_unit addItemToBackpack "ToolKit";
_unit addHeadgear "rhsusf_cvc_ess";
_unit addGoggles "PBW_RevisionF_klar";

comment "Add weapons";
_unit addWeapon "rhsusf_weap_MP7A2_grip1";
_unit addPrimaryWeaponItem "rhsusf_acc_M952V";
_unit addPrimaryWeaponItem "BWA3_optic_MicroT2";
_unit addPrimaryWeaponItem "rhsusf_acc_rvg_blk";
_unit addWeapon "RH_sw659";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

for "_i" from 1 to 5 do {_unit addItemToVest "rhsusf_mag_40Rnd_46x30_FMJ";};

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "Y_Headlamp_01";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];