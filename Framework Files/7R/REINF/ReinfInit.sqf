/*
params [_spawn Pad, _chopper, _callsign,_cooldown]
	<-- Spawn Pad (name of invisible Helipad)
	<-- Chopper
	<-- Callsign
	<-- Cooldown
	<-- Crew as Array ["PilotClassname", "CrewClassname"]
	
	Init example:
	null = [this,"RHS_CH_47F","RODEO 1-1",0,["B_Helipilot_F", "B_Helicrew_F"]] execVM "7R\REINF\ReinfInit.sqf"
*/
if (!isServer) exitWith {};
_spawn = _this select 0;
_chopper = _this select 1;
_callsign = _this select 2;
_cooldown = _this select 3;
_pilot = _this select 4 select 0;
_crew = _this select 4 select 1;

_dir = direction _spawn;

sleep 10;

while {true} do {
	sleep 2;
	
	_old = nearestObjects [_spawn,["AllVehicles"],7];
	{
		deleteVehicle _x;
	}forEach _old;

	_helo = _chopper createVehicle ([0,0,0]);
	_helo setDir _dir;
	_helo setPosASL (getPosASL _spawn);
	_helo allowDamage false;
	_helo setDamage 0;
	
	_group =createGroup SR_Side;
	_pilot createUnit [[0,0,0],_group];
	(units _group select 0) setUnitRank "SERGEANT";
	leader _group moveinDriver _helo;
	leader _group assignAsDriver _helo;
	
	_slots = allTurrets [_helo,false];
	
	{
		_crewman = _group createUnit [_crew, [0,0,0], [], 0, "NONE"];
		_crewman moveInTurret [_helo,_x];
		_crewman assignAsTurret  [_helo,_x];
	}forEach _slots;
	_group setGroupIdGlobal [_callsign];
	
	["SideChatSS", [leader _group, "On Station for Reinforcement Transport."]] call CBA_fnc_globalEvent; 
	
	
	[[[_helo],"7R\REINF\ReinfAction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
	sleep 10;
	_helo allowDamage true;
	_helo setDamage 0;
	waitUntil {not alive _helo};
};