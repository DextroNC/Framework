/*
	Parameters:
	<-- Unit as Object
	<-- Target as Location

	Description:
		Sets up popup targets.
	
	Example (Trigger onActivation):
		nul = [_unit,_target] spawn fw_fnc_trackParadrop;

*/
// Parameter Init
params ["_unit","_target"];

// Check touching Ground
[{!(alive (_this select 0)) || (isTouchingGround (_this select 0))}, {
	params ["_unit","_target"];
	if (alive _unit) then {
		private _distance = round (_unit distance2d (markerPos _target));
		(name _unit + " landed " + str(_distance) + "m from DZ.") remoteExec ["systemChat",group _unit];
	};
}, [_unit,_target]] call CBA_fnc_waitUntilAndExecute;