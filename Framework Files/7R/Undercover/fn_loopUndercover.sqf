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
	params ["_unit"];
	_addS = 0;
	
	// Get all Near Units
	_list = (position _unit) nearEntities [["Man"], 50];
	{
		_dist = _x distance2D _unit;
		
		// Enemy Forces
		if ([side _x, SR_Side] call BIS_fnc_sideIsEnemy && [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _unit] > 0.5 && !(isPlayer _x)) then {
			_addS = _addS + ((50 - _dist) / 2);
			if (!(currentWeapon _unit isEqualto "")) then {_addS = _addS + ((50 - _dist) / 2)};
		};
		if (side _x == civilian && [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _unit] > 0.75 && !(isPlayer _x)) then {
			_addS = _addS + ((50 - _dist) / 5);
			if (!(currentWeapon _unit isEqualto "")) then {_addS = _addS + 5};
		};
	}forEach _list;
	
	// Process Addition and Reset
	if (_addS > 0) then {
		SR_SuspicionValue = SR_SuspicionValue + _addS;
	} else {
		if (SR_SuspicionValue - 10 < 0) then {
			SR_SuspicionValue = 0;
		} else {
			SR_SuspicionValue = SR_SuspicionValue - 10;
		};
	};
	SR_SuspicionValue = round SR_SuspicionValue;
};

// Fired Eventhandler
private "_ehandl";
_ehandl = _unit addEventHandler ["Fired",{
	SR_SuspicionValue = SR_SuspicionValue + 10;
}];
// Store EH-Index on Unit
_unit setVariable ["SR_EH", _ehandl];


// Inline Cover blown
FNC_Blown = {
	params ["_unit","_handle"];
	// Remote per Frame EH
	[_handle] call CBA_fnc_removePerFrameHandler; 
	
	// Remove Fired EH
	_eh = _unit getVariable ["SR_EH", -1];
	if (_eh >= 0) then {
		_unit removeEventHandler ["Fired", _eh];
	};
	_unit setVariable ["SR_EH", -1];
};

// Detection Loop per Frame Eventhandler
[{
	// Parameter Init
	Params ["_args","_handle"];
	_unit = _args select 0;
	
	// Get Unit Suspicion
	[_unit] spawn FNC_Suspicion;
	if (!(primaryWeapon _unit isEqualTo "") || !(secondaryWeapon _unit isEqualTo "")) then {
		SR_SuspicionValue = 100;
	};
	hint format ["Suspicion Level: %1",SR_SuspicionValue];
		
	// Exit when cover blown
	if (SR_SuspicionValue >= 100 || !(_unit getVariable ["SR_UC",false])) then {
		_unit setCaptive false;
		hint "Cover blown";
		SR_SuspicionValue = 0;
		SR_SuspicionSpotted = CBA_MissionTime;
	};
	
	// Exit Handler if uncover ended
	if (!captive _unit) exitWith {
		[_unit, _handle] spawn FNC_Blown;
	};
} , 1, [_unit]] call CBA_fnc_addPerFrameHandler;