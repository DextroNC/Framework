/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Terminal as Object
		<--(Optional) Contestent as Object

		Description:
			Manages the Courses of the Infantry Qualification.
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;

// Shooting Targets Arrays
_infT = [[qi_t1_1,qi_t1_2,qi_t1_3,qi_t1_4],[qi_t1_5,qi_t1_6,qi_t1_7,qi_t1_8],[qi_t1_9,qi_t1_10,qi_t1_11,qi_t1_12],[qi_t1_13,qi_t1_14,qi_t1_15,qi_t1_16]];
_hT = [[qi_t2_1,qi_t2_2,qi_t2_3],[qi_t2_4,qi_t2_5,qi_t2_6,qi_t2_7],[qi_t2_8,qi_t2_9,qi_t2_10,qi_t2_11,qi_t2_12],[qi_t2_13,qi_t2_14]];
_sT = [[qi_t3_1,qi_t3_2]];
_nav = ["nav_1","nav_2","nav_3","nav_4","nav_5","nav_6","nav_7","nav_8","nav_9","nav_10","nav_11","nav_12","nav_13","nav_14","nav_15"];
_spot = ["spot_1","spot_2","spot_3","spot_4","spot_5","spot_6","spot_7","spot_8","spot_9","spot_10","spot_11","spot_12","spot_13","spot_14","spot_15"];
_navtrain = ["tnav_1","tnav_2","tnav_3","tnav_4","tnav_5","tnav_6","tnav_7","tnav_8","tnav_9","tnav_10","tnav_11","tnav_12"];

// Removes Markers
FNC_Para_Cleanup = {
	// Input array of Marker Names
	{
		deleteMarker _x;
	} forEach _this;
};

// Parachute Result Info
FNC_Para_Result = {
	params ["_unit","_targetMarker","_max"];
	
	waitUntil {_unit getVariable ["SR_Falling",false]};

	waitUntil {(vehicle _unit) isKindOf "ParachuteBase"};
	private _height = round ((getPosASL _unit) select 2); 
	hint format ["Testee opened at %1m ASL",_height];

	// Wait until unit is on the ground
	waitUntil {isTouchingGround _unit};
	sleep 10;

	// Distance to DZ
	_dist = round (_unit distance2d (markerPos _targetMarker));

	// Info Message
	private _result = "";
	_str = name _unit + " landed " + str (_dist) + "m away from the DZ."; 
	if (_dist <= _max) then {_result = "Passed"} else {_result = "Failed"};
	private _str = format ["Landed: %1m from DZ\nCourse %2",_dist,_result];
	_str remoteExec ["hint", (group _unit)]; 
	_unit setPos (getPos (leader group _unit));
	_unit setVariable ["SR_Falling",false];
};

// Start with Reset
[(_infT + _hT + _sT)] spawn fw_fnc_resetPopTargets;

// Unified Start
// _terminal set Active
_terminal setVariable ["SR_Test",true,true];
_terminal setVariable ["SR_Hit",0,true];
// Select Group Leader if group only has 1 person
if (isNil "_con") then {
	_con = ((units _g) - [leader _g]) select 0;
	if (isNil "_con") then {_con = leader _g};
};
hint format ["Testee: %1",_con];

// Clear Ammo Box
clearweaponcargoGlobal qi_range_ammo;  
clearmagazinecargoGlobal qi_range_ammo;   


/**************************************************************************************************************

Course Code
Cases are Courses

**************************************************************************************************************/

