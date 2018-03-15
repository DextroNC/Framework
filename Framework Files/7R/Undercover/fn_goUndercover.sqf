/*
	Parameters:
		<-- Unit as Object
	
	Description:
		Makes a Unit join the Undercover mode. The primary weapon will be stored and removed.
		Unit will not be engaged by AI.
		
	Example:
		[player] spawn fw_fnc_goUndercover;

*/
// Parameter init
params ["_unit"];
if (!local _unit) exitWith {};

// Store Primary Weapon
UC_Weapon = [];
_weapon = primaryWeapon _unit;
_return = [_unit, _weapon] call ace_common_fnc_getWeaponState;
_return params ["_items", "", "_magazines", "_ammo"];
{
    _magazines set [_forEachIndex, [_x, _ammo select _forEachIndex]];
} forEach _magazines;

_unit removeWeapon (primaryWeapon _unit);

UC_Weapon = [_weapon, _items, _magazines];

//Make Unit Undercover
_unit setCaptive true;

// Start Loop
hint "Undercover";
sleep 2;
[_unit] spawn fw_fnc_loopUndercover;