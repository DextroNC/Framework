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
    _unit forceAddUniform "U_B_T_Soldier_F";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiRed";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "JCA_MCRP_V_CarrierRigKBT_01_crew_tropic_F";
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "H_HelmetB_Enh_tna_F";

comment "Add Primary/Attachments";
    _unit addWeapon "SMG_05_F";

comment "Add Secondary/Attachments";
    _unit addWeapon "hgun_ACPC2_F";
    _unit addHandgunItem "acc_flashlight_pistol";
    _unit addHandgunItem "muzzle_snds_acp";
    _unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
    for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_9x21_Mag_SMG_02";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "ACE_NVG_Gen4_Green_WP";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];