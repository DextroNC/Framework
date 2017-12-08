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
_unit forceAddUniform "DISCLOSE_BEREZKA2";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
_unit addVest "rhs_6sh92_digi_radio";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addBackpack "rhs_assault_umbts";
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addHeadgear "rhs_Booniehat_digi";

comment "Add weapons";
_unit addWeapon "rhs_weap_svdp_wd_npz";
_unit addWeapon "rhs_weap_pb_6p9";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

for "_i" from 1 to 12 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
for "_i" from 1 to 12 do {_unit addItemToBackpack "rhs_10Rnd_762x54mmR_7N1";};

_unit addItemToUniform "ACRE_PRC343";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "rhs_1PN138";
	_unit addHeadgear "rhs_6b26_bala";
	_unit setUnitTrait ["camouflageCoef",0.5];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];