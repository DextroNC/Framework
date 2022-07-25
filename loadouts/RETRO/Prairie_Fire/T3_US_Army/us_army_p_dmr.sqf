_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Jem";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "vn_m14a1"; _unit addPrimaryWeaponItem "vn_bipod_m14";

_unit addPrimaryWeaponItem "vn_o_9x_m14";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "vn_m1911";

_unit addHandgunItem "vn_m1911_mag";

comment "Add containers";
_unit forceAddUniform "vn_b_uniform_macv_01_07";
_unit addVest "milgp_v_marciras_marksman_belt_b";
_unit addBackpack "vn_b_pack_lw_01";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "vn_m1911_mag";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "vn_m34_grenade_mag";
for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit addItemToBackpack "vn_o_anpvs2_m14";
_unit addItemToBackpack "ACE_RangeCard";
_unit addHeadgear "vn_b_boonie_02_04";
_unit addItemToBackpack "SR_PAK";

comment "Add items";
_unit linkItem "vn_b_item_map";
_unit linkItem "vn_b_item_compass";
_unit linkItem "ItemWatch";


if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit addItem "ACE_IR_Strobe_Item";
	
	_unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","DMR", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];