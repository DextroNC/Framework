/*
	Parameters:
	<-- Unit as Object
	<-- Count as Integer

	Description:
		Jams weapon of Shooter.
	
	Example (Trigger onActivation):
		nul = [_unit,_count] spawn fw_fnc_jamWeapon;

*/
// Parameter Init
params ["_unit",["_count",5]];

// Clear Eventhandlers
_unit removeAllEventHandlers "Fired";

// Set Jam Counter
_unit setVariable ["SR_Jam",_count];
_unit setVariable ["SR_Fired",0];

// Add Eventhandler
_unit addEventhandler ["Fired",{
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	private _fired = _unit getVariable ["SR_Fired",0];
	if (_fired >=(_unit getVariable ["SR_Jam",5])) then {
		[_unit, currentWeapon _unit] remoteExec ["ace_overheating_fnc_jamWeapon",_unit];
		_unit setVariable ["SR_Fired",0];
		_unit removeAllEventHandlers "fired";
	} else {
		_unit setVariable ["SR_Fired", (_fired + 1)];
	};
}];