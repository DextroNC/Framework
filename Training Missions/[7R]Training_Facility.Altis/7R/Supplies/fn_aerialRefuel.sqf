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
Params ["_spawn", "_height" ,"_callsign"];
_type = "atm_C130_JT";

// Start Message
[[SR_Side, "HQ"],"Aerial Tanker dispatched..."] remoteExec ["sideChat", 0];

// Calculate Spawn and End Point
_dir = MarkerDir _spawn;
_pos = markerPos _spawn;
_dirSpawn = _dir - 180;
_spawnPos = [_pos, 16000,_dirSpawn] call BIS_fnc_relPos;
_spawnPos = [_spawnPos select 0, _spawnPos select 1, _height];
_wpPos = [_pos, 16000, _dir] call BIS_fnc_relPos;

// Spawn Plane and Init
_plane = [_spawnPos, _dir, _type, SR_Side] call bis_fnc_spawnVehicle;
_planeGroup = _plane select 2;
_v = _plane select 0;
_v flyInHeightASL [ _height,  _height,  _height];

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
	_x setSpeedMode "LIMITED";
	_x setVariable ["asr_ai_exclude", true]
}forEach units _planeGroup;

// Send to waypoint
_v doMove _wpPos;
sleep 3;

// Check if all Cargo is dropped and send Plane to End Pos
[{(_this select 0) distance2D  (_this select 1) < 1000}, {
	Params ["_v", "_wpPos","_height"];
	[_v,"Leaving the Area."] remoteExec ["sideChat", 0];
	_v flyInHeightASL [ (_height + 500),  (_height + 500),  (_height + 500)];
}, [_v,_wpPos,_height]] call CBA_fnc_waitUntilAndExecute;

// Clean up and delete Plane
[{((_this select 0) distance2D  (_this select 1)) < 500 || !alive (_this select 0)}, {
	Params ["_v","_wpPos"];
	[leader driver _v] call fw_fnc_deleteVehicle;
}, [_v, _wpPos]] call CBA_fnc_waitUntilAndExecute;

