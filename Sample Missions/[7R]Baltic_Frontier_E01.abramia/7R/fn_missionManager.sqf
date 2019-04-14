/*		
	Parameters:
		<-- Phase Number as Integer
		
	Description:
	Modify and add unit spawn template code per phase. 
	
	You can also use it to spawn counter attacks, just handle them as a Phase.
	Add further case in the switch-do-loop.
	
	Make Phase Variable an Integer. On trigger Act. use instead of phase = true; phase = phase + 1 or phase = 2.
		
	Example:
		nul = [1] spawn fw_fnc_missionManager;
		
*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];

// Template Arrays
_inf = [1,2,3,4,5,6,7];
_veh = [8,9,10,11];
_apc = [12,13,14];
_ifv = [15];
_air = [16];
_oc = [17];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Initial
    case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];
		// Bunkers
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[-1,false,false]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["b1","b2","b3","b4","o3"];

		// Occupation
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[80,false,true]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["o2","o4","o5"];
		_handle = ["o6","GARRISON",selectRandom _inf,[50,false,true]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[-1,false,false]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["o1","o3"];
		sleep 2;

		// Civilians
		{
			_handle = [_x,["LOP_CHR_Civ_Random"], 10,0] spawn fw_fnc_civSpawn;
			waitUntil {scriptDone _handle};
			sleep 3;
		} forEach ["civ1","civ2"];

		// Objective Patrols		
		_handle = ["a0","PATROL",selectRandom _inf,["a0","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		for "_i" from 1 to 2 do {
			_handle = ["a1","PATROL",selectRandom _inf,["a1","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 2 do {
			_handle = ["a2","PATROL",selectRandom _inf,["a2","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};

		// Area Patrols
		for "_i" from 1 to 3 do {
			_handle = ["p0","PATROL",selectRandom _inf,["p0","SAFE","LIMITED"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 5;
		};

		// Increase difficulty
		if (count allPlayers > 20) then {
			for "_i" from 1 to 3 do {
				_handle = ["p0","PATROL",selectRandom _inf,["p0","SAFE","LIMITED"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};
		};

		"Mission Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Mission Loaded"]] spawn CBA_fnc_globalEvent; 
	};
	// Counter Antenna
	case 1: {
			// Infantry Counter 
			for "_i" from 1 to 3 do {
				_handle = ["i1","PATROL",selectRandom _inf,["a0","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};
			// Increased difficulty
			if (count allPlayers > 20) then {
				for "_i" from 1 to 3 do {
					_handle = ["i2","PATROL",selectRandom _inf,["a0","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
			};
	};
	// Counter Base
	case 2: {
			// Infantry Counter
			for "_i" from 1 to 2 do {
				_handle = ["i0","PATROL",selectRandom _inf,["a1","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};

			// Vehicle Counter
			_handle = ["vs0","VEHICLE",selectRandom _apc,["vp0",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 10;
			_handle = ["vs0","VEHICLE",selectRandom _veh,["vp0",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 10;
			_handle = ["vs0","VEHICLE",selectRandom _veh,["vp0",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 10;
			_handle = ["vs0","VEHICLE",selectRandom _afc,["vp0",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 10;

			// Infantry Counter
			for "_i" from 1 to 2 do {
				_handle = ["i1","PATROL",selectRandom _inf,["a1","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};

			// Increase difficulty
			if (count allPlayers > 20) then {
				for "_i" from 1 to 4 do {
					_handle = ["i0","PATROL",selectRandom _inf,["a1","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
				_handle = ["vs0","VEHICLE",selectRandom _ifv,["vp0",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};
			};
	};
	// Counter Town 2
	case 3: {
			// Infantry Counter
			for "_i" from 1 to 4 do {
				_handle = ["i3","PATROL",selectRandom _inf,["a2","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};
			// Vehicle Counter
			_handle = ["vs0","VEHICLE",selectRandom _veh,["vp00",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
	};
	// Counter Chemical
	case 4: {
			// Ifantry Counter
			for "_i" from 1 to 4 do {
				_handle = ["i0","PATROL",selectRandom _inf,["p0","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};
	};
	// Counter Burned
	case 5: {
			// Infantry Counter
			for "_i" from 1 to 4 do {
				_handle = ["i0","PATROL",selectRandom _inf,["p0","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 5;
			};
			// Increase difficulty
			if (count allPlayers > 20) then {
				_handle = ["vs0","VEHICLE",selectRandom _ifv,["vp000",false,["a1","AWARE"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};
				sleep 20;
				for "_i" from 1 to 2 do {
					_handle = ["i0","PATROL",selectRandom _inf,["a1","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
			};
	};
	// Bridge 
	case 6: {
		"Loading Phase 2" remoteExec ["systemChat", 0];
		// Bunkers
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[-1,false,false]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["b5","b6","b7","b8","b9","vs0","b10","b11"];

		"Phase 2 Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Phase 2 Loaded"]] spawn CBA_fnc_globalEvent; 
		
	};
	// Counter Bridge 
	case 7: {
		// Infantry Counter
		{
				_handle = [_x,"PATROL",selectRandom _inf,["a3","AWARE"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
		}forEach ["is1","is2","is3","is4"];

		// Vehicle Counter
		_handle = ["vs1","VEHICLE",selectRandom _apc,["vp1",false,["a3","AWARE"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Increased difficulty
		if (count allPlayers > 20) then {	
				sleep 30;
				{
					_handle = [_x,"PATROL",selectRandom _inf,["a3","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
				}forEach ["is1","is2","is3","is4"];
			sleep 10;
		_handle = ["vs1","VEHICLE",selectRandom _ifv,["vp1",false,["a3","AWARE"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};			
		};

		// Variable used to trigger Airfield loading
		bridge = true;
		publicVariable "bridge";
	};
	// Airfield 
	case 8: {
		"Loading Phase 3" remoteExec ["systemChat", 0];

		// Bunkers
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[-1,true,false]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["b12","b13","b14","b15","b16","b17","b18","b19","b20"];

		// Town
		_handle = ["f1","GARRISON",selectRandom _inf,[60,false,true]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		
		// Patrols
		for "_i" from 1 to 2 do {
			_handle = ["a4","PATROL",selectRandom _inf,["a4","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 5;
		};
		for "_i" from 1 to 4 do {
			_handle = ["a4","PATROL",selectRandom _inf,["p1","SAFE","LIMITED"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 5;
		};

		"Phase 3 Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Phase 3 Loaded"]] spawn CBA_fnc_globalEvent; 
	};
	// Counter Airfield 
	case 9: {
		// Infantry Counter
		{
				for "_i" from 1 to 2 do {
					_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
		} forEach ["ii0","ii1","ii0","ii2"];

		// Vehicle Counter
		_handle = ["vs2","VEHICLE",selectRandom _apc,["a4",false,["a4","AWARE"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};	

		// Increase difficulty
		if (count allPlayer > 20) then {
			sleep 20;
			{
				for "_i" from 1 to 2 do {
					_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
			} forEach ["ii0","ii1","ii0","ii2"];
			_handle = ["vs2","VEHICLE",selectRandom _ifv,["a4",false,["a4","AWARE"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};	
		};
	};
	// Counter Mortar 
	case 10: {
		// Infantry Counter
		{
				for "_i" from 1 to 2 do {
					_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
		} forEach ["ii0","ii2","ii0","ii2"];
	};
	// Defence
	case 11: {
		"Loading Phase 4" remoteExec ["systemChat", 0];
		sleep 30;
		// 3 Waves of Combined Arms Counter
		for "_i" from 1 to 3 do {
			// Count all units and save as variable
			_count = count allUnits;
			// Infantry Counter
			{
				for "_i" from 1 to 2 do {
					_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
			} forEach ["ii0","ii0","ii1","ii1"];
			sleep 20;
			// Asses difficulty and decide if (high difficulty) else (normal difficulty)
			if (count allPlayers > 20) then {
				_handle = ["vs2","VEHICLE",selectRandom _ifv,["a4",false,["a4","AWARE"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};	
				sleep 30;
				{
					for "_i" from 1 to 2 do {
						_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
						waitUntil {scriptDone _handle};
						sleep 5;
					};
				} forEach ["ii0","ii0","ii1","ii1"];
			// Normal difficulty
			} else {
				_handle = ["vs2","VEHICLE",selectRandom _apc,["a4",false,["a4","AWARE"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};	
			};
			sleep 30;
			{
				for "_i" from 1 to 2 do {
					_handle = [_x,"PATROL",selectRandom _inf,["a4","AWARE"]] spawn fw_fnc_spawnTemplate; 
					waitUntil {scriptDone _handle};
					sleep 5;
				};
			} forEach ["ii0","ii0","ii1","ii1"];

			// Wait before next wave until previous wave was destroyed
			waitUntil {count allUnits < (_count + 10)};
		};

		// Rampage to force all remaining units to Attack as a final push
		sleep 60;
		UPSMON_RAMPAGE = true;
		publicVariable "UPSMON_RAMPAGE";
		sleep 360;
		
		// Variable for Counter Attack End for Task update
		phase = 4;
		publicVariable "phase";
	};
	// END Mission and save Details
	case 12: {
		diag_log format ["Priest: %1, Ofc: %2, AA: %3",(alive priest), (alive ofc), (alive o1)];
		"EveryoneWon" call BIS_fnc_endMission;
	};
};