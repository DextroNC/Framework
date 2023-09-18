//nul = [1] spawn fw_fnc_FoxQual;
// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];


_inf = [4,8];
_tank =[5,6,7];
_tur = [3];
_posmines  = ["armq_mines_1","armq_mines_2","armq_mines_3","armq_mines_4","armq_mines_5"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1
    case 1: {
		_class = selectRandom["ATMine","ACE_SLAMBottomMine"];
		mines = [];
		// Create Mines
		{
		for "_i" from 1 to 15 do {
			private _pos = [_x] call CBA_fnc_randPosArea;
			private _veh = createMine [_class,_pos, [], 0];
			mines pushBack _veh;
		};
		sleep 1;
		}forEach _posmines;
		publicVariable "mines";
		
		for "_i" from 1 to 2 do {
		_handle = ["armq_t_2","GARRISON",selectRandom _inf,[50,1]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 1;
		};
		for "_i" from 1 to 5 do {
		_handle = ["armq_t_2","PATROL",selectRandom _inf,["armq_t_2","P"]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		sleep 1;		
		};
		
		_handle = ["armq_t_4","PATROL",4,["armq_t_4","P"]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};	
		
		_handle = ["armq_t_8","PATROL",9,["armq_t_8","P"]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		
		_handle = ["armq_t_3","VEHICLE",selectRandom _tur,["armq_t_3",false,["armq_t_3","H"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["armq_t_1","VEHICLE",selectRandom _tank,["armq_t_1",false,["armq_t_1","H"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		
		// Create Eject Marker
		_mQual = createMarker ["FoxQual", (markerPos "armq_t_2")]; 
		_mQual setMarkerType "mil_objective";
		_mQual setMarkerColor "colorOPFOR";
		
		
		"Armour Qual Started" remoteExec ["systemChat", 0];

	};
	case 2:{
		for "_i" from 1 to 3 do {
		_handle = ["armq_t_5","VEHICLE",selectRandom _tank,["armq_t_6",false,["armq_t_7","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 2;
		};
		"Destroy the convoy" remoteExec ["systemChat", 0];
	};
	
	case 3: {
	
		_old = nearestObjects [(markerPos "armq_t_1"),["AllVehicles"],200]; 
		_old append nearestObjects [(markerPos "armq_t_6"),["AllVehicles"],1000];
		{
			deleteVehicle _x;
		}forEach _old;
		
		{
		if (side _x == east) then {deleteVehicle _x;}
		}forEach (allUnits-allPlayers);

		// Delete Mines
		{
			deleteVehicle _x;
		} forEach mines;
		sleep 10;

		deleteMarker "FoxQual";
	};
};