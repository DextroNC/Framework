
comment "Exported from Arsenal by Jem";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "arifle_MX_Black_F";
this addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
this addWeapon "RH_fnp45";
this addHandgunItem "RH_X300";
this addHandgunItem "RH_15Rnd_45cal_fnp";

comment "Add containers";
this forceAddUniform "U_B_CTRG_1";
this addVest "milgp_v_marciras_assaulter_belt_b";

comment "Add binoculars";
this addWeapon "Binocular";

comment "Add items to containers";
for "_i" from 1 to 2 do {this addItemToUniform "ACE_tourniquet";};
this addItemToUniform "ACRE_PRC343";
this addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {this addItemToUniform "RH_15Rnd_45cal_fnp";};
this addItemToUniform "Chemlight_green";
this addItemToVest "ACE_microDAGR";
for "_i" from 1 to 3 do {this addItemToVest "ACE_CableTie";};
for "_i" from 1 to 2 do {this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {this addItemToVest "SmokeShellPurple";};
for "_i" from 1 to 2 do {this addItemToVest "ACE_HandFlare_Green";};
for "_i" from 1 to 4 do {this addItemToVest "30Rnd_65x39_caseless_black_mag";};
this addHeadgear "H_HelmetCrew_B";
this addGoggles "G_Combat";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemGPS";
this linkItem "A3_GPNVG18_F";


