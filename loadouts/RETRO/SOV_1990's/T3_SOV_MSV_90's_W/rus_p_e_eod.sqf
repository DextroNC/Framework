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
_unit forceAddUniform "rhs_uniform_afghanka_winter_boots_vsr_2";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "rhs_6b5_officer_vsr";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_nspd";};
_unit addBackpack "rhs_rk_sht_30_olive";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACE_SpraypaintRed";
_unit addItemToBackpack "ACE_SpraypaintGreen";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_ec200_sand_mag";};
_unit addHeadgear "rhs_ushanka";

comment "Add weapons";
_unit addWeapon "rhs_weap_akmn";
_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addWeapon "rhs_pdu4";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_762x39mm_bakelite";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm_bakelite";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
    _unit linkItem "Y_Headlamp_01";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	
};
_unit setVariable ["SR_Class","PE", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",true,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];