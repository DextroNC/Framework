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
_args Params ["_target", "_spawn", "_height" ,"_callsign","_static"];
_type = "RHS_C130J";

// Check if Static Mode and overwrite Altitude
if (isNil "_static") then {_static = false;};
if (_static) then {
	_height = 150;
};

// Start Message
["SideChatSS", [[SR_Side, "HQ"], "Paradrop Insertion started..."]] spawn CBA_fnc_globalEvent; 

// Calculate Spawn and End Point
_targetPos = markerPos _target;
_dir = (markerPos _spawn) getDir _targetPos;
_dirSpawn = _dir - 180;
_spawnPos = [_targetPos, 4500,_dirSpawn] call BIS_fnc_relPos;
_spawnPos = [_spawnPos select 0, _spawnPos select 1, _height];
_wpPos = [_targetPos, 3000, _dir] call BIS_fnc_relPos;
_wpPos2 = [_targetPos, 500, _dir] call BIS_fnc_relPos;

// Spawn Plane and Init
_plane = [_spawnPos, _dir, _type, SR_Side] call bis_fnc_spawnVehicle;
_planeGroup = _plane select 2;
_v = _plane select 0;
if (!_static) then {
	_v flyInHeightASL [ _height,  _height,  _height];
};
_v allowDamage false;

// Make AI non reactive
_planeGroup setBehaviour "CARELESS"; 
leader _planeGroup setGroupIdGlobal [_callsign];
{
	_x disableAi "FSM";
	_x disableAi "TARGET";
	_x disableAi "AUTOTARGET";
	_x disableAi "AUTOCOMBAT";
	_x disableAi "COVER";
	_x disableAi "SUPPRESSION";
	_x setVariable ["asr_ai_exclude", true]
}forEach units _planeGroup;

// Send to waypoint
_v doMove _targetPos;
sleep 3;

// Cargo Slot offset for C-130
_slot = 2;

// Teleport People into Plane
{
	if (_x distance2D _term < 100) then {
		["ParaPort", [_v,_x,_slot], _x] call CBA_fnc_targetEvent;
		_slot = _slot + 1;
		_x assignAsCargo _v;
		[_x] orderGetIn true;
	};
} forEach (allPlayers - entities "HeadlessClient_F");

// Loop Target update and Ramp opening
while {_v distance2D _targetPos > 150} do {
	_v doMove _targetPos;
	if (_v distance2D _targetPos < 1500) then {
		_v animate ["Door_1_source",1];
	}; 
	sleep 1;
};
_v doMove _wpPos2;

// Drop all Units in Cargo
if (_static) then {
	[_v] spawn rhs_fnc_infantryParadrop;
} else {
	{
		private _delay =  (1/(((speed _v) max 55)/150));
		_x disableAI "MOVE";
		_x disableCollisionWith _v;
		moveout _x;
		unassignVehicle _x;
		[_x] allowGetIn false;
		_x setDir (getDir _v);
		sleep _delay;
		_x enableAI "MOVE";
	} forEach assignedCargo _v;
};


// Check if all Cargo is dropped and send Plane to End Pos
[{(count crew (_this select 0))< 3}, {
	Params ["_v", "_wpPos"];
	["SideChatSS", [[playerSide, "HQ"], "All units dropped, Out."]] spawn CBA_fnc_globalEvent; 
	_v animate ["Door_1_source",0];
	_v doMove _wpPos;
}, [_v,_wpPos]] call CBA_fnc_waitUntilAndExecute;

// Clean up and delete Plane
[{((_this select 0) distance2D  (_this select 1)) < 500 || !alive (_this select 0)}, {
	Params ["_v","_wpPos"];
	[leader driver _v] call fw_fnc_deleteVehicle;
}, [_v, _wpPos]] call CBA_fnc_waitUntilAndExecute;

