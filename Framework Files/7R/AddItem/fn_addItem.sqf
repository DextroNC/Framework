/*
	Parameters:
		<-- Unit to add the item to as Object
		<-- Item to add as String

	Description:
		Attempts to add an item to a unit

	Example:
		[player, "SR_PAK"] call _addItem;

	Return:
		--> nil
*/

params ["_unit", "_item", ["_previousFailed", false]];

if (_unit canAdd _item) then {
	_unit addItem _item;
	if (_previousFailed) then {
		systemChat format ["WARNING: %1 added to inventory.", _item];
	}
} else {
	systemChat format ["ERROR: Can't add %1 to inventory.", _item];
}
