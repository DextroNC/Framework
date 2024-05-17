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
    _unit forceAddUniform "rhsgref_uniform_woodland";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    _unit addItemToUniform "ACE_microDAGR";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "rhsusf_cvc_green_alt_helmet";
    _unit addGoggles "rhsusf_oakley_goggles_clr";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m3a1";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_m9";
    _unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_VectorDay";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
    for "_i" from 1 to 4 do {_unit addItemToVest "rhsgref_30rnd_1143x23_M1911B_SMG";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];