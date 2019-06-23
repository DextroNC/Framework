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
_inf = [1,2,3,4,5,6,7,8,9];
_sf = [10,11,12];
_tech = [13,14,15,16,17,18];
_vics = [19,20,21,22];
_apc = [23,24,25,26,27,28,29];
_ifv = [30,31];
_tank = [32,33,34];
_air = [35];
_oc = [36];
_vehicles = _apc + _tank + _ifv;

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Initial
	case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];
		// Bunkers
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[5,1]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["b1","b2","b3"];

		// Patrols
		for "_i" from 1 to 3 do {
			_handle = ["a0","PATROL",selectRandom _inf,["a0","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 3 do {
			_handle = ["p0","PATROL",selectRandom _inf,["p0","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		"Mission Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Phase 1 Loaded"]] spawn CBA_fnc_globalEvent; 
	};
	// Phase 1 - Counter Ambush
	case 1: {
		_handle = ["vs2","VEHICLE",selectRandom _tech,["a0",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs2","VEHICLE",selectRandom _vics,["a0",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs2","VEHICLE",selectRandom _vics,["a0",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 20;
		// Loop
		for "_i" from 1 to 3 do {
			// Infantry
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a0","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			} forEach ["i0","i1","i2","i3","i4","i5","i6"];
			_handle = ["vs0","VEHICLE",selectRandom _apc,["vp0",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 5;
			_handle = ["vs1","VEHICLE",selectRandom _tech,["vp1",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 5;
			_handle = ["vs2","VEHICLE",selectRandom _tank,["vp2",false,["a0","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 15;
			waitUntil {count (allUnits-allPlayers) <= 200};
		};
		phase = 1;
		publicVariable "phase";
	};
	// Town 1
    case 2: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Area Patrols
		for "_i" from 1 to 5 do {
			_handle = ["i7","PATROL",selectRandom _inf,["p1","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 3 do {
			_handle = ["a1","PATROL",selectRandom _inf,["a1","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// City Occupations
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[50]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		}forEach ["o1","o2","o3","o4","o5","o6","o7","o8","o9","o10","o11"];
		// Civilians
		_handle = ["civ1",["LOP_Tak_Civ_Random"], 16,2] spawn fw_fnc_civSpawn;	
		waitUntil {scriptDone _handle};
		"Phase Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Town Large
	case 3: {
		for "_i" from 1 to 2 do {
			// Vehicles
			{
				_handle = [_x,"VEHICLE",selectRandom _vehicles,["a1",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};
				sleep 5;
			}forEach ["vs20","vs21","vs22","vs23"];
			// Infantry
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a1","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["i10","i11","i12","i13","i14","i15","i16"];
			sleep 300;
		};
	};
	// Counter Town Continous
	case 4: {
		{
			_handle = [_x,"PATROL",selectRandom _inf,["a1","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["i10","i11","i12","i13","i14","i15","i16"];
		_handle = ["vs10","VEHICLE",selectRandom _vehicles,["vp10",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 5;
		_handle = ["vs11","VEHICLE",selectRandom _vehicles,["vp11",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	// Town 2
	case 5: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Occupation
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[100]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["o20","o21","o22"];
		// Patrols
		for "_i" from 1 to 4 do {
			_handle = ["i8","PATROL",selectRandom _inf,["p2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 3 do {
			_handle = ["a2","PATROL",selectRandom _inf,["a2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		_handle = ["civ2",["LOP_Tak_Civ_Random"], 8,1] spawn fw_fnc_civSpawn;	
		waitUntil {scriptDone _handle};
		"Phase Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Town 2
	case 6: {
		{
			_handle = [_x,"VEHICLE",selectRandom _vehicles,["a2",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["vs31","vs32","vs33","vs34","vs35","vs37"];
		sleep 10;
		for "_i" from 1 to 3 do {
			{
				_handle = [_x,"VEHICLE",selectRandom _vics,["a2",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};
				sleep 8;
			}forEach ["vs31","vs32","vs33","vs34","vs35","vs37"];
		};
		["air1","AIR",selectRandom _air,["a2","SAD","AWARE","a2"]] spawn fw_fnc_spawnTemplate;
	};
	// Counter Town 2 Continous
	case 7: {
		{
			_handle = [_x,"VEHICLE",selectRandom _vehicles,["a2",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["vs30","vs36"];
		{
			_handle = [_x,"PATROL",selectRandom _inf,["a2","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		}forEach ["i30","i31","i32","i33","i34","i35"];
	};
	// Town 3
	case 8: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Occupation
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[100]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["o41","o42","o43"];
		_handle = ["o00","GARRISON",selectRandom _oc,[50]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		// Patrols
		for "_i" from 1 to 4 do {
			_handle = ["i9","PATROL",selectRandom _inf,["p3","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 3 do {
			_handle = ["a3","PATROL",selectRandom _inf,["a3","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		_handle = ["civ3",["LOP_Tak_Civ_Random"], 12,1] spawn fw_fnc_civSpawn;	
		waitUntil {scriptDone _handle};
		"Phase Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Town 3
	case 9: {
		{
			_handle = [_x,"VEHICLE",selectRandom _vehicles,["a3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["vs50","vs51"];
		sleep 10;
		for "_i" from 1 to 3 do {
			{
				_handle = [_x,"VEHICLE",selectRandom _vics,["a3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
				waitUntil {scriptDone _handle};
				sleep 8;
			}forEach ["vs50","vs51"];
		};
	};
	// Counter Town 3 Continous
	case 10: {
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _sf,["a3","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["i50","i51","i52","i53"];
		};
	};
};