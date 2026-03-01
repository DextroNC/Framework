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

// 1 - Echo | 2 - Squad | 3 - Platoon | 4 - Sierra
[_unit, 4] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_HandFlare_Green";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};


comment "Add Vest/Items";
_unit addVest "vn_o_vest_01";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    _unit addItemToVest "rhs_mag_rdg2_white";
    _unit addItemToVest "rhs_mag_nspn_red";

comment "Add Backpack/Items";
    _unit addBackpack "vn_b_pack_p08_01";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "ACE_Tripod";
    _unit addItemToBackpack "ACRE_PRC77";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "vn_sks";

comment "Add Secondary/Attachments";
    _unit addWeapon "vn_tt33";
    _unit addHandgunItem "vn_tt33_mag";

comment "Add Tertiary equipment";
    _unit addWeapon "vn_m19_binocs_grey";

comment "Add Ammunition";
    for "_i" from 1 to 3 do {_unit addItemToUniform "vn_tt33_mag";};
    for "_i" from 1 to 12 do {_unit addItemToVest "vn_sks_mag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","vn_b_acc_m17_01"];