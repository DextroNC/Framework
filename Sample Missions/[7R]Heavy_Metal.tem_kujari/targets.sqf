// Server Only
if (!isServer) exitWith {};

//Parameter Init
params ["_mode","_object","_range",["_hitSmall",5],["_damageBig",1]];
hitSmall = _hitSmall;
damageBig = _damageBig;

// Create Target Arrays
_targets =  position _object nearObjects ["TargetBootcampHumanSimple_F", _range];
_bigTargets =  [];
_smallTargets = [];

// Exit if no Targets are in the Area
if (count (_targets) == 0) exitWith {"Error: No Targets in the Area" remoteExec ["systemChat",0];};

// Sort Targets
{
	if (typeOf _x == "TargetBootcampHumanSimple_F") then {
		_smallTargets append [_x];
	};
	if (typeOf _x == "SR_PopUpTarget_Big") then {
		_bigTargets append [_x];
	};
	_x removeAllEventHandlers "hit";
	_x removeAllEventHandlers "HandleDamage";
	_x setVariable ["SR_Hit",0];
} forEach _targets;

// Inline Small Targets
FNC_SmallTarget = {
	if (count _this == 0) exitWith {};
	{
		_x addEventHandler ["HandleDamage", {false}];
		_x addEventHandler ["hit", {
			params ["_t"];
			private "_c";
			_c = _t getVariable ["SR_Hit",0];
			if (_c >= hitSmall) then {
				_t animate ["terc", 1];
				private "_s";
				_t setVariable ["SR_Hit",0];
			} else {
				_t setVariable ["SR_Hit", (_c + 1)];
			};			
		}];
		_x animate ["terc", 0];
	} forEach _this;
};
// Inline Big Targets
FNC_BigTarget = {
	if (count _this == 0) exitWith {};
	{
		_x addEventHandler ["HandleDamage", {false}];
		_x addEventHandler ["hit", {
			params ["_t","_source", "_damage"];
			if (_damage > damageBig) then {
				_t animate ["terc", 1];
			};
		}];
		_x animate ["terc", 0];
	} forEach _this;
};

// Decide Mode
switch (_mode) do {
	// Reset Targets
	case 0: {
		{
			_x animate ["terc", 1];
		} forEach (_smallTargets + _bigTargets);
	};
	// Set Targets
	case 1: {
		_smallTargets spawn FNC_SmallTarget;
		_bigTargets spawn FNC_BigTarget;
	};
};