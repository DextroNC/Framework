/*
	Parameters:
		<-- Spawn Object as Object (Helipad)
		<-- Helicopter Classname as String
		<-- Callsign as String
		<-- Cooldown as Integer
		<-- Array of 
			[Classname Pilot as String, Classname Co-Pilot as String]
		
	Description:
		AI based Reinforments Transport Helicopter.
		
	Example (exec on init of Helipad):
		null = [this,"RHS_CH_47F","RODEO 1-1",0,["B_Helipilot_F", "B_Helicrew_F"]] spawn fw_fnc_reinfInit;
*/

// Server only exec
if (!isServer) exitWith {};

// Parameter Init
params ["_spawn","_class","_call","_cool",["_pilot","_crew"];

sleep 10;

// Main-Loop 
while {true} do {
	sleep 2;

	// Clear spawn position
	{
		deleteVehicle _x;
	}forEach (nearestObjects [_spawn,["AllVehicles"],7]);

	// Create new empty Helicopter
	_helo = _class createVehicle [0,0,0];
	_helo setDir (direction _spawn);
	_helo setPosASL (getPosASL _spawn);
	_helo allowDamage false;
	_helo setDamage 0;
	
	// Populate Helicopter with Pilot
	_group = createGroup SR_Side;
	_pilot createUnit [[0,0,0],_group];
	(units _group select 0) setUnitRank "SERGEANT";
	leader _group moveinDriver _helo;
	leader _group assignAsDriver _helo;
	
	// Spawn Crew
	_slots = allTurrets [_helo,false];
	
	{
		_crewman = _group createUnit [_crew, [0,0,0], [], 0, "NONE"];
		_crewman moveInTurret [_helo,_x];
		_crewman assignAsTurret  [_helo,_x];
	}forEach _slots;
	_group setGroupIdGlobal [_call];
	
	// Add Action for Lift Off and Ready Message
	[_helo] remoteExec ["fw_fnc_reinfAction", -2, true];
	[leader _group,"On Station for Reinforcement Transport."] remoteExec ["sideChat", 0];
	
	// Remove Helicopter spawn protection
	sleep 10;
	_helo allowDamage true;
	_helo setDamage 0;
	
	// Wait for Helicopter to die
	waitUntil {not alive _helo};
};