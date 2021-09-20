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
_unit forceAddUniform "usm_bdu_bti_tgrstp";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_30Rnd_9x19_UZI";};
_unit addVest "usm_vest_lbe_rm2";
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_an_m8hc";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_grenade_mkiiia1_mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "ACE_CableTie";};
for "_i" from 1 to 8 do {_unit addItemToVest "RH_30Rnd_9x19_UZI";};
_unit addBackpack "UK3CB_CHC_C_B_HIKER";
_unit addHeadgear "usm_bdu_boonie_tgrstp";

comment "Add weapons";
_unit addWeapon "rhs_weap_m79";
_unit addWeapon "RH_muzi";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	for "_i" from 1 to 8 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","G", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];