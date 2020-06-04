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
_unit forceAddUniform "LOP_U_IRAN_M93_basij_01";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_RangeCard";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_SIG";};
_unit addVest "UK3CB_TKP_I_V_6Sh92_Radio_Khk";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "B_AssaultPack_cbr";
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
_unit addItemToBackpack "Laserbatteries";
_unit addItemToBackpack "rhs_acc_1pn93_1";
_unit addHeadgear "LOP_H_Shemag_TAN";

comment "Add weapons";
_unit addWeapon "rhs_weap_svdp";
_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
_unit addWeapon "RH_p226";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 10 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_10Rnd_762x54mmR_7N1";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];