/*
	Parameters:
		<-- Helicopter as Object
		<-- Mode - default: Need to be inside; 1: need to be within 15m
	
		Description:
		Adds liftoff action to helicopter
		
		Example:
		none
*/

// Parameter Init
params ["_h","_mode"];

// Add Action to Helicopter

switch (_mode) do {
    case 1: {
		_h addAction ["<t color='#FF9933'>Lift off</t>",{	
                (_this select 0) setVariable ['liftoff',true,true];
		}, [], 0, false, false, "","!(_target getVariable ['liftoff',false])",15];
	};
    default {
		_h addAction ["<t color='#FF9933'>Lift off</t>","(_this select 0) setVariable ['liftoff',true,true]", [], 0, false, false, "","(player in _target) && !(_target getVariable ['liftoff',false])"];
	};
};