_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Dextro";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addItemToUniform "Chemlight_green";
_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellRed";
_unit addBackpack "rhsusf_falconii_coy";
_unit addItemToBackpack "rhs_fgm148_magazine_AT";
_unit addHeadgear "rhsusf_lwh_helmet_marpatd_ess";

comment "Add weapons";
_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit addPrimaryWeaponItem "RH_SFM952V";
_unit addWeapon "UK3CB_BAF_Javelin_Slung_Tube";
_unit addWeapon "rhsusf_weap_m9";
_unit addWeapon "UK3CB_BAF_Javelin_CLU";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
_unit addItemToVest "ACRE_PRC343";
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];