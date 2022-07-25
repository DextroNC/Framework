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
_unit forceAddUniform "vn_b_uniform_k2b_01_01";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "vn_b_vest_aircrew_02";
for "_i" from 1 to 7 do {_unit addItemToUniform "vn_m10_mag";};

_unit addHeadgear "vn_b_helmet_aph6_02_03";

comment "Add weapons";
_unit addWeapon "vn_p38s";

comment "Add items";
_unit linkItem "vn_b_item_map";
_unit linkItem "vn_b_item_compass";
_unit linkItem "ItemWatch";


_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC152";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	ace_nightvision_fogScaling = 0.0;
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];