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
    _unit forceAddUniform selectRandomWeighted ["7r_bdu_dpm",2,"7r_bdu_btisrl_dpm",1,"7r_bdu_bti_dpm",1,"7r_bdu_srh_dpm",2,"7r_bdu_srl_dpm",2,"7r_bdu_bnu_dpm",1];
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest selectRandom ["usm_vest_lbe_rm","usm_vest_lbe_rm2","usm_vest_lbe_rmp"];
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};

comment "Add Backpack/Items";
    _unit addBackpack "UK3CB_B_Bedroll_Shovel_Backpack_GRN";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "UK3CB_BAF_H_CrewHelmet_B";
    _unit addGoggles "UK3CB_G_Neck_Shemag_Tan";

comment "Add Primary/Attachments";
    _unit addWeapon "UK3CB_Sten";

comment "Add Secondary/Attachments";
    _unit addWeapon "UK3CB_BAF_L9A1";
    _unit addHandgunItem "UK3CB_BAF_9_13Rnd";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "UK3CB_BAF_9_13Rnd";};
    for "_i" from 1 to 4 do {_unit addItemToVest "UK3CB_Sten_34Rnd_Magazine";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];