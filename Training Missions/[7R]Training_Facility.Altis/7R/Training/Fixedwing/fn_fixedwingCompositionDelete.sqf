/*
	Parameters:
		<-- Composition to delete

	Description:
		Delete a spawned composition for fixed wing qualification.
		Must be used with addaction.

	Example (as addaction):
		_terminal addaction ["Delete North", fw_fnc_fixedwingCompositionDelete, "north"];
*/

params ["_target", "_caller", "_actionId", "_side"];

_variableName = "whiskey" + _side;

_existing = _target getVariable _variableName;

if (isNil "_existing") then
{
	hint "Composition did not exist";
}
else
{
	_existing call LARs_fnc_deleteComp;
	_target setVariable [_variableName, nil];
};
