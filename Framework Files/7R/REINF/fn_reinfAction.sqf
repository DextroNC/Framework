/*
	Parameters:
		<-- Helicopter as Object
		
	Description:
		Adds AddAction to Helicopter for liftoff.



*/
// Parameter Init
params ["_helo"];

// AddAction
_helo addAction ["<t color='#FF9933'>Lift off</t>",fw_fnc_reinfMove, [_helo], 0, false, false, "","player in (crew _target) && (count waypoints _target == 1)"];
