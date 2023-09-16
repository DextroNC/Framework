/*
	Parameters:
		<-- Composition to spawn

	Description:
		Spawn a composition for fixed wing qualification.
		Must be used with addaction.

	Example (as addaction):
		_terminal addaction [Spawn North", fw_fnc_fixedwingCompositionSpawn, "north"];
*/

params ["_target", "_caller", "_actionId", "_side"];


_spawnInProgress = _target getVariable ["spawn_in_progress", false];

if (_spawnInProgress) then
{
	hint "Already busy spawning a composition, please wait.";
}
else
{
	_variableName = "whiskey" + _side;

	_existing = _target getVariable _variableName;

	if (!isNil "_existing") then
	{
		hint "Composition already spawned";
	}
	else
	{
		_composition = nil;

		if (_side == "north") then
		{
			_composition = "WhiskeyNorth";
		};

		if (_side == "south") then
		{
			_composition = "WhiskeySouth";
		};

		if (isNil "_composition") then {
			hint ("ERROR: Unknown composition: " + _side);
		}
		else
		{
			_target setVariable ["spawn_in_progress", true];

			_reference = _composition call LARs_fnc_spawnComp;
			_target setVariable [_variableName, _reference];
			hint "Composition spawned";

			_target setVariable ["spawn_in_progress", false];
		};
	};
}
