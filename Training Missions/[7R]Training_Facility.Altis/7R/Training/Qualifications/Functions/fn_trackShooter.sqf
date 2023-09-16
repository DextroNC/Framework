/*
	Parameters:
		<-- Shooter as Object

	Return:
		--> Eventhandler Handle

	Description:
		Fired EH for Shooter to track shots fired. 

*/

// Parmeter Init
params ["_shooter"];

_ehandl = _shooter addEventHandler ["Fired",{
	params ["_u"];
	private "_s";
	_s = _u getVariable ["SR_Fire", 0];
	_u setVariable ["SR_Fire", (_s + 1)];
}];
_ehandl

