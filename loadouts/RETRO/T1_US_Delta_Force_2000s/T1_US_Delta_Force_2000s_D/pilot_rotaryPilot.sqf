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
    _unit forceAddUniform "U_B_HeliPilotCoveralls";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "UK3CB_V_Pilot_Vest";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
    _unit addBackpack "UK3CB_B_Invisible";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "rhsusf_hgu56p_visor";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m4_carryhandle";
    _unit addPrimaryWeaponItem "rhsusf_acc_kac_grip";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_m9";
    _unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";
    _unit addHandgunItem "acc_flashlight_pistol";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
    for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_GPNVG18_GM_TAR_BLK","USP_GPNVG18_GM_BLK"];
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];