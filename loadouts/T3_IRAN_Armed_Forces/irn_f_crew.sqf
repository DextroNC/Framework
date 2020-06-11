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
_unit forceAddUniform "LOP_U_IRAN_Fatigue_01";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_SIG";};
_unit addVest "LOP_V_6B23_CrewOfficer_IDPM";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_nspd";};
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToUniform "ACE_microDAGR";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
_unit addHeadgear "rhs_tsh4_bala";
_unit addGoggles "G_Bandanna_oli";

comment "Add weapons";
_unit addWeapon "hlc_smg_mp5a2";
_unit addWeapon "RH_p226";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_9x21_Mag";};

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];