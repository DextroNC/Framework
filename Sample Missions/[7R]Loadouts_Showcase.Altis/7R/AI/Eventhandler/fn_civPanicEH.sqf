/*
	Parameters:
		<-- Unit as Object
		
	Description:
		Applies a Eventhandler for civilian panic.
		
	Example:
		nul = [_unit] spawn fw_fnc_civPanicEH;

*/

// Parameter Init
params ["_unit"];

// Panic Eventhandler
_unit addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	// last panic
	private _lastPanic = _unit getVariable ["lastPanic", 0];
	// panic cooldown
	if (CBA_MissionTime - _lastPanic > 30 && round (random 5) <= 2) then {
			// execute panic
			_unit playMoveNow selectRandom ["ApanPknlMsprSnonWnonDf", "ApanPercMsprSnonWnonDf", "ApanPpneMsprSnonWnonDf", "ApanPpneMrunSnonWnonDf"];
			_unit setVariable ["lastPanic", CBA_MissionTime];
	};
}];
