/*

	Parameters:
		<-- Terminal as Object
		<-- Range as Integer


	Creates Targets

*/
// Parameter Init
//params ["_terminal",["_range",100]];
params ["_terminal"];
_range = 200;
// Find targets
_targets = position _terminal nearObjects ["TargetE", _range];

// Make targets invinsible
{
	_x allowDamage false;
}forEach _targets;

// Clear Hitboxes
{
	deleteVehicle _x;
}forEach ((position _terminal) nearObjects ["Steel_Plate_F", _range]);

// Inline
InitTarget = {
	// Parameter Init
	params ["_type","_object","_offset","_hits"];
	// Target creation and placement
	_target = _type createVehicle [0,0,0]; 
	_target enableSimulation false;
	_target attachTo [_object, _offset];
	_target setVariable ["SR_Count",_hits];
	// Eventhandler for kill
	_eh = _target addEventHandler ["hit", {
		params ["_t"];
		private "_c";
		_c = _t getVariable ["SR_Hit",0];
		_t setVariable ["SR_Hit", _c + 1];
		if (_t getVariable ["SR_Hit",0] == _t getVariable ["SR_Count", 1]) then {
			deleteVehicle _t;
		};		
	}];
};

// Init Targets
{
	// Head
	["Steel_Plate_S_F",_x,[0,0.38,0.7],1] spawn InitTarget;
	// Body
	["Steel_Plate_F",_x,[0,0.38,0.2],2] spawn InitTarget;
}forEach _targets;

hint "Course Loaded";