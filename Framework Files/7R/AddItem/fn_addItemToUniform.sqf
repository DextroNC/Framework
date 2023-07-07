/*
	Parameters:
		<-- Unit to add the item to as Object
		<-- Item to add as String

	Description:
		Attempts to add an item to the uniform of a unit

	Example:
		[player, "SR_PAK"] call _addItemToUniform;

	Return:
		--> nil
*/

params ["_unit", "_item"];

if (_unit canAddItemToUniform _item) then {
	_unit addItemToUniform _item;
} else {
	systemChat format ["WARNING: Can't add %1 to uniform, trying vest...", _item];
	[_unit, _item, true] call fw_fnc_addItemToVest;
}
