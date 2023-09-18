_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Exported from Arsenal by Dextro";

comment "Remove existing items";
removeBackpack _unit;

_unit addBackpack "VSM_OGA_Backpack_Kitbag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "SR_Bandage_Pack";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "SR_Medicine_Pack";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SR_BloodIV_Pack";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SR_Utility_Pack";};
_unit addItemToBackpack "ACE_surgicalKit";
_unit addItemToBackpack "ACE_surgicalKit";

_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
