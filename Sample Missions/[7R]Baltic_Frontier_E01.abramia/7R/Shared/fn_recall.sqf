/*
	Parameters:
		<-- Unit as Object

	Description:
		Teleports an individual back to base.


	Example:
	[] call fw_fnc_recall;

*/
// Parameter init
params ["_unit"];

// Recall Progress Bar
[5, [_unit,_unit], {
	_unit = ((_this select 0) select 0);
	_unit setPos (markerPos "respawn_west");
	(_this select 0) execVM "onPlayerRespawn.sqf";
}, {hint "Recall Aborted"}, "Base Recall..."] call ace_common_fnc_progressBar;