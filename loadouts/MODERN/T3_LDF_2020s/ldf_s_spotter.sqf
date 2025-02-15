_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Arsenal Gameplay by Roy, Ionaru";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// 1 - Echo | 2 - Squad | 3 - Platoon | 4 - Sierra
[_unit, 4] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};


comment "Add Vest/Items";
_unit addVest "milgp_v_jpc_marksman_belt_rgr";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    _unit addItemToVest "rhs_mag_an_m8hc";
    _unit addItemToVest "rhs_mag_m18_red";

comment "Add Backpack/Items";
    _unit addBackpack "B_Kitbag_invisible";
    _unit addItemToBackpack "ACE_Kestrel4500";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "ACE_Tripod";
    _unit addItemToBackpack "ACRE_PRC117F";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_hk416d145";
    _unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a_blk";
    _unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";

comment "Add Secondary/Attachments";
    _unit addWeapon "hgun_Pistol_heavy_01_green_F";
    _unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

comment "Add Ammunition";
    for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
    for "_i" from 1 to 12 do {_unit addItemToVest "rhsgref_30rnd_556x45_vhs2";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS14_WP", "USP_PVS14_WP_TAR"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];