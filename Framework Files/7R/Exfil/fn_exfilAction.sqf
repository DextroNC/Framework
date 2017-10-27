/*
	Parameters:
		<-- Helicopter as Object
	
		Description:
		Adds liftoff action to helicopter
		
		Example:
		none
*/

// Parameter Init
params ["_h"];

// Add Action to Helicopter
_h addAction ["<t color='#FF9933'>Lift off</t>","(_this select 0) setVariable ['liftoff',true,true]", [], 0, false, false, "","(player in _target) && !(_target getVariable ['liftoff',false])"];
