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
_ins = [1,2,3];
_inf = [4,5,6,7,8,9,10,11,12,13];
_apc = [14];
_veh = [15,16];
_oc = [17,18];
_rus = [19,20,21];

// Phase Case means Phase
switch (_nbr) do {
	// Initial Phase
	case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];
		// Occupation
		_handle = ["o0","GARRISON",selectRandom _oc,[300]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[100]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["o1","o2","o3","o4"];
		// Patrols
		{
			_handle = [_x,"PATROL",selectRandom _ins,[_x,"P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["a0","a1","a2","p0","p0","p0","p0"];
		"Mission Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Mission Loaded"]] spawn CBA_fnc_globalEvent;
	};
	// Continious Counter Factory
    case 1: {
		for "_i" from 1 to 4 do {
			{
				_handle = [_x,"PATROL",selectRandom _ins,["a1","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			} forEach ["i1","i2","i3"];
		};
	};
	// Main Counter Factory
    case 2: {
		// Vehicles
		_handle = ["vs0","VEHICLE",selectRandom _apc,["vp0",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["vs1","VEHICLE",selectRandom _apc,["vp1",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		// Infantry
		[1] spawn fw_fnc_missionManager;
	};
	// Phase 2 - Warehouse
	case 3: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Warehouse
		// Occupation
		_handle = ["o5","GARRISON",selectRandom _oc,[150]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		// Patrol
		for "_i" from 1 to 2 do {
			_handle = ["a2","PATROL",selectRandom _inf,["a2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Area patrols
		for "_i" from 1 to 4 do {
			_handle = ["p1","PATROL",selectRandom _inf,["p1","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Town
		// Civilians
		_handle = ["a3",["LOP_CHR_Civ_Random"], 8,0] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};
		// Occupation
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[150]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		} forEach ["o6","o7"];
		// Patrol
		for "_i" from 1 to 3 do {
			_handle = ["a3","PATROL",selectRandom _inf,["a3","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Small Count
		for "_i" from 1 to 6 do {
			_handle = ["i00","PATROL",selectRandom _inf,["a00","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		"Phase 2 Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Phase 2 Loaded"]] spawn CBA_fnc_globalEvent;
	};
	// Counter Warehouse
	case 4: {
		for "_i" from 1 to 8 do {
			_handle = ["i4","PATROL",selectRandom _inf,["a2","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
	};
	// Counter Town
	case 5: {
		// vehicles
		_handle = ["vs2","VEHICLE",selectRandom _apc,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs2","VEHICLE",selectRandom _veh,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs3","VEHICLE",selectRandom _apc,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs3","VEHICLE",selectRandom _veh,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 120;
		[6] spawn fw_fnc_missionManager;
		sleep 120;
		_handle = ["vs2","VEHICLE",selectRandom _apc,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs2","VEHICLE",selectRandom _veh,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs3","VEHICLE",selectRandom _apc,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["vs3","VEHICLE",selectRandom _veh,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	// Countinous Counter Town
	case 6: {
		for "_i" from 1 to 4 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a3","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
			} forEach ["i5","i6"];
		};
	};
	// Farm
	case 7: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Occupation
		_handle = ["o8","GARRISON",selectRandom _oc,[200]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		// Patrols
		for "_i" from 1 to 3 do {
			_handle = ["a4","PATROL",selectRandom _inf,["a4","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Area Patrols
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["p2","P"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			} forEach ["a4","a5"];
		};
	};
	// Counter Farm
	case 8: {
		{
			_handle = ["vs4","VEHICLE",_x,["vp4",false,["a4","R"]]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			sleep 10;
		} forEach _rus;
		sleep 60;
		for "_i" from 1 to 8 do {
			_handle = ["i7","PATROL",selectRandom _inf,["a4","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
	};
	// Retreat
	case 9: {
		"Loading Phase" remoteExec ["systemChat", 0];
		// Occupation
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[150]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		} forEach ["o9","o10"];
		// Patrols
		for "_i" from 1 to 4 do {
			_handle = ["a5","PATROL",selectRandom _inf,["a5","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		for "_i" from 1 to 4 do {
			_handle = ["i8","PATROL",selectRandom _inf,["p2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
	};
	// Counter Retreat
	case 10: {
		// Vehicles
		_handle = ["vs5","VEHICLE",selectRandom _apc,["vp5",false,["a5","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		// Infantry
		for "_i" from 1 to 4 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a5","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			} forEach ["i8","i9"];
		};
		sleep 30;
		// Vehicles
		_handle = ["vs5","VEHICLE",selectRandom _apc,["vp5",false,["a5","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
};