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
_unit forceAddUniform "UK3CB_BAF_U_HeliPilotCoveralls_Army";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "UK3CB_BAF_V_Pilot_DPMT";
_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_9_15Rnd";};
_unit addHeadgear "rhsusf_hgu56p_visor_mask_skull";

comment "Add weapons";
_unit addWeapon "hlc_smg_mp5a3";
_unit addPrimaryWeaponItem "hlc_acc_Surefiregrip";
_unit addWeapon "UK3CB_BAF_L105A2";

_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";


for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_9x21_Mag";};
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