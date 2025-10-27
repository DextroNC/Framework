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
_unit forceAddUniform "vn_o_uniform_nva_air_01";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_black";};
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addVest "vn_b_vest_aircrew_02";
_unit addItemToVest "ToolKit";
_unit addItemToVest "G_Aviator";
for "_i" from 1 to 2 do {_unit addItemToVest "vn_m10_mag";};
_unit addHeadgear "vn_o_helmet_zsh3_01";
_unit addGoggles "vn_b_acc_ms22001_01";
_unit addBackpack "B_FieldPack_invisible";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "H_Cap_blk";

comment "Add weapons";
_unit addWeapon "vn_m10";
_unit addWeapon "vn_m19_binocs_grey";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC77";

if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","vn_b_acc_m17_01"];