switch (_nbr) do {
	// Rifle Range
    case 1: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Create Target Array
		_targets = [];
		for [{_i=0}, {_i < 4}, {_i = _i + 1}] do {
			_element = (_infT select _i);
			_element = _element call BIS_fnc_arrayShuffle;
			_element resize 3;
			_targets append _element;
		};

		// Init Timer and Loop Variable
		private _start = CBA_MissionTime;
		_draw = round random 5;
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,2,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;

			// Random Weapon Jam
			private _s = _terminal getVariable ["SR_Hit",0];
			if (_s == 5 + _draw) then {
				[_con, currentWeapon _con] remoteExec ["ace_overheating_fnc_jamWeapon",_con,true];
			};

			// Wait Until target has been hit or Course aborted
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If couse completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 12) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 32 && _time <= 90) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// Grenade Throwing Range
	case 2: {
		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qi_range_ammo additemcargoGlobal ["HandGrenade", 10];

		// Create Target Array
		_targets = [];
		_element = (_infT select 0);
		_element = _element call BIS_fnc_arrayShuffle;
		_element resize 1;
		_targets append _element;
		_targets append [((_sT select 0) select 0)];

		// Init Loop Variable
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,1,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If course completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 2) exitWith {
				"Course Finished" remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// 40mm Range
    case 3: {
	
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qi_range_ammo additemcargoGlobal ["SR_HE_Pack", 10];

		// Create Target Array
		_targets = [];
		for [{_i=0}, {_i < 2}, {_i = _i + 1}] do {
			// 2 targets out of array element 3 total
			if (_i == 1) then {
				_element = (_hT select _i);
				_element = _element call BIS_fnc_arrayShuffle;
				_element resize 2;
				_targets append _element;
			} else {
				_element = (_hT select _i);
				_element = _element call BIS_fnc_arrayShuffle;
				_element resize 1;
				_targets append _element;
			};
		};

		// Init Timer and Loop Variable
		private _start = CBA_MissionTime;
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,1,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If couse completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 3) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 6 && _time <= 240) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// AR
	case 4: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qi_range_ammo addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];

		// Create Target Array
		_targets = [];
		_ai = objNull;
		for [{_i=0}, {_i < 4}, {_i = _i + 1}] do {
			_element = (_hT select _i);
			_element = _element call BIS_fnc_arrayShuffle;
			_element resize 1;
			_targets append _element;
		};

		// Init Timer and Loop Variable
		private _start = CBA_MissionTime;
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target, final target suppression target 
			if (_current == 4) then {
				// Suppression Target
					private _aiGroup = createGroup east;
					private _ai = _aiGroup createUnit ["O_Survivor_F", [0,0,0], [],0,"NONE"];
					_ai disableAi "TARGET";
					_ai disableAi "AUTOTARGET";
					_ai disableAi "MOVE";
					_ai disableAi "WEAPONAIM";
					_ai disableAi "COVER";
					_ai disableAi "AUTOCOMBAT";
					_ai setUnitPos "UP";
					_ai setVariable ["asr_ai_exclude", true];
					_ai allowDamage false;
					[_ai,true] remoteExec ["hideObjectGlobal",2];
					_ai setSkill 0.5;
					_ai setSkill ["courage",0.75];
					_ai setPosASL (getPosASL qi_supp); 
					[_ai,_g,_terminal,20] spawn fw_fnc_suppression;

			} else {
				// Default Target
				_target = _targets select _current;
				[_target,clientOwner] remoteExec ["setOwner",2];
				[_target,10,_terminal] spawn fw_fnc_eventHit;
				sleep 2;
				_target animate ["terc", 0];
				_current = _current + 1;
			};

			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If couse completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 5) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 200 && _time <= 180) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};

	// LAT Range
    case 5: {
	
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qi_range_ammo addWeaponcargoGlobal ["rhs_weap_M136_hedp", 10];

		// Create Target Array
		_targets = [];
		for [{_i=0}, {_i < 4}, {_i = _i + 1}] do {
			_element = (_hT select _i);
			_element = _element call BIS_fnc_arrayShuffle;
			_element resize 1;
			_targets append _element;
		};

		// Init Timer and Loop Variable
		private _start = CBA_MissionTime;
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,1,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If course completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 4) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 6 && _time <= 240) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// First-Aid Scenario	
	case 6: {

		// Start Horn
		[qi_range_horn,_g] spawn fw_fnc_courseStart;

		// Delete Dummy if present
		private _pos = getPos qi_wounded;
		_old = nearestObjects [_pos, ["B_Survivor_F"], 100];
		deleteVehicle (_old select 0);
		
		// Spawn new Dummy
		private _group = createGroup civilian;
		private _unit = _group createUnit ["B_Survivor_F", [0,0,0], [],0,"NONE"];
		_dir = random 360;
		_unit setDir _dir;
		_unit disableAi "ALL";
		_unit setUnitPos "DOWN";
		[_unit, true, 300, true] call ace_medical_fnc_setUnconscious;
		[_unit, "body", 0.9, objNull, "bullet", -0.7, objNull] call ace_medical_fnc_handleDamage;
		sleep 0.1;
		[_unit, "leg_l", 0.8, objNull, "bullet", -0.6, objNull] call ace_medical_fnc_handleDamage;
		sleep 0.1;
		[_unit, "hand_r", 0.7, objNull, "bullet", -0.3, objNull] call ace_medical_fnc_handleDamage;
		[_unit, 0.6] call ace_medical_fnc_adjustPainLevel;
		_unit setPos _pos;

		// Target Array
		_targets = _infT select 3;

		// Pop-up Targets
		{
			[_x,clientOwner] remoteExec ["setOwner",2];
			[_x,3,_terminal] spawn fw_fnc_eventHit;
			_x animate ["terc", 0];
		}forEach _targets;
		
		// End Scenario
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Clean Up
		deleteVehicle _unit;

		// End Horn
		[qi_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		_terminal setVariable ["SR_Test",false,true];
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// Show Marker HALO
	case 7: {
		// Remove old Markers
		["QparaDZ","QparaStart","QDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [qi_para1,"QDZ","DZ","hd_start","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Eject and Start Position
		_dir = round (random 360);
		_array = ["QDZ",100,_dir] call fw_fnc_paraPos;
		
		// Create Eject Marker
		[(_array select 0),"QparaDZ","Approach","hd_arrow","colorBLUFOR",(_dir+225)] spawn fw_fnc_paraMarker;	

		// Create Start Marker
		[(_array select 1),"QparaStart","Empty","","colorBLUFOR",0] spawn fw_fnc_paraMarker;	
		_terminal setVariable ["SR_Test",false,true];
		"HALO Prepared." remoteExec ["Hint", _g];
	};
	// Show Marker HAHO
	case 8: {
		// Remove old Markers
		["QparaDZ","QparaStart","QDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [qi_para2,"QDZ","DZ","hd_start","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Eject and Start Position
		_dir = round (random 360);
		_array = ["QDZ",(round (random [1500,2000,2250])),_dir] call fw_fnc_paraPos;

		// Create Eject Marker
		[(_array select 0),"QparaDZ","Approach","hd_arrow","colorBLUFOR",(_dir+225)] spawn fw_fnc_paraMarker;	

		// Create Start Marker
		[(_array select 1),"QparaStart","Empty","","colorBLUFOR",0] spawn fw_fnc_paraMarker;	
		_terminal setVariable ["SR_Test",false,true];
		"HAHO Prepared." remoteExec ["Hint", _g];
	};
	// Start Parachute
	case 9: {
		// Error when no DZ is available
		if (markerPos "QparaDZ" isEqualTo [0,0,0]) exitWith {
			"No Parachute Marker!" remoteExec ["Hint", _g];
		};

		// Start Plane
		[_terminal,_ldr,0,["QparaDZ","QparaStart",2500,"Windrunner 2-1",false]] spawn fw_fnc_paraDrop;
		sleep 5;
		_ldr setPos (markerPos "QDZ");
		sleep 2;
		_handle = [_con,"QDZ",150] spawn FNC_Para_Result;
		waitUntil {scriptDone _handle};

		// Remove old Markers
		_terminal setVariable ["SR_Test",false,true];
		sleep 5;
		["QparaDZ","QparaStart","QDZ"] spawn FNC_Para_Cleanup;
	};
	// Spotting Range
	case 10: {

		// Create Spotting Vehicle
		private _pos = markerPos (_spot select (_terminal getVariable ["SR_Random",0]));
		private _veh = createVehicle ["rhsgref_un_btr70", _pos, [], 0, "NONE"];
		_veh setDir (random 360);

		// Start Horn
		[qi_range_horn2,_g] spawn fw_fnc_courseStart;

		// Timer Start
		private _start = CBA_MissionTime;

		// Wait until end of test
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Create Result Marker
		private _mR = createMarker ["nav2_act", position _veh];
		_mR setMarkerColor "ColorBlue";
		_mR setMarkerShape "ELLIPSE";
		_mR setMarkerType "hd_dot";
		_mR setMarkerAlpha 0.6;
		_mR setMarkerSize [25,25];
		_mR setMarkerBrush "Solid";

		// Timer Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if (_time <= 60) then {_result = "Acceptable Time"} else {_result = "Too much Time"};
		private _str = format ["Time Passed (in sec): %1\n%2",_time,_result];
		_str remoteExec ["hint", _g];

		// End Horn
		[qi_range_horn2,_g] spawn fw_fnc_courseEnd;
		_terminal setVariable ["SR_Test",false,true];

		// Clean up
		sleep 2;
		deleteVehicle _veh;
		sleep 8;
		deleteMarker _mR;

	};
	// Shoot House
	case 11: {
		/*	
		// Target Array
		private _targets = [sh1,sh2,sh3,sh4,sh5,sh6,sh7,sh8,sh9,sh10,sh11,sh12,sh13,sh14,sh15,sh16,sh17,sh18];

		// Pop Targets
		{
			[_x,clientOwner] remoteExec ["setOwner",2];
			[_x,3,_terminal] spawn fw_fnc_eventHit;
			_x animate ["terc", 0];
		}forEach _targets;

		// Determin VIP Pos and Move Target underground
		_replace = selectRandom [sh7,sh9,sh12,sh13,sh14,sh18];
		_pos = getPos _replace;
		_replace setPos [(getPos _replace select 0), (getPos _replace select 1), -3];

		// Create VIP
		private _group = createGroup civilian;
		private _vip = _group createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
		_vip disableAi "ALL";
		_vip addItem "HandGrenade";
		_vip setDir (random 360);
		_vip setPos _pos;
		[_vip, true] call ACE_captives_fnc_setSurrendered;

		// Start Horn
		[qi_range_horn3,_g] spawn fw_fnc_courseStart;
		private _start = CBA_MissionTime;
		
		// WaitUntil End
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Result Message
		private _time = (CBA_missionTime - _start);
		private _kills = _terminal getVariable ["SR_Hit",0];
		private _poison = _con getVariable ["ace_medical_poisonLevel",0];
		private _result = "";
		if (_kills < (count _targets)- 1 || _poison > 0 || "HandGrenade" in items _vip || !alive _vip) then {_result = "Failed"} else {_result = "Passed"};
		private _str = format ["Time Passed (in sec): %1\nTargets Killed: %2\nPoison Level: %3\nCourse: %4",_time,_kills,_poison,_result];
		_str remoteExec ["hint", _g]; 
		_terminal setVariable ["SR_Hit",0,true];

		// End Horn
		[qi_range_horn3,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
		deleteVehicle _vip;
		_replace setPos _pos;
		_terminal setVariable ["SR_Test",false,true];*/
		
		// Get Hostile Spawns
		private _hostilePos = cqb_qual nearObjects ["CBA_BuildingPos", 30];

		// Prep Doors

		// Spawn Hostiles
		private _groupOPFOR = createGroup east;
		{
			private _hostile = _groupOPFOR createUnit ["SR_Training_OPFOR", getPos _x, [], 0, "NONE"];
			_hostile disableAI "PATH";
			_hostile setPos getPos _x;
			_hostile setDir direction _x;
			_hostile setUnitPos "UP";
			_hostile 
		} forEach _hostilePos;

		// Set Doors
		private _doors = cqb_qual nearObjects ["Land_WiredFence_01_gate_F", 30];;
		{
			[_x, 1, 0] call BIS_fnc_Door;
			_x setVariable ['bis_disabled_Door_1',1,true]
		}forEach _doors;
		

		// Spawn VIP
		private _groupCIV = createGroup civilian;
		private _vip = _groupCIV createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
		_vip disableAi "ALL";
		_vip addItem "HandGrenade";
		_vip setDir direction vip_pos;
		_vip setPos position vip_pos;
		[_vip, true] call ACE_captives_fnc_setSurrendered;

		// Start Horn
		[qi_range_horn3,_g] spawn fw_fnc_courseStart;
		private _start = CBA_MissionTime;
		
		// WaitUntil End
		waitUntil {!(_terminal getVariable ["SR_Test",false])};
		
		// Result Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if (("HandGrenade" in items _vip ) || (!alive _vip)) then {_result = "Failed"} else {_result = "Passed"};
		private _str = format ["Time Passed (in sec): %1\nCourse: %2",_time,_result];
		_str remoteExec ["hint", _g]; 
		_terminal setVariable ["SR_Hit",0,true];

		// End Horn
		[qi_range_horn3,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		private _allUnits = (units _groupCIV ) + (units _groupOPFOR);
		{
			deleteVehicle _x;
		} forEach _allUnits;
		{ 
			if (_x inArea cqb_qual) then {
				deleteVehicle _x
			};
		} forEach allDead;
		deleteGroup _groupCIV;
		deleteGroup _groupOPFOR;
		_terminal setVariable ["SR_Test",false,true];

	};
	// Navigation
	case 12: {

		// Port Contestent
		_pos = markerPos (_nav select (_terminal getVariable ["SR_Random",0]));
		_con unlinkItem "ItemGPS";
		_con setPos _pos;

		// Display AO Marker
		["qual_nav", 0.4] remoteExec ["setMarkerAlphalocal", _g];
		
		// Create start Marker for Instructor
		private _mC = createMarkerlocal ["nav_con_start", _pos];
		_mC setMarkerColorlocal "colorCivilian";
		_mC setMarkerTypelocal "hd_dot";
		_mC setMarkerTextlocal "START"; 

		["123", "onEachFrame", {
			deleteMarker "nav_con_act";
			private _mP = createMarkerlocal ["nav_con_act", position (_this select 0)];
			_mP setMarkerColorlocal "colorCivilian";
			_mP setMarkerTypelocal "hd_dot";
			_mP setMarkerTextlocal (name (_this select 0)); 
		}, [_con]] call BIS_fnc_addStackedEventHandler; 

		// Start Horn
		[qi_range_horn2,_g] spawn fw_fnc_courseStart;

		// Timer Start
		private _start = CBA_MissionTime;

		// Wait until end of test
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Create Result Marker
		private _mR = createMarker ["nav3_act", position _con];
		_mR setMarkerColor "ColorBlue";
		_mR setMarkerShape "ELLIPSE";
		_mR setMarkerType "hd_dot";
		_mR setMarkerAlpha 0.6;
		_mR setMarkerSize [50,50];
		_mR setMarkerBrush "Solid";

		// Timer Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if (_time <= 120) then {_result = "Acceptable Time"} else {_result = "Too much Time"};
		private _str = format ["Time Passed (in sec): %1\n%2",_time,_result];
		_str remoteExec ["hint", _g];

		// End Horn
		[qi_range_horn2,_g] spawn fw_fnc_courseEnd;
		_terminal setVariable ["SR_Test",false,true];

		// Clean up
		_con setPos (getPos qi_para2);
		sleep 10;
		{
			deleteMarker _x;
		}forEach ["nav_con_act","nav_con_start","nav3_act"];
		["qual_nav", 0] remoteExec ["setMarkerAlphalocal", _g];
		["123", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

	};
	// Bounding
	case 13: {
		// Start Horn
		[qi_bounding_horn,_g] spawn fw_fnc_courseStart;
		["qual_bounding", 1] remoteExec ["setMarkerAlphalocal", _g];

		// Reset Targets
		{	
			[_x,["terc", 1]] remoteExec ["animate", 2];
		}forEach [qi_b_1,qi_b_2,qi_b_3,qi_b_4,qi_b_5,qi_b_6,qi_b_7,qi_b_8,qi_b_9,qi_b_10,qi_b_11,qi_b_12];


		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {
			sleep 2;
		}; 
	
		// End Horn
		[qi_bounding_horn,_g] spawn fw_fnc_courseEnd;
		["qual_bounding", 0] remoteExec ["setMarkerAlphalocal", _g];
	};
	// Course Info for Instructor
	case 0: {

		// Remove all Tasks
		[_g] call fw_fnc_removeTasks;

		// Reset _terminal
		_terminal setVariable ["SR_Test",false,true];

		{
			_x setPos (getPos qi_para1);
			sleep 1;
		}forEach units group _ldr;

		// General
		_task1 = _ldr createSimpleTask ["Infantry Qualification Info"];
		_task1 setSimpleTaskDescription ["Recommended order by tasks. Individual courses can be repeated, preferely not back-to-back. Procedures are evaluated by the Instructor. Most of the hard requirements are evaluated by the script and will be provided as a message at the end of each individual course.<br/>
		<br/>","Infantry Qualification Info",""];
		_task1 setSimpleTaskDestination (getPos qi_flag1);

		// ROE 
		_task2 = _ldr createSimpleTask ["ROE"];
		_task2 setSimpleTaskDescription ["Question: What are the default Rules of Engagement (ROE)?<br/>
		<br/>Answer:<br/>- Return fire if fired upon<br/>- immediate defences of yourself or another teammate<br/>- upon permission (request permission)","ROE",""];
		_task2 setSimpleTaskDestination (getPos qi_range);

		// Formations
		_task2 = _ldr createSimpleTask ["Formations"];
		_task2 setSimpleTaskDescription ["Question: The Testee has to draw accurately draw all formations on the map<br/>
		<br/>Formations:<br/>- Wedge<br/>- Column<br/>- Staggered Column<br/>- Line<br/>- Echelon Left/Right","Formations",""];
		_task2 setSimpleTaskDestination (getPos qi_range);

		// Rifle Course
		_task2 = _ldr createSimpleTask ["Rifle"];
		_task2 setSimpleTaskDescription ["Information:<br/>Testee engages the 12 Targets down range (last 3 are in the Bunker). Clears jam. Additional ammo in the Ammobox. No Ranges provided (no Vector). Shoot can either do it standing or crouched.<br/>
		<br/>Requirements: - Evaluated by the Course (max 32 Rnds, 90 seconds)","Shooting Range: Rifle",""];
		_task2 setSimpleTaskDestination (getPos qi_range);

		// Handgrenade Course
		_task3 = _ldr createSimpleTask ["Handgrenades"];
		_task3 setSimpleTaskDescription ["Information:<br/>Testee engages the two Targets down range. Follows grenade throwing procedure. Additional ammo in the Ammobox. No Ranges provided (no Vector).<br/>
		<br/>Requirements: - Evaluated by the Course (max 3 Grenades)<br/>- Calls out Frag-out","Shooting Range: Handgrenades",""];
		_task3 setSimpleTaskDestination (getPos qi_range);

		// 40mm Course
		_task4 = _ldr createSimpleTask ["40mm"];
		_task4 setSimpleTaskDescription ["Information:<br/>Testee engages the three Targets down range. Additional ammo in the Ammobox. No Ranges provided (no Vector). Shoot can either do it standing or crouched.<br/>
		<br/>Requirements: - Evaluated by the Course (max 6 Rnds)","Shooting Range: 40mm",""];
		_task4 setSimpleTaskDestination (getPos qi_range);

		// AR Course
		_task5 = _ldr createSimpleTask ["Autorifle"];
		_task5 setSimpleTaskDescription ["Information:<br/>Testee engages the four Targets down range. Reloads and then suppresses the Bunker. Additional ammo in the Ammobox. No Ranges provided (no Vector). Shooter should go prone and use his bipod. Shooter has to shoot at least 3rd bursts.<br/>
		<br/>Requirements: - Evaluated by the Course (max 200 Rnds)","Shooting Range: AR",""];
		_task5 setSimpleTaskDestination (getPos qi_range);

		// LAT Course
		_task6 = _ldr createSimpleTask ["LAT"];
		_task6 setSimpleTaskDescription ["Information:<br/>Testee engages the four Targets down range while following procedure (at least for the first shot call to clear backblast). Additional ammo in the Ammobox. No Ranges provided (no Vector).<br/>
		<br/>Requirements: <br/>- Clear Backblast procedure <br/>- Further is evaluated by the Course (max 6 rockets)","Shooting Range: LAT",""];
		_task6 setSimpleTaskDestination (getPos qi_range);

		// Shooting Range - First-Aid Scenario
		_task7 = _ldr createSimpleTask ["First-Aid-Scenario"];
		_task7 setSimpleTaskDescription ["Information:<br/> The Scenario is that the Testee and Instructor are coming from the Shooting Position. The Instructor can play a passive part. 
		There is no medic available. The wounded has to be recovered and stabilized while utilizing cover, coverage by team mates and smoke. The Instructor has to evaluate proper procedure being applied.
		At the end the Instructor will ask what the Testee would say to a Medic on arrival.
		<br/>
		<br/>Requirements: <br/>- Man-Down-Call over Radio<br/>- Relocates the Wounded to cover<br/>- Utilizes smoke and/or suppressive fire<br/>- Stabilizes the Wounded (Bandage + CPR)<br/>- Passes information that the Patient is stabilized to the Medic (incl. given medication)"
		,"Shooting Range: First-Aid-Scenario",""];
		_task7 setSimpleTaskDestination (getPos qi_range);

		// Obstacle Course
		_task6 = _ldr createSimpleTask ["Obstacle Course"];
		_task6 setSimpleTaskDescription ["Information:<br/>Testee is going through the Obstacle Course. The Testee has to move under the wall, not over.<br/>
		<br/>Requirements: <br/>- Smooth Movement<br/>- Uses Enhance Movement to jump from the container<br/>- Rolls under the Wall sideways.","Obstacle Course",""];
		_task6 setSimpleTaskDestination (getPos qi_flag1);

		// Fast Roping
		_task5 = _ldr createSimpleTask ["Fast Roping"];
		_task5 setSimpleTaskDescription ["Information:<br/>Testee is climbing up to the helicopter. Instructor plays Pilot on the Radio.<br/>
		<br/>Requirements: <br/>- Proper procedure<br/>","Fast Roping",""];
		_task5 setSimpleTaskDestination (getPos qi_helo);

		// Shoot House Task
		_task1 = _ldr createSimpleTask ["Shoot House"];
		_task1 setSimpleTaskDescription ["Information:<br/>Work with two people through the Shoot House and deal with the Scenario. The Testee has to take point and initiative. The second person will only support and do things he has been told. Testee has to pick up kit from the station (m4).<br/>
		<br/>Requirements: <br/>- All Targets killed<br/>- Follows Procedure<br/>- Recognizes Gas and equips Gasmask and threats himself with Atrione<br/>- Civilian survives, is getting searched, handcuffed and grenade removed<br/>
		<br/>All but clearing procedure and movement is evaluated by the Course itself, meaning the instructor can declare a failure and overwrite the Course assessment.","Shoot House",""];
		_task1 setSimpleTaskDestination (getPos qi_range_horn3);

		// HALO Jump
		_task4 = _ldr createSimpleTask ["HALO Jump"];
		_task4 setSimpleTaskDescription ["Information:<br/>HALO jump by the Testee to the Primary Course Location. Instructor gets teleported.<br/>
		<br/>Requirements: <br/>- Lands not further than 150m from DZ<br/>- Puts backpack on Chest<br/>","HALO Jump",""];
		_task4 setSimpleTaskDestination (getPos qi_flag1);

		// HAHO Jump
		_task3 = _ldr createSimpleTask ["HAHO Jump"];
		_task3 setSimpleTaskDescription ["Information:<br/>HAHO jump by the Testee to the Secondary Course Location. Instructor gets teleported.<br/>
		<br/>Requirements: <br/>- Lands not further than 150m from DZ<br/>- Puts backpack on Chest<br/>","HAHO Jump",""];
		_task3 setSimpleTaskDestination (getPos qi_flag1);

		// Spotting Range
		_task2 = _ldr createSimpleTask ["Spotting Range"];
		_task2 setSimpleTaskDescription ["Information:<br/>With Map Tools and Vector the Testee has to mark a White BTR on the Map from the Tower.<br/>
		<br/>Requirements: <br/>- Not more than 60 seconds<br/>- Marker within the Deviation Circle (blue)<br/>","Spotting Range",""];
		_task2 setSimpleTaskDestination (getPos qi_range_horn2);

		// Navigation
		_task11 = _ldr createSimpleTask ["Navigation Range"];
		_task11 setSimpleTaskDescription ["Information:<br/>With Map Tools the Testee has to mark locate himself and mark his position inside the purple marker.<br/>
		<br/>Requirements: <br/>- Not more than 120 seconds<br/>- Marker within the Deviation Circle (blue)<br/>","Navigation Range",""];
		_task11 setSimpleTaskDestination (getPos qi_range_horn2);
		
		// Bounding
		_task12 = _ldr createSimpleTask ["Bounding Course"];
		_task12 setSimpleTaskDescription ["Information:<br/>Practice successive and alternate bounding as well as peeling and move and cover.<br/>
		<br/>Requirements: Testee is able to execute all the above mentioned drills","Bounding Course",""];
		_task12 setSimpleTaskDestination (getPos qi_bounding_horn);

	};
};