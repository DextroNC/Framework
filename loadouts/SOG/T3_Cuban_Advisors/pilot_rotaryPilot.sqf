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
    _unit forceAddUniform "vn_o_uniform_nva_air_01";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_MX991";
    _unit addItemToUniform "ACE_HandFlare_Green";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest selectRandom ["vn_b_vest_usarmy_11","vn_b_vest_usarmy_12"];
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_nspn_green";};
    _unit addBackpack "B_FieldPack_invisible";
    _unit addItemToBackpack "ToolKit";

comment "Add Drip";
    _unit addHeadgear "vn_o_helmet_zsh3_02";

comment "Add Primary/Attachments";
    _unit addWeapon "vn_ppsh41";

comment "Add Secondary/Attachments";
    _unit addWeapon "vn_tt33";
    _unit addHandgunItem "vn_tt33_mag";
    _unit addHandgunItem "acc_flashlight_pistol";

comment "Add Tertiary equipment";
    _unit addWeapon "vn_m19_binocs_grey";

comment "Add Ammunition";
    for "_i" from 1 to 1 do {_unit addItemToUniform "vn_tt33_mag";};
    for "_i" from 1 to 3 do {_unit addItemToVest "vn_ppsh41_35_mag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class","Pilot", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","vn_b_acc_m17_01"];