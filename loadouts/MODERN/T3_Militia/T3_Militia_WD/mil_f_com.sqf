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
    _unit forceAddUniform "UK3CB_CHC_C_U_Overall_01";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "UK3CB_ARD_B_V_vydra_3m_TAN";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};

comment "Add Backpack/Items";
    _unit addBackpack "rhs_r148";

comment "Add Drip";
    _unit addHeadgear "rhs_tsh4";
    _unit addGoggles selectRandomWeighted ["G_Balaclava_blk",1,"G_Bandanna_oli",1,"",3];

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m92";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhs_weap_tt33";
    _unit addHandgunItem "rhs_mag_762x25_8";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItem "rhs_mag_762x25_8";};
    for "_i" from 1 to 4 do {_unit addItem "rhs_30Rnd_762x39mm";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemGPS";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];