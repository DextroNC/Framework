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
    _unit forceAddUniform "UK3CB_BAF_U_CrewmanCoveralls_RTR";
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
    _unit addVest "UK3CB_AAF_O_V_Eagle_CREW_DIGI_BLK";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};

comment "Add Backpack/Items";
    _unit addBackpack "7r_backpanel_odg";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "H_Tank_eaf_F";
    _unit addGoggles "rhs_googles_clear";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m92";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhs_weap_6p53";
    _unit addHandgunItem "rhs_18rnd_9x21mm_7N28";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "rhs_18rnd_9x21mm_7N28";};
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_762x39mm_polymer";};

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
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];