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
_unit forceAddUniform "UK3CB_CW_SOV_O_Late_U_CombatUniform_Ghillie_01_KLMK";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addItemToUniform "rhs_mag_nspd";
_unit addItemToUniform "rhs_mag_nspd";
_unit addItemToUniform "Laserbatteries";
_unit addVest "rhs_6b5_sniper_spetsodezhda";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToVest "ACE_RangeCard";
_unit addItemToVest "rhs_acc_1pn34";

comment "Add weapons";
_unit addWeapon "rhs_weap_t5000";
_unit addPrimaryWeaponItem "rhs_acc_dh520x56";
_unit addPrimaryWeaponItem "rhs_acc_harris_swivel";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addHandgunItem "rhs_acc_6p9_suppressor";
_unit addHandgunItem "rhs_mag_9x18_8_57N181S";
_unit addMagazine "Laserbatteries";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
_unit addGoggles "rhs_scarf";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkitem "ItemGPS"; 

for "_i" from 1 to 14 do {_unit addItemToVest "rhs_5Rnd_338lapua_t5000";};

_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",0.9];
	_unit linkItem "Y_Headlamp_01";
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];