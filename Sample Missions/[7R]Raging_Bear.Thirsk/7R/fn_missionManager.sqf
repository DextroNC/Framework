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
_inf = [1,2,3,4,5,6,7];
_tank = [8];
_truck = [9,10];
_car = [11,12];
_apc = [13];
_ifv = [14];
_aa = [15];
_air = [16];
_oc = [17];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0: Initial Load
    case 0: {
			"Loading Mission" remoteExec ["systemChat", 0];
			// Patrols
			for "_i" from 1 to 5 do {
				_handle = ["a0","PATROL",selectRandom _inf,["a0","P"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			};
			for "_i" from 1 to 2 do {
				_handle = ["s0","PATROL",selectRandom _inf,["s0","H"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			};
			// Garrison
			{
				_handle = [_x,"GARRISON",selectRandom _oc,[35]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			} forEach ["o1","o2","o3"];
			_handle = ["b1","GARRISON",selectRandom _inf,[5,1]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
			"Mission Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Dam
	case 1: {
		// Vehicle 1
		_handle = ["vs0","VEHICLE",selectRandom _ifv,["vp0",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 30;
		// Infantry Wave 1
		for "_i" from 1 to 5 do {
			_handle = ["s1","PATROL",selectRandom _inf,["a1","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Vehicle 2
		_handle = ["vs0","VEHICLE",selectRandom _ifv,["vp0",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 60;
		// Infantry Wave 2
		for "_i" from 1 to 5 do {
			_handle = ["s2","PATROL",selectRandom _inf,["a1","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		sleep 180;
		phase = 1;
		publicVariable "phase";
		// Vehicle 3
		_handle = ["vs0","VEHICLE",selectRandom _car,["vp00",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 12;
		_handle = ["vs0","VEHICLE",selectRandom _truck,["vp00",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs0","VEHICLE",selectRandom _aa,["vp00",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs0","VEHICLE",selectRandom _apc,["vp00",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	// Outpost
	case 2: {
		"Loading Phase 2" remoteExec ["systemChat", 0];
		// Patrols
		for "_i" from 1 to 5 do {
			_handle = ["s3","PATROL",selectRandom _inf,["p0","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Garrison
		{
			_handle = [_x,"GARRISON",selectRandom _oc,[35]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		} forEach ["o4","o5","o6"];
		// Bunkers
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[5,1]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		}forEach ["b2","b3","b4","b5","b6"];
		// Close Patrol
		for "_i" from 1 to 3 do {
			_handle = ["a2","PATROL",selectRandom _inf,["a2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		"Phase 2 Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Outpost
	case 3: {
		// Infantry 1
		for "_i" from 1 to 6 do {
			_handle = ["s3","PATROL",selectRandom _inf,["a2","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		sleep 120;
		// Vehicles
		_handle = ["vs1","VEHICLE",selectRandom _tank,["vp1",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 60;
		_handle = ["vs1","VEHICLE",selectRandom _truck,["vp1",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs1","VEHICLE",selectRandom _truck,["vp1",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs1","VEHICLE",selectRandom _apc,["vp1",false,["a2","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 120;
		// Infantry 2
		for "_i" from 1 to 6 do {
			_handle = ["s3","PATROL",selectRandom _inf,["a2","R"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		phase = 2;
		publicVariable "phase";
	};
	// Camp
	case 4: {
		"Loading Phase 3" remoteExec ["systemChat", 0];
		// Infantry 1
		for "_i" from 1 to 5 do {
			_handle = ["a3","PATROL",selectRandom _inf,["p1","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Garrison
		_handle = ["o7","GARRISON",selectRandom _oc,[65]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		_handle = ["o8","GARRISON",selectRandom _oc,[40]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 2;
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[5,1]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
		}forEach ["b7","b8"];
		// Close Patrol
		for "_i" from 1 to 3 do {
			_handle = ["a3","PATROL",selectRandom _inf,["a3","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		"Phase 3 Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Camp
	case 5: {
		// Infantry
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a3","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["s5","s6","s7"];
		};
		// Vehicles
		_handle = ["vs2","VEHICLE",selectRandom _apc,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs3","VEHICLE",selectRandom _ifv,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 60;
		// Infantry
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a3","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["s5","s6","s7"];
		};
		sleep 60;
		// Vehicles
		_handle = ["vs2","VEHICLE",selectRandom _tank,["vp2",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs3","VEHICLE",selectRandom _apc,["vp3",false,["a3","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		phase = 3;
		publicVariable "phase";
	};
	// Airfield
	case 6: {
		"Loading Phase 4" remoteExec ["systemChat", 0];
		// Area Patrol
		for "_i" from 1 to 5 do {
			_handle = ["s8","PATROL",selectRandom _inf,["p2","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		// Garrison
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[5,1]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["b9","b10","b11","b12"];
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[50]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["o9","o10","o11"];
		{
			_handle = [_x,"GARRISON",selectRandom _inf,[30]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		}forEach ["o12","o13"];
		// Close Patrol
		for "_i" from 1 to 3 do {
			_handle = ["a4","PATROL",selectRandom _inf,["a4","P"]] spawn fw_fnc_spawnTemplate; 
			waitUntil {scriptDone _handle};
			sleep 2;
		};
		"Phase 4 Loaded" remoteExec ["systemChat", 0];
	};
	// Counter Airfield
	case 7: {
		// Infantry
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a4","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["s9","s10","s11"];
		};
		// Vehicles
		_handle = ["vs4","VEHICLE",selectRandom _apc,["vp4",false,["a4","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs5","VEHICLE",selectRandom _ifv,["vp5",false,["a4","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 60;
		// Infantry
		for "_i" from 1 to 2 do {
			{
				_handle = [_x,"PATROL",selectRandom _inf,["a4","R"]] spawn fw_fnc_spawnTemplate; 
				waitUntil {scriptDone _handle};
				sleep 2;
			}forEach ["s9","s10","s11"];
		};
		sleep 60;
		// Vehicles
		_handle = ["vs4","VEHICLE",selectRandom _tank,["vp4",false,["a4","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 8;
		_handle = ["vs5","VEHICLE",selectRandom _apc,["vp5",false,["a4","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		phase = 4;
		publicVariable "phase";
		// Global Rampage
		{
			if (!(_x getVariable ["SR_PatrolMode",""] isEqualTo "RP")) then {
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		}forEach _allGroups;
	};
};