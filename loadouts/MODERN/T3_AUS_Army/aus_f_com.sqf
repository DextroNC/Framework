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
    _unit forceAddUniform "7r_amcu_aus_uniform2";
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
    _unit addVest "JCA_MCRP_V_CarrierRigKBT_01_crew_black_F";
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};

comment "Add Backpack/Items";

comment "Add Drip";
    _unit addHeadgear "H_HelmetCrew_I";
    _unit addGoggles "rhsusf_oakley_goggles_clr";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_hk416d10";

comment "Add Secondary/Attachments";
    _unit addWeapon "UK3CB_BHP";
    _unit addHandgunItem "UK3CB_BHP_9_13Rnd";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToVest "UK3CB_BHP_9_13Rnd";};
    for "_i" from 1 to 4 do {_unit addItemToVest "7r_mag_aug_m855a1";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "UK3CB_BAF_HMNVS";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","TC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];