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
_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "UK3CB_BAF_V_Osprey_Holster";
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addBackpack "B_UAV_01_backpack_F";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L119A1_FG";
_unit addPrimaryWeaponItem "UK3CB_BAF_Silencer_L85";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
_unit addWeapon "ACE_MX2A";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
_unit addHandgunItem "hlc_acc_DBALPL";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "B_UavTerminal";

for "_i" from 1 to 12 do {_unit addItemToVest "30Rnd_556x45_Stanag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	_unit linkItem "A3_GPNVG18_BLK_F";
	_unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Recon", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];