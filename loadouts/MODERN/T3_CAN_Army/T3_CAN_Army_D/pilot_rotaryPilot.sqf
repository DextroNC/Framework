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
    _unit forceAddUniform "7r_can_pilot_coveralls";
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
    _unit addVest "7r_spc_khk_crewman";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
    _unit addBackpack "UK3CB_B_Invisible";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "rhsusf_hgu56p_visor";

comment "Add Primary/Attachments";
    _unit addWeapon "7r_weap_c8a3";
    _unit addPrimaryWeaponItem "rhsusf_acc_rvg_blk";

comment "Add Secondary/Attachments";
    _unit addWeapon "UK3CB_P320_BLK";
    _unit addHandgunItem "UK3CB_P320_9x19_17Rnd";
    _unit addHandgunItem "acc_flashlight_pistol";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToUniform "UK3CB_P320_9x19_17Rnd";};
    for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_GPNVG18_WP_GM_BLK", "USP_GPNVG18_WP_GM_TAR_BLK"];
    _unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","7r_m50_gasmask"];