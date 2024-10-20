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
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
    _unit addItemToUniform "ACE_Flashlight_XL50";
    _unit addItemToUniform "ACE_Chemlight_HiGreen";
    _unit addItemToUniform "ACRE_PRC343";
    _unit addItemToUniform "ACRE_PRC152";
    for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Add Vest/Items";
    _unit addVest "milgp_v_jpc_Marksman_mc";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    _unit addItemToVest "rhs_mag_an_m8hc";
    _unit addItemToVest "rhs_mag_m18_red";

comment "Add Backpack/Items";
    _unit addBackpack "milgp_bp_Tomahawk_mc";
    _unit addItemToBackpack "Laserbatteries";
    _unit addItemToBackpack "ACE_RangeCard";
    _unit addItemToBackpack "uk3cb_baf_maxikite";

comment "Add Drip";

comment "Add Primary/Attachments";
    _unit addWeapon "UK3CB_BAF_L115A3_BL";
    _unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
    _unit addPrimaryWeaponItem "uk3cb_baf_silencer_l115a3";
    _unit addPrimaryWeaponItem "uk3cb_underbarrel_acc_bipod";

comment "Add Secondary/Attachments";
    _unit addWeapon "rhsusf_weap_glock17g4";
    _unit addHandgunItem "acc_flashlight_pistol";
    _unit addHandgunItem "rhsusf_acc_omega9k";
    _unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

comment "Add Tertiary equipment";
    _unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator";
    _unit addMagazine "Laserbatteries";

comment "Add Ammunition";
    for "_i" from 1 to 4 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
    for "_i" from 1 to 10 do {_unit addItemToVest "UK3CB_BAF_338_5Rnd";};

comment "Add Navigation";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadioAcreFlagged";
    _unit linkItem "ItemGPS";

comment "Other Variables";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
    _unit linkItem selectRandom ["USP_GPNVG18_WP_BLK","USP_GPNVG18_WP_BLK2","USP_GPNVG18_WP_TAN","USP_GPNVG18_WP_TAN2","USP_GPNVG18_WP_GM_BLK","USP_GPNVG18_WP_GM_TAN","USP_GPNVG18_WP_GM_TAR_BLK","USP_GPNVG18_WP_GM_TAR_TAN","USP_GPNVG18_WP_TAR_BLK","USP_GPNVG18_WP_TAR_BLK2","USP_GPNVG18_WP_TAR_TAN","USP_GPNVG18_WP_TAR_TAN2"];
    _unit addItem "ACE_IR_Strobe_Item";
    _unit setUnitTrait ["camouflageCoef",0.9];
};
_unit setVariable ["SR_Class","Sniper", true];
_unit setVariable ["ace_isEngineer",0, true];
_unit setVariable ["ace_medical_medicClass",0,true];
_unit setVariable ["ACE_isEOD",false,true];

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
_unit setVariable ["SR_CBRN_Mask","7r_m50_gasmask"];