/*
	Parameters:
		<-- Target Marker Position as String
		<-- Spawn Pos Marker as String
		<-- Altitude as Integer (ABOVE SEE LEVEL)
		<-- Callsign as String
		<-- Opt. Static-Line Drop as Boolean (default: false)

		Static-Line Drop will ignore Height and fly on default height.
		RHS C-130 Hardcoded
		
	Decription:
		Spawns plane and teleport players into in order to autodrop them at a drop zone. Either high altitude or static line.
		For Static Line do not equip parachute.
		
	Example:
		this addAction ["<t color='#FF0000'>Start Paradrop All Near Units</t>",{nul = _this spawn fw_fnc_paraDrop}, ["dz","paraStart",2500,"Windrunner 1-1",true], 0, true, true, "", "leader player == player", 3];  

*/

// Parameter Init
Params ["_term", "_caller", "_id","_args"];
_args Params ["_target", "_spawn", "_height" ,"_callsign",["_static", false]];
private _class = SR_Support_Assets select 0;
private _badgeSize = 24;

// Create Unit array for Drop and Count Units
private _units = [];
private _count = {
	if (_x distance2d _term < 100) then {_units pushBack _x; true} else {false};
} count (allPlayers - entities "HeadlessClient_F");

// Sort Units by Groups
_units = [_units] call fw_fnc_sortUnitsByGroup;

// Overwrite Height for Static Drop and Select Plane Class
if (_static) then {
	_height = 150;
	_badgeSize = 16;
} else {
	// Select Plane
	private _array = [_class, (SR_Support_Assets select 1)] call fw_fnc_paraDropPlaneSection;
	_class = _array select 0;
	_badgeSize = _array select 1;
};

// Calculate Spawn and End Point
private _targetPos = markerPos _target;
private _dir = (markerPos _spawn) getDir _targetPos;
private _dirSpawn = _dir - 180;
private _spawnPos = [_targetPos, 4500,_dirSpawn] call BIS_fnc_relPos;
_spawnPos = [_spawnPos select 0, _spawnPos select 1, _height];
private _end = [_targetPos, 3000, _dir] call BIS_fnc_relPos;
private _dropWP = [_targetPos, 750, _dir] call BIS_fnc_relPos;


// Initiate Drop
["Paradrop Insertion initiated.", "Paradrop Initiated"] spawn fw_fnc_info;

// Split Group if plane is too small
private _unitCount = count _units;
private _split = ceil _unitCount / _badgeSize;

// Spawn Planes and exectute Drops in Badges
// Split into Badges
for "_i" from 1 to (_split + 1) do {
	private _badge = [];
	{
		// Exit on full Badge
		if (_forEachIndex > _badgeSize - 1) exitWith {};
		// Add Unit to Badge
		_badge pushBack _x;
	}forEach _units;
	_units = _units - _badge;
	// Call Plane
	[_targetPos, _spawnPos, _dropWP,  _end, _dir, _badge, _class,  _height, _static] spawn fw_fnc_paraDropPlane;
	sleep 20;
};
