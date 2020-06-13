/*
	Parameters:
		<-- Unit as Object
		
	Description:
		Manages Suicide Bombers.

*/
// Parmeter Init
params ["_unit"];

// Diasble Lamps Danger.doFSM
group _unit setVariable ["lambs_danger_disableGroupAI",true];
_unit setVariable ["lambs_danger_disableAI",true];

//Per Frame Handler
[{
	// Parameter Init
	Params ["_args","_handle"];
	_unit = _args select 0;
	_target = _unit getVariable "sb_target";

	// Remove Per Frame Event Handler if Bomber is dead
	if (!alive _unit) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

	// Check if target is already assigned if not search for one
	if (isNil "_target") then {
		// Find all Near Units
		_near = nearestObjects [_unit,["CAManBase"],75];
		_near = _near - [_unit];

		// Manipulate near unit array to only contain player side units
		{
			if(!(side _x == SR_Side)) then {_near = _near - [_x];};
		} forEach _near;
		
		// If players are close change to chacing	
		if (count _near > 0) then {
			_target = _near select 0;
			_unit setVariable ["sb_target",_target,true];
		};	
	} else {
		// Exit the script when the unit is moving to its target
		if (_unit getVariable ["is_exploding", false]) exitWith {};

		if (!alive _target) exitWith {_unit setVariable ["sb_target",nil,true];};
		_grp = group _unit;
		if (count (waypoints _grp) > 1) then {
			{
				deleteWaypoint ((waypoints _grp) select 0);
			} forEach waypoints _grp;
		};
		_unit doMove (position _target);
		if (_unit distance2d _target < 25) then {
			// Sets the exploding var to true (prevents multiple explosion)
			_unit setVariable ["is_exploding", true];
			
			[_unit,_handle] spawn fw_fnc_civBomberAction;
		};	
	};
} , 2, [_this select 0]] call CBA_fnc_addPerFrameHandler;