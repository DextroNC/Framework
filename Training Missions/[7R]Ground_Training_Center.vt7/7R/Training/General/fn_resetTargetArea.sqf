/*
	Parameters:
	<-- Trigger as Object
	<-- Doors as Boolean
	<-- Annimation as Integer
	<-- Terminal as Object

	Description:
		Resets all popup targets in an area.
	
	Example (Trigger onActivation):
		nul = [thisTrigger] spawn fw_fnc_resetTargetArea;

*/
// Server only execute
if(!isServer) exitWith {};

// Parameter Init
params ["_trigger",["_doorClose",false],["_annimation",1],["_terminal",objNull]];

// Get Radius
private _area =triggerArea _trigger;
_area resize 2;
private _side = (selectMax _area);
private _radius = sqrt ((_side^2) + (_side^2));

// Get Targets
private _targets = (_trigger nearObjects ["TargetBootcampHumanSimple_F", _radius]) inAreaArray _trigger;

[_targets,_annimation] spawn fw_fnc_setTargets;

// Close Doors
if (_doorClose) then {
	_logic =  createVehicle ["LaserTargetCBase",(getPos _trigger), [], 0, "NONE"];
	_logic setVariable ["radius",_radius];
	_logic setvariable ["Door",0];
	_logic setvariable ["Hatch",0];
	_return = [_logic,nil,true] call BIS_fnc_moduleDoorOpen;
};

// Terminal Reset
if (!isNull _terminal) then {
	_terminal setVariable ["SR_Test",false,true];
};