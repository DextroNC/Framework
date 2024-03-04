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
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_Chemlight_HiGreen";};
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_Chemlight_HiRed";};
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest selectRandomWeighted [
		"7r_klmk_modvest_recon",2,
		"7r_klmk_modvest_compact",2];
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    _unit addItemToVest "rhs_mag_nspn_green";
    _unit addItemToVest "rhs_mag_nspn_red";
    _unit addItemToVest "rhs_mag_nspd";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_plamyam";};

comment "Add Backpack/Items";
    _unit addBackpack "UK3CB_ION_I_B_RadioBag_OLI";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACRE_PRC117F";

comment "Add Drip";
    _unit addItemToBackpack "H_MilCap_grn";

comment "Add Primary/Attachments";
    // 1 - Rifle 1 | 2 - Rifle 2 | 3 - Grenadier | 4 - BattleRifle | 5 - AutoRifle | 6 - MMG
    [_unit, 1] call compile preprocessFileLineNumbers "loadouts\aWeaponCall.sqf";

comment "Add Secondary/Attachments";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";

comment "Add Navigation";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadioAcreFlagged";
_unit linkItem "ItemGPS";


comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem "USP_PVS14";
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",SR_Camo_Coef];
};
_unit setVariable ["SR_Class","FAC", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];