/*
	Parameters:
		<-- Unit to add the item to as Object
		<-- Item to add as String

	Description:
		Attempts to add an item to the vest a unit

	Example:
		[player, "SR_PAK"] call _addItemToVest;

	Return:
		--> nil
*/

params ["_unit", "_item", ["_previousFailed", false]];

if (_unit canAddItemToVest _item) then {
	_unit addItemToVest _item;
	if (_previousFailed) then {
		systemChat format ["WARNING: %1 added to vest.", _item];
	}
} else {
	systemChat format ["WARNING: Can't add %1 to vest, trying backpack...", _item];
	[_unit, _item, true] call fw_fnc_addItemToBackpack;
}
