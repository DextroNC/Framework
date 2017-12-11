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
_unit forceAddUniform "U_B_HeliPilotCoveralls";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "SmokeShellPurple";
_unit addItemToUniform "SmokeShellPurple";
_unit addVest "V_TacVest_blk";
_unit addItemToVest "ACE_microDAGR";
_unit addItemToVest "ACE_HandFlare_Green";
for "_i" from 1 to 3 do {_unit addItemToVest "RH_15Rnd_9x19_M9";};
_unit addHeadgear "rhsusf_hgu56p_visor_mask_black";
_unit addBackpack "fatpack_od";

comment "Add weapons";
_unit addWeapon "hlc_smg_mp5a3";
_unit addPrimaryWeaponItem "hlc_acc_Surefiregrip";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_9x19_B_MP5";};
_unit addItemToVest "ACRE_PRC148";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToBackpack "rhsusf_hgu56p_visor_black";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhsusf_ANPVS_15";
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];