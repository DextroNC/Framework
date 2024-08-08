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
    _unit forceAddUniform "rhsgref_uniform_para_ttsko_mountain";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "7r_ttsko_modvest_crew";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "H_Tank_black_F";
    _unit addGoggles selectRandomWeighted ["rhsusf_oakley_goggles_clr",1,"rhs_googles_clear",1,"G_Balaclava_blk",1,"G_Bandanna_oli",1,"",3];

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_aks74un";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhs_weap_makarov_pm";
    _unit addHandgunItem "rhs_mag_9x18_8_57N181S";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS31_WP", "USP_PVS31_WP_TAN","USP_PVS31_WP_HIGH","USP_PVS31_WP_HIGH_TAN","USP_PVS31_WP_MID","USP_PVS31_WP_MID_TAN","USP_PVS31_WP_TAR", "USP_PVS31_WP_TAR_TAN","USP_PVS31_WP_TAR_HIGH","USP_PVS31_WP_TAR_HIGH_TAN","USP_PVS31_WP_TAR_MID","USP_PVS31_WP_TAR_MID_TAN","USP_PVS31_WP_BLK2", "USP_PVS31_WP_TAN2", "USP_PVS31_WP_HIGH_BLK2", "USP_PVS31_WP_HIGH_TAN2", "USP_PVS31_WP_MID_BLK2", "USP_PVS31_WP_MID_TAN2", "USP_PVS31_WP_TAR_BLK2", "USP_PVS31_WP_TAR_TAN2", "USP_PVS31_WP_TAR_HIGH_BLK2", "USP_PVS31_WP_TAR_HIGH_TAN_BLK2", "USP_PVS31_WP_TAR_MID_BLK2", "USP_PVS31_WP_TAR_MID_TAN2"];
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];