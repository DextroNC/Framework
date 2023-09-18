_unit = (_this select 1);
if( !local _unit ) exitWith {};

_unit linkItem "tf_anprc152";
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];