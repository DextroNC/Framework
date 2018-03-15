/*
	Parameters:
		<-- Unit as Object
	
	Description:
		Manually exit of Undercover mode. Restore Weapon.

*/
// Parameter init
params ["_unit"];

// Reset Undercover for manual break
_unit setCaptive false;
_unit setVariable ["SR_UC",false];

// Add Weapon, Weaponitems and Magazines
UC_Weapon params ["_weapon", "_items", "_magazines"];
_unit addWeapon _weapon;
removeAllPrimaryWeaponItems _unit;
{
    _unit addWeaponItem [_weapon, _x];
} forEach (_items);

{
	If (!(_x select 0 isEqualTo "")) then {
		_unit addMagazine _x;
	};
} forEach (_magazines);

