/*
	Parameters:
		<-- Unit as Object
	
	Description:
		Manually exit of Undercover mode. Restore Weapon.

*/
// Parameter init
params ["_unit"];

_unit setCaptive false;


UC_Weapon params ["_weapon", "_items", "_magazines"];
_unit addWeapon _weapon;
removeAllPrimaryWeaponItems _unit;
{
    _unit addWeaponItem [_weapon, _x];
} forEach (_items);

{
    _unit addMagazine _x;
} forEach (_magazines);
