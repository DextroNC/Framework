/*
	Parameters:
		<-- Unit as Object
	
	Description:
		Manages the suspicion level and evaluates

*/
// Parameter init
params ["_unit"];

// Suspicion
FNC_Suspicion = {
	// Parameter Init
	params ["_unit","_faction"];
	if (isNil "SR_SuspicionValue") then {SR_SuspicionValue = 0};
	_addS = 0;
	
	// Get all Near Units
	_list = (position _unit) nearEntities [["Man"], 50];
	{
		// Exclude other Players
		if (isPlayer _x) exitWith {};
		// Enemy Forces
		if ([side _x, side _unit] call BIS_fnc_sideIsEnemy && [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _unit]) then {
			_dist = _x distance2D _unit;
			_addS = ((50 - _dist) / 2);
			if (!(currentWeapon _unit isEqualto "")) then {_addS = _addS + 5};
		};
		if (side _x == civilian) then {
			_dist = _x distance2D _unit;
			_addS = ((50 - _dist) / 5);
			if (!(currentWeapon _unit isEqualto "")) then {_addS = _addS + 5};
		};
	}forEach _list;
	
	// Process Addition and Reset
	if (_addS == 0) then {
		SR_SuspicionValue = SR_SuspicionValue - 10
	} else {
		SR_SuspicionValue = SR_SuspicionValue + _addS;
	};
};

// Firing Eventhandler


[{
	// Parameter Init
	Params ["_args","_handle"];
	_unit = _args select 0;
	
	// Exit Handler if uncover ended
	if (!captive _unit) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
	
	// Get Unit Suspicion
	[_unit] spawn FNC_Suspicion;
	hint format ["Suspicion Level: %1",SR_SuspicionValue];
	
	// Exit when cover blown
	if (SR_SuspicionValue >= 100) then {
		_unit setCaptive false;
		hint "Cover blown";
	};
	
	// Exit Handler if uncover ended
	if (!captive _unit) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
} , 1, [_unit]] call CBA_fnc_addPerFrameHandler;