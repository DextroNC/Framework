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

comment "Add Uniforms/Items";
    _unit forceAddUniform "rhs_uniform_FROG01_wd";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "rhsusf_spc_crewman";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "rhsusf_cvc_green_helmet";
    _unit addGoggles "rhsusf_oakley_goggles_clr";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m4_carryhandle";

comment "Add Secondary/Attachments";
    _unit addWeapon "UK3CB_P320_BLK";
    _unit addHandgunItem "UK3CB_P320_9x19_17Rnd";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "UK3CB_P320_9x19_17Rnd";};
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_MK318_Stanag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS31_WP_BLK", "USP_PVS31_WP_TAN","USP_PVS31_WP_HIGH_BLK","USP_PVS31_WP_HIGH_TAN","USP_PVS31_WP_MID_BLK","USP_PVS31_WP_MID_TAN","USP_PVS31_WP_TAR_BLK", "USP_PVS31_WP_TAR_TAN","USP_PVS31_WP_TAR_HIGH_BLK","USP_PVS31_WP_TAR_HIGH_TAN","USP_PVS31_WP_TAR_MID_BLK","USP_PVS31_WP_TAR_MID_TAN"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","7r_m50_gasmask"];