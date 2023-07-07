/*
	Parameters:
		<-- Unit to add the item to as Object
		<-- Item to add as String

	Description:
		Attempts to add an item to the backpack a unit

	Example:
		[player, "SR_PAK"] call _addItemToBackpack;

	Return:
		--> nil
*/

params ["_unit", "_item", ["_previousFailed", false]];

if (_unit canAddItemToBackpack _item) then {
	_unit addItemToBackpack _item;
	if (_previousFailed) then {
		systemChat format ["WARNING: %1 added to backpack.", _item];
	}
} else {
	systemChat format ["WARNING: Can't add %1 to backpack, trying other locations...", _item];
	[_unit, _item, true] call fw_fnc_addItem;
}
