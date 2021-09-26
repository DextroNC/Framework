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
_unit forceAddUniform "rhs_uniform_afghanka_winter_boots_ttsko";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_nspd";};
_unit addVest "rhs_6b5_medic_ttsko";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addItemToVest "ACE_SpraypaintBlue";
_unit addItemToVest "ACE_surgicalKit";
_unit addBackpack "UK3CB_TKA_O_B_RIF_Tan";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_Bandage_Pack";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_Medicine_Pack";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "SR_BloodIV_Pack";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SR_Utility_Pack";};
_unit addHeadgear "rhs_ushanka";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74n";
_unit addPrimaryWeaponItem "rhs_acc_dtk1";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_AK";};

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
    _unit linkItem "Y_Headlamp_01";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
};
_unit setVariable ["SR_Class","PM", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",2,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
