/*
	Parameters:
		<-- Bomb as Object
		<-- Opt: Defuse Timer as Integer (time to defuse until start) - default: 30
		<-- Opt: Trigger Timer as Integer (time until it explodes regardless) - default: -1
		<-- Opt: Strengh as Integer (1-3; Artillery Shell, Bomb, Nuke) - default: 1
		<-- Opt: Wires to Cut to Defuse as Array of Strings - default: One Random
		
		- Bomb has 5 wires (blue, red, green, yellow, white)
		- Requires ACE_Defuser to defuse
		
	Example:
		nul = [] spawn fw_fnc_bombInit		
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
Params ["_bomb","_defuse","_trigger","_level","_wires"];
private _colors = ["blue","red","green","yellow","white"];
private "_pad";
if(isNil"_defuse") then {_defuse = 30};
if(isNil"_trigger") then {_trigger = -1};
if(isNil "_level") then {_level = 1};
if(isNil "_wires") then {selectRandom _colors};
private _crit = ["blue","red","green","yellow","white"] - _wires;

// Add Actions
[_bomb] remoteExec ["fw_fnc_bombAction",-2,true];

// Play Sound
_pad = "HeliHEmpty" createVehicle (position _bomb);
[_pad] spawn {(_this select 0) say3D ["bomb", 20, 1];};

// Bomb Status Loop
[{
	// Parameter Init
	Params ["_args","_handle"];
	_args params ["_bomb","_defuse","_trigger","_level","_wires","_pad","_crit"];

	// Bomb Timer Check
	if (_timer != -1) then {
		if (CBA_missionTime > _trigger) then {_bomb setVariable ["bombSetOff",true,true];};
	};
	
	// Defuse Timer Check
	if (((_bomb getVariable ["defuseStart", CBA_missionTime]) - CBA_missionTime) > _defuse) then {_bomb setVariable ["bombSetOff",true,true];};
	
	// Check Wires and Defuse Status
	private _wiresCut = _bomb getVariable ["wiresCut",[]];
	if (count _wiresCut > 0) then {
		{
			if (!(_crit)) then {_bomb setVariable ["bombSetOff",true,true];};
		}forEach _wiresCut;
		if (_wiresCut in _wires && !(_bomb getVariable ["bombSetOff",false])) then {_bomb setVariable ["bombDefused",true,true];};
	};

	// Execute Defuse or Detonation
	if (_bomb getVariable ["bombDefused",false]) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		["SideChatSS", [[SR_Side, "HQ"], "Bomb Defused."]] spawn CBA_fnc_globalEvent; 
		deleteVehicle _pad;
	};
	if (_bomb getVariable ["bombSetOff",false]) exitWith {
		deleteVehicle _pad;
		switch (_level) do {
		case 1: {"Sh_82mm_AMOS" createVehicle (position _bomb);};
		case 2: {"Bo_GBU12_LGB" createVehicle (position _bomb);};
		case 2: {[position _bomb, 100, 500] call rhs_fnc_ss21_nuke};
		deleteVehicle _bomb;
		[_handle] call CBA_fnc_removePerFrameHandler
		};	
	};
} , 1, [_bomb,_defuse,_trigger,_level,_wires,_pad,_crit]] call CBA_fnc_addPerFrameHandler;
