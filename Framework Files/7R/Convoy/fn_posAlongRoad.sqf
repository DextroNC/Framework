/*

	Parameters:
		<-- Origin as Object or Position (default: player)
		<-- Distance Behind as Number (default: 10)
		<-- Optional: Forward Heading as Number (default: direction of Origin Object)

	Description:
	Finds the position on the road centre line a given distance behind the Origin.
	Follows the road network around curves and across segments.
	Returns the position as [x,y,0] (ATL) or [] if no road is nearby.
	If the road dead-ends first, the last point reached is returned.
	Prints debug output to RPT and chat if SR_Debug is true.

*/

// Parameter Init
params [["_subject",player,[objNull,[]]],["_dist",35,[0]],["_heading",-1,[0]]];

// Debug Helper
private _debug = {
	if !(SR_Debug) exitWith {};
	private _msg = format (["posAlongRoad: " + (_this select 0)] + (_this select [1]));
	diag_log _msg;
	if (hasInterface) then {systemChat _msg};
};
["called with subject %1, dist %2, heading %3",_subject,_dist,_heading] call _debug;

private _flat = { [_this#0, _this#1, 0] };

// Helper: direction vector to heading (0-360)
private _vecToDir = { (((_this#0) atan2 (_this#1)) + 360) % 360 };

// Resolve Origin and Heading
private _origin = if (_subject isEqualType objNull) then { getPosATL vehicle _subject } else { _subject };
_origin = _origin call _flat;

if (_heading < 0) then {
	_heading = if (_subject isEqualType objNull) then { getDir vehicle _subject } else { 0 };
};
private _fwd = [sin _heading, cos _heading, 0];
["origin %1, heading %2",_origin,_heading] call _debug;

// Helper: both end points of a road segment (flattened)
private _getEnds = {
	private _i = getRoadInfo _this;
	[(_i#6) call _flat, (_i#7) call _flat]
};

// Find the road segment we are on (or the nearest one within 15 m)
private _road = roadAt _origin;
if (isNull _road) then {
	private _bestD = 1e10;
	{
		private _d = _x distance2D _origin;
		if (_d < _bestD) then { _bestD = _d; _road = _x };
	} forEach (_origin nearRoads 15);
};
if (isNull _road) exitWith {
	["no road within 15 m of %1, aborting",_origin] call _debug;
	[]
};

// Snap Origin onto the segment centre line
(_road call _getEnds) params ["_a", "_b"];
private _ab = _b vectorDiff _a;
private _t = ((((_origin vectorDiff _a) vectorDotProduct _ab) / ((_ab vectorDotProduct _ab) max 0.0001)) min 1) max 0;

private _pos       = _a vectorAdd (_ab vectorMultiply _t);
private _behindA   = (_ab vectorDotProduct _fwd) > 0;                       // true if end A is the one "behind"
private _target    = if (_behindA) then { _a } else { _b };
private _travelDir = vectorNormalized (if (_behindA) then { _ab vectorMultiply -1 } else { _ab }); // walking direction
private _curRoad   = _road;
private _visited   = [_road];
private _remaining = _dist;
private _result    = [];
private _dir       = -1;
["start segment %1, snapped to %2 (t=%3), walking towards %4",_road,_pos,_t toFixed 2,_target] call _debug;

// Walk backwards segment by segment until the distance is used up
for "_i" from 1 to 100 do {
	private _segLen = _pos vectorDistance _target;
	if (_segLen > 0.01) then { _travelDir = vectorNormalized (_target vectorDiff _pos) };
	["step %1: segment %2, %3 m to node, %4 m remaining",_i,_curRoad,_segLen toFixed 1,_remaining toFixed 1] call _debug;

	if (_segLen >= _remaining) exitWith {
		_result = _pos vectorAdd (_travelDir vectorMultiply _remaining);
		_dir = (_travelDir vectorMultiply -1) call _vecToDir;
		["distance used up on segment %1 after %2 step(s)",_curRoad,_i] call _debug;
	};

	_remaining = _remaining - _segLen;
	_pos = _target;

	// Pick the connected segment that continues most straight
	private _bestRoad = objNull;
	private _bestFar = [];
	private _bestScore = -2;
	{
		if !(_x in _visited) then {
			(_x call _getEnds) params ["_p1", "_p2"];
			private _d1 = _p1 distance2D _pos;
			private _d2 = _p2 distance2D _pos;

			if ((_d1 min _d2) < 2) then {           // must actually touch our node
				private _far = if (_d1 <= _d2) then { _p2 } else { _p1 };
				private _score = (vectorNormalized (_far vectorDiff _pos)) vectorDotProduct _travelDir;
				if (_score > _bestScore) then {
					_bestScore = _score;
					_bestRoad  = _x;
					_bestFar   = _far;
				};
			};
		};
	} forEach (roadsConnectedTo [_curRoad, true]);

	if (isNull _bestRoad) exitWith {
		_result = _pos;
		_dir = (_travelDir vectorMultiply -1) call _vecToDir;
		["dead end at %1, %2 m still remaining",_pos,_remaining toFixed 1] call _debug;
	};

	["advancing to segment %1 (straightness %2)",_bestRoad,_bestScore toFixed 2] call _debug;
	_visited pushBack _bestRoad;
	_curRoad = _bestRoad;
	_target  = _bestFar;
};

if (_result isEqualTo []) then {
	_result = _pos;
	_dir = (_travelDir vectorMultiply -1) call _vecToDir;
	["iteration cap reached, returning last node %1",_pos] call _debug;
};

["result %1, direction %2, %3 m straight-line from origin",_result,_dir toFixed 1,(_result distance2D _origin) toFixed 1] call _debug;
[_result, _dir]
