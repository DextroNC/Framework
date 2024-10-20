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
[_unit, 2] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiRed";
    _unit addItemToUniform "ACRE_PRC343";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
    for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};

comment "Add Vest/Items";
    _unit addVest "UK3CB_BAF_V_Osprey_DPMW9";
    for "_i" from 1 to 6 do {_unit addItemToVest "SmokeShell";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
    for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};

comment "Add Backpack/Items";
    _unit addBackpack "rhsusf_falconii";


comment "Add Drip";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 1] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "Binocular";

comment "Add Ammunition";
    _unit addItemToBackpack "ACE_surgicalKit";
    for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_tourniquet";};
    for "_i" from 1 to 3 do {_unit addItemToBackpack "SR_Bandage_Pack";};
    for "_i" from 1 to 3 do {_unit addItemToBackpack "SR_Medicine_Pack";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "SR_BloodIV_Pack";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "SR_Utility_Pack";};


comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "UK3CB_BAF_HMNVS";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","M", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",1,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];