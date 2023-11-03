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
    _unit forceAddUniform "U_BG_Guerrilla_6_1";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "VSM_FAPC_Operator_OGA_OD";
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "H_Tank_eaf_F";

comment "Add Primary/Attachments";
    _unit addWeapon "SMG_03C_TR_black";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
    for "_i" from 1 to 4 do {_unit addItemToVest "50Rnd_570x28_SMG_03";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "NVGoggles_OPFOR";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];