/*
	Parameters:
		<-- Terminal as Object

	Description:
		Adds Fixed Wing actions to Terminal

	Example (in terminal init):
		this spawn fw_fnc_fixedwingAddAction;
*/

_terminal = _this;

// _terminal addaction ["<t color=""#00FF00"">Spawn North", fw_fnc_fixedwingCompositionSpawn, "north"];
// _terminal addaction ["<t color=""#FF0000"">Delete North", fw_fnc_fixedwingCompositionDelete, "north"];

// _terminal addaction ["<t color=""#00FF00"">Spawn South", fw_fnc_fixedwingCompositionSpawn, "south"];
// _terminal addaction ["<t color=""#FF0000"">Delete South", fw_fnc_fixedwingCompositionDelete, "south"];

_terminal addaction ["Set daytime", fw_fnc_setTime, 12];
_terminal addaction ["Set nighttime", fw_fnc_setTime, 0];
