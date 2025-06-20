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
_unit forceAddUniform "U_I_pilotCoveralls";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_purple";};
_unit addItemToUniform "ACE_Chemlight_HiGreen";
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "UK3CB_V_Invisible";
_unit addItemToVest "ACE_microDAGR";
_unit addItemToVest "ToolKit";
_unit addItemToVest "G_Aviator";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BHP_9_13Rnd";};
_unit addHeadgear "H_PilotHelmetFighter_O";
_unit addBackpack "B_Kitbag_invisible";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack selectRandom ["7r_beret_aus_army_prr","7r_beret_aus_army_prr_over","7r_amcu_patrolcap","7r_amcu_patrolcap"];

comment "Add weapons";
_unit addWeapon "UK3CB_BHP";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","7r_m50_gasmask"];