/*
Description:
	Function for automated firing range.

this addAction ["Activate firing range", "7R\Training\Foxtrot\fn_firing_range.sqf", [], 10, true, true, "", "_this in _target"];
*/

// Shooting Targets Arrays
_infantry_targets = [
	f_target_1,	f_target_2,	f_target_3,	f_target_4,	f_target_5,
	f_target_6,	f_target_7,	f_target_8,	f_target_9,	f_target_10,
	f_target_11, f_target_12, f_target_13, f_target_14, f_target_15,
	f_target_16, f_target_17, f_target_18, f_target_19, f_target_20
	];

_vehicle_targets = [
	f_board_1,	f_board_2,	f_board_3,	f_board_4,	f_board_5,
	f_board_6,	f_board_7,	f_board_8,	f_board_9,	f_board_10,
	f_board_11,	f_board_12,	f_board_13,	f_board_14,	f_board_15,
	f_board_16,	f_board_17,	f_board_18,	f_board_19,	f_board_20
	];

_infantry_spawn_chance = [true, false, false, false, false]; // 20%

_player = _this select 1;

"Firing range active" remoteExec ["systemChat", _player];

{ _x hideObject true; } forEach _vehicle_targets;
{ _x hideObject true; } forEach _infantry_targets;

_current = 0;
_score = 0;
_possible_score = 0;

while {_current < 10} do {
	_target = selectRandom _vehicle_targets;
	_target animate["terc", 0];

	_target hideObject false;
	_possible_score = _possible_score + 5;

	_spawn_infantry = selectRandom _infantry_spawn_chance;

	if (_spawn_infantry) then {
		_infantry = selectRandom _infantry_targets;

		_infantry hideObject false;
		_possible_score = _possible_score + 1;


		_infantry addEventHandler ["hit", {
			params ["_unit", "_source", "_damage", "_instigator"];

			_hits = _unit getVariable ["SR_Hit", []];

			_already_hit = (_hits find _instigator) != -1;
			if (!_already_hit) then {
				[_hits, _instigator] call BIS_fnc_arrayPush;
				_unit setVariable ["SR_Hit", _hits];
			};
		}];

	};

	// Hit EH
	_target addEventHandler ["hit", {
		params ["_unit", "_source", "_damage", "_instigator"];

		_hits = _unit getVariable ["SR_Hit", []];

		_already_hit = (_hits find _instigator) != -1;
		if (!_already_hit) then {
			[_hits, _instigator] call BIS_fnc_arrayPush;
			_unit setVariable ["SR_Hit", _hits];
		};
	}];

	sleep 30;

	_target hideObject true;

	_current = _current + 1;
};

// Count score for vehicle hits.
{
	_hitters = _x getVariable ["SR_Hit", []];

	_hitter_index = _hitters find _player;
	_hitter_found = _hitter_index != -1;
	if (_hitter_found) then {
		_hitters deleteAt _hitter_index;
		_x setVariable ["SR_Hit", _hitters];
		_score = _score + 5;
	};
} forEach _vehicle_targets;

// Count score for infantry hits.
{
	_hitters = _x getVariable ["SR_Hit", []];

	_hitter_index = _hitters find _player;
	_hitter_found = _hitter_index != -1;
	if (_hitter_found) then {
		_hitters deleteAt _hitter_index;
		_x setVariable ["SR_Hit", _hitters];
		_score = _score + 1;
	};
} forEach _infantry_targets;

sleep 1;
[[_vehicle_targets]] spawn fw_fnc_resetPopTargets;
{ _x hideObject false; } forEach _vehicle_targets;
{ _x hideObject false; } forEach _infantry_targets;

"Firing range deactivated" remoteExec ["systemChat", _player];
_text = format ["Score: %1 / %2", _score, _possible_score];
_text remoteExec ["systemChat", _player];
