/*
	Parameters:
	<-- Trigger as Object
	<-- Terminal as Object
	<-- TargetType as joinString
	<-- Sequence as Boolean

	Description:
		Sets all popup targets in an area.
	
	Example (Trigger onActivation):
		nul = [_trigger, _terminal, _targetType] spawn fw_fnc_setTargetArea;

*/
// Server only execute
if(!isServer) exitWith {};

// Parameter Init
params ["_trigger",["_terminal",objNull],["_targetType","SR_PopUpTarget_1"],["_sequence",false]];

// Get Radius
private _area =triggerArea _trigger;
_area resize 2;
private _side = (selectMax _area);
private _radius = sqrt ((_side^2) + (_side^2));

// Get Targets
private _targets = (_trigger nearObjects [_targetType, _radius]) inAreaArray _trigger;

// Terminal Set
if (!isNull _terminal) then {
	_terminal setVariable ["SR_Test",true,true];
};

// SetTargets
if (_sequence) then {
	// Target Loop for sequenced targets
	{
		// Set Target
		[[_x], 0] spawn fw_fnc_setTargets;
		// Wait for next Target
	//	waitUntil {(_x animationPhase "Terc" == 0) || !(_terminal getVariable ["SR_Test", false])};
	sleep 2;
		waitUntil { (_x animationPhase "Terc" == 1)};
		// Exit on End
		if (!(_terminal setVariable ["SR_Test", false])) exitWith {};
		// delay
		sleep 1;
	} forEach ([_targets, [_terminal], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy);
} else {
	// Set all Targets at once
	[_targets, 0] spawn fw_fnc_setTargets;
};

// Terminal Reset
if (!isNull _terminal) then {
	_terminal setVariable ["SR_Test",false,true];
};
