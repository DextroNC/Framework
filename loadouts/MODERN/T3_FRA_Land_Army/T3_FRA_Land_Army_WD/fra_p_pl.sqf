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
[_unit, 3] call compile preprocessFileLineNumbers "loadouts\aUniformCall.sqf";

comment "Add Uniforms/Items";
    _unit addItemToUniform "ACE_MapTools";
    _unit addItemToUniform "SR_PAK";
    _unit addItemToUniform "CBRN_gasmaskFilter";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_Chemlight_HiGreen";};
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_Chemlight_HiRed";};
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "7r_spc_khk_squadleader";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    _unit addItemToVest "rhs_mag_m18_green";
    _unit addItemToVest "rhs_mag_m18_red";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};

comment "Add Backpack/Items";
    _unit addBackpack "7r_compact_cce";
    for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
    _unit addItemToBackpack "ACE_HuntIR_monitor";
    for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HuntIR_M203";};

comment "Add Drip";
    _unit addItemToBackpack selectRandom ["7r_beret_fra_13rdp_prr","7r_beret_fra_13rdp_prr_over"];

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 3] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "ACE_Vector";

comment "Add Ammunition";
    for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";
    
    

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_PVS31_WP_BLK", "USP_PVS31_WP_TAN","USP_PVS31_WP_HIGH_BLK","USP_PVS31_WP_HIGH_TAN","USP_PVS31_WP_MID_BLK","USP_PVS31_WP_MID_TAN","USP_PVS31_WP_TAR_BLK", "USP_PVS31_WP_TAR_TAN","USP_PVS31_WP_TAR_HIGH_BLK","USP_PVS31_WP_TAR_HIGH_TAN","USP_PVS31_WP_TAR_MID_BLK","USP_PVS31_WP_TAR_MID_TAN"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit addItem "UGL_FlareWhite_F";
    _unit addItem "UGL_FlareWhite_F";
    _unit addItem "UGL_FlareWhite_F";
    _unit addItem "UGL_FlareWhite_F";
    _unit addItem "UGL_FlareRed_F";
    _unit addItem "UGL_FlareRed_F";
    _unit addItemToBackpack "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","PL", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","7r_m50_gasmask"];