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
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "usm_vest_lbe_rmpr";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    _unit addItemToVest "rhs_mag_an_m8hc";
    _unit addItemToVest "rhs_mag_m18_red";

comment "Add Backpack/Items";
    _unit addBackpack "7r_backpanel_odg";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "rhsusf_acc_premier_anpvs27";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "rhs_weap_m24sws";
    _unit addPrimaryWeaponItem "rhsusf_acc_M8541_low";
    _unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
    _unit addPrimaryWeaponItem "rhsusf_acc_m24_silencer_black";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_m1911a1";
    _unit addHandgunItem "rhsusf_mag_7x45acp_MHP";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";
    for "_i" from 1 to 4 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
    for "_i" from 1 to 10 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m118_special_Mag";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "UK3CB_ANPVS7";
    
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","G_CBRN_M04"];