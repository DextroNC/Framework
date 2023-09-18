// Parameter Init
params ["_new","_old"];

// Carry over Unit Variable
private _class = _old getVariable ["SR_Class","R"];
_new setVariable ["SR_Class", _class, true];
_new setUnitLoadout (_old getVariable ["SR_Loadout",[]]);

// Height Adjustment for Carrier (check height in editor with: hint format ["%1", getPosASL player]. The third value in the array is the height. Change the height accordingly.)
_height = 0;

// Adjust Height
if (_height > 0) then {
	hint "adjusting height";
	private _pos = getPosASL _new;
	_new setPosASL [_pos select 0, _pos select 1, _height];
};

/// Night Unit Trait Adjustment
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	switch (_class) do {
	    case "Sniper": {};
		case "Spotter": {};
		default {_new setUnitTrait ["camouflageCoef",0.5];};
	};
};