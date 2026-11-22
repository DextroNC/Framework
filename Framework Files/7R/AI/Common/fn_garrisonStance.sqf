/*
	Parameters:
		<-- Unit as Object

	Return:
	--> None

	Description:
		Turns a unit standing on a building position toward the best view out of the building
		and picks a stance for how exposed the spot is.

	Example:
		[_unit] call fw_fnc_garrisonStance;
*/
// Parameter Init
params ["_unit"];

if (!local _unit || !alive _unit) exitWith {};

// Find the building the unit stands in
private _nearBuildings = nearestObjects [_unit, ["Building"], 50];
private _index = _nearBuildings findIf {
	(_x buildingPos -1) findIf {_unit distance2D _x <= 1} >= 0
};
private _building = if (_index >= 0) then {_nearBuildings select _index} else {nearestBuilding _unit};

private _eye = eyePos _unit;
private _blocked = {
	params ["_end"];
	(lineIntersectsWith [_eye, _end, _unit]) findIf {_x isKindOf "Building"} >= 0
};

// Probe 8 headings around the building
private _toBuilding = _unit getDir _building;
private _wall = [];
private _short = [];
private _in = [];
private _out = [];
for "_i" from 0 to 7 do {
	private _heading = ((getDir _building) + _i * 45) mod 360;
	private _near = _eye vectorAdd [(sin _heading) * 3, (cos _heading) * 3, 0];
	private _far = _eye vectorAdd [(sin _heading) * 10, (cos _heading) * 10, 0];
	if ([_near] call _blocked) then {
		_wall pushBack _heading;
	} else {
		if ([_far] call _blocked) then {
			_short pushBack _heading;
		} else {
			// Smallest difference between two compass headings
			private _angle = abs ((((_heading - _toBuilding) + 540) mod 360) - 180);
			if (_angle >= 120) then {_out pushBack _heading} else {_in pushBack _heading};
		};
	};
};

// Face the best available view
private _view = [];
{
	if (_x isNotEqualTo []) exitWith {_view = _x};
} forEach [_out, _in, _short, _wall];
_unit doWatch (_unit getPos [100, selectRandom _view]);

// Stance by exposure
private _open = count _out + count _in;
private _sky = !([_eye vectorAdd [0, 0, 10]] call _blocked);
private _stance = "";
if (_sky) then {_stance = "MIDDLE"};
if (_open >= 5 && {random 1 < 0.8}) then {_stance = "MIDDLE"};
if (_open >= 7) then {
	_stance = if (random 1 < 0.8) then {"MIDDLE"} else {"DOWN"};
};
if (_stance isNotEqualTo "") then {_unit setUnitPos _stance};
