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
    _unit addVest "JCA_MCRP_V_CarrierRigKBT_01_crew_black_F";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};

comment "Add Backpack/Items";
    _unit addBackpack "B_AssaultPack_invisible";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "H_Tank_black_F";
    _unit addGoggles "rhs_googles_clear";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_aks74un";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_FMJ";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
    for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_AK";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "USP_PVS15";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",1, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];