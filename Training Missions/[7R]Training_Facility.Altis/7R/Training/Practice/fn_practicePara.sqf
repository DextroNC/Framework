// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;


// Removes Markers
FNC_Para_Cleanup = {
	// Input array of Marker Names
	{
		deleteMarker _x;
	} forEach _this;
};

// Select Group Leader if group only has 1 person
if (isNil "_con") then {
	_con = ((units _g) - [leader _g]) select 0;
	if (isNil "_con") then {_con = leader _g};
};


switch (_nbr) do {
// Show Marker HALO
	case 1: {
		// Remove old Markers
		["TparaDZ","TparaStart","TDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [train_para,"TDZ","DZ","mil_objective","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Eject and Start Position
		_dir = round (random 360);
		_array = ["TDZ",100,_dir] call fw_fnc_paraPos;
		
		// Create Eject Marker
		[(_array select 0),"TparaDZ","Approach","hd_arrow","colorBLUFOR",(_dir+225)] spawn fw_fnc_paraMarker;	

		// Create Start Marker
		[(_array select 1),"TparaStart","Empty","","colorBLUFOR",0] spawn fw_fnc_paraMarker;	
		_terminal setVariable ["SR_Test",false,true];
		"HALO Prepared." remoteExec ["Hint", _g];
	};
	// Show Marker HAHO
	case 2: {
		// Remove old Markers
		["TparaDZ","TparaStart","TDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [train_para,"TDZ","DZ","mil_objective","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Eject and Start Position
		_dir = round (random 360);
		_array = ["TDZ",(round (random [1500,2000,2250])),_dir] call fw_fnc_paraPos;

		// Create Eject Marker
		[(_array select 0),"TparaDZ","Approach","hd_arrow","colorBLUFOR",(_dir+225)] spawn fw_fnc_paraMarker;	

		// Create Start Marker
		[(_array select 1),"TparaStart","Empty","","colorBLUFOR",0] spawn fw_fnc_paraMarker;	
		_terminal setVariable ["SR_Test",false,true];
		"HAHO Prepared." remoteExec ["Hint", _g];
	};
	// Start Parachute for all squad
	case 3: {
		// Error when no DZ is available
		if (markerPos "TparaDZ" isEqualTo [0,0,0]) exitWith {
			"No Parachute Marker!" remoteExec ["Hint", _g];
		};
		// Start Plane
		[_terminal,_ldr,0,["TparaDZ","TparaStart",2500,"Windrunner 1-1",false]] spawn fw_fnc_paraDrop;
		
		sleep 5;
		waitUntil { count (units group player) == {isTouchingGround (vehicle _x)} count (units group player) };
		// Wait until unit is on the ground
		sleep 10;
		
		// Remove old Markers
		["TparaDZ","TparaStart","TDZ"] spawn FNC_Para_Cleanup;
	};
}