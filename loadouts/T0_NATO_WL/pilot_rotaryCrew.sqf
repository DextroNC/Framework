_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Uniform";
_unit forceAddUniform "U_B_HeliPilotCoveralls";
_unit addVest "V_TacVest_blk";
_unit addHeadgear "H_CrewHelmetHeli_B";

comment "Basic";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "16Rnd_9x21_Mag";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Role";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
_unit addItemToVest "ACE_HandFlare_Green";
_unit addItemToVest "ACE_microDAGR";
_unit addItemToVest "ACRE_PRC152";

comment "Weapons";
_unit addWeapon "arifle_MXC_Black_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addWeapon "hgun_P07_F";
_unit addHandgunItem "16Rnd_9x21_Mag";
_unit addWeapon "Binocular";

comment "Framework";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "NVGoggles_OPFOR";
	ace_nightvision_fogScaling = 0.0;
	_unit setUnitTrait ["camouflageCoef",1];
};
_unit setVariable ["SR_Class", "Pilot", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
