// Parameter Init
params ["_new","_old"];

// Combat Log Entry
if (!isNull _old) then {
	_str = (name _new) + " has rejoined the Action.";
	["CombatLog", ["REINF", _str]] call CBA_fnc_globalEvent;
};

// Carry over Unit Variable
private _class = _old getVariable ["SR_Class","R"];
_new setVariable ["SR_Class", _class, true];

_new setUnitLoadout (_old getVariable ["SR_Loadout",[]]);

// Fix potential duplicate-id radio issue by given the player new radios.
// https://github.com/IDI-Systems/acre2/issues/852#issuecomment-555198721
_has_117 = [_new, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio;
_has_148 = [_new, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio;
_has_152 = [_new, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio;
_has_343 = [_new, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio;

// Remove all radios on this unit.
{
	_radio_type = _x;
	_has_radio = true;
	while {_has_radio} do {
		_radio = [_radio_type, _new] call acre_api_fnc_getRadioByType;
		if (!isNil "_radio") then {
			_new removeItem _radio;
		} else {
			_has_radio = false;
		};
	}
} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343"];

// Give this player new radios.
if (_has_117) then {_new addItem "ACRE_PRC117F"};
if (_has_148) then {_new addItem "ACRE_PRC148"};
if (_has_152) then {_new addItem "ACRE_PRC152"};
if (_has_343) then {_new addItem "ACRE_PRC343"};

// Height Adjustment for Carrier (check height in editor with: hint format ["%1", getPosASL player]. The third value in the array is the height. Change the height accordingly.)
_height = 0;

// Adjust Height
if (_height > 0) then {
	hint "adjusting height";
	private _pos = getPosASL _new;
	_new setPosASL [_pos select 0, _pos select 1, _height];
};

// End Spectator
[false] call acre_api_fnc_setSpectator;
["Terminate"] call BIS_fnc_EGSpectator;
["ace_common_hideObjectGlobal", [_new,false]] call CBA_fnc_serverEvent;

// Night Unit Trait Adjustment
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	switch (_class) do {
	    case "Sniper": {};
		case "Spotter": {};
		default {_new setUnitTrait ["camouflageCoef",0.5];};
	};
};

// FTL Rank Reset
 if (_old getVariable ["ACE_FTL",""] in ["RED","BLUE"]) then {
	 _new setUnitRank "PRIVATE";
 };
