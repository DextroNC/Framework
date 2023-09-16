	/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Terminal as Object
		<--(Optinal) Contestent as Object

		Description:
			Manages the Courses of the Infantry Qualification.
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;

// Shooting Targets Arrays
_mmgT = [[qh_t1_1,qh_t1_2,qh_t1_3,qh_t1_4,qh_t1_5],[qh_t2_1,qh_t2_2,qh_t2_3,qh_t2_4,qh_t2_5],[qh_t3_1,qh_t3_2,qh_t3_3,qh_t3_4,qh_t3_5],[qh_t4_1,qh_t4_2,qh_t4_3,qh_t4_4,qh_t4_5],[qh_t5_1,qh_t5_2,qh_t5_3,qh_t5_4],[qh_t6_1,qh_t6_2,qh_t6_3]];
_statspwn1 = ["hw_prac1","hw_prac3","hw_prac5","hw_prac7","hw_prac9"];
_statspwn2 = ["hw_prac2","hw_prac4","hw_prac6","hw_prac8","hw_prac10"];
_mvhwspwn = [["hw_prac_spawn","hw_prac_wp"],["hw_prac_spawn2","hw_prac_wp2"],["hw_prac_spawn3","hw_prac_wp3"],["hw_prac_spawn4","hw_prac_wp4"]];
_mvmmgspwn = [["hw_prac_spawn","hw_prac_wp"],["hw_prac_spawn2","hw_prac_wp2"]];

// Start with Reset
[_mmgT] spawn fw_fnc_resetPopTargets;

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
clearweaponcargoGlobal qh_box;  
clearmagazinecargoGlobal qh_box;   


/**************************************************************************************************************

Course Code
Cases are Courses

**************************************************************************************************************/

switch (_nbr) do {
	// MMG Range
    case 1: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 10]; 

		// Create Target Array
		_targets = [];
		for [{_i=0}, {_i < 6}, {_i = _i + 1}] do {
			_element = (_mmgT select _i);
			_element = _element call BIS_fnc_arrayShuffle;
			_element resize 1;
			_targets append _element;
		};

		// Init Timer and Loop Variable
		private _start = CBA_MissionTime;
		_draw = round random 7;
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			private _hits = 8;
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			// Reduce Hit count for 1km targets
			//if (_terminal getVariable ["SR_Hit",0] == 10) then {_hits = 3};
			[_target,_hits,_terminal] spawn fw_fnc_eventHit;
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

			// If course completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 6) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 500) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];
	};
	// MMG 2 - Moving Vic
    case 2: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 10]; 

		// Create Spawn Target Vic
		["qh_mmg_spawn","qh_mmg_wp","O_G_Offroad_01_armed_F",true,4.5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 200) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// NLAW
    case 3: {
		
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addWeaponCargoGlobal ["UK3CB_BAF_NLAW_Launcher", 10];

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			if (_terminal getVariable ["SR_Hit",0] == 1) then {
				["qh_mmg_spawn2","qh_mmg_wp2","rhs_btr60_vdv",true,5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;
			} else {
				["qh_mmg_spawn","qh_mmg_wp","rhs_bmp2k_tv",false,5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;
			};
			
			// Wait Until target has been hit or Course abborded
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if ((_s + 1) == 2) exitWith {};
		}; 
		sleep 5;
		
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// MAT Direct and AirBurst
    case 4: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammobox
		qh_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];  
		qh_box addmagazinecargoGlobal ["MRAWS_HE_F", 10];

		// Create Target Array
		_targets = [];
		for [{_i=0}, {_i < 4}, {_i = _i + 1}] do {
			_element = (_mmgT select _i);
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
			private _hits = 1;
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			// Reduce Hit count for 1km targets
			[_target,_hits,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;

			private _s = _terminal getVariable ["SR_Hit",0];

			// Wait Until target has been hit or Course aborted
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If course completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 4) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 7) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
		
		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];
	};
	// MAT Heavy Target
    case 5: {
		
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];  
		qh_box addmagazinecargoGlobal ["MRAWS_HE_F", 10];

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			if (_terminal getVariable ["SR_Hit",0] == 1) then {
				[(selectRandom ["qh_mat_static1","qh_mat_static2"]),(selectRandom ["rhs_t80","rhs_t80U"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			} else {
				[(selectRandom ["qh_mat_static3","qh_mat_static4"]),(selectRandom ["rhs_t72be_tv"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			};
			
			// Wait Until target has been hit or Course abborded
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 2) exitWith {};
		}; 

		sleep 5;
	
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;
		
		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];		
	};
	// MAT Moving Target
    case 6: {
		
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];  
		qh_box addmagazinecargoGlobal ["MRAWS_HE_F", 10];

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			["qh_mmg_spawn","qh_mmg_wp","rhs_btr60_vdv",true,5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

			// Wait Until target has been hit or Course abborded
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if ((_s + 1) == 1) exitWith {};
		}; 
		sleep 5;
		
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;
		
		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];
	};
	// MMG - Moving Vic PRACTICE
    case 7: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		_path = selectRandom _mvmmgspwn;

		hint "Start";

		// Create Spawn Target Vic
		[(_path select 0),(_path select 1),(selectRandom ["O_G_Offroad_01_armed_F","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9"]),true,4.5,_terminal,_g,true] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 200) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str; 

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		hint "End";
	};
	// MAT Heavy Target PRACTICE
    case 8: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		hint "Start";

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			if (_terminal getVariable ["SR_Hit",0] == 1) then {
				[(selectRandom _statspwn1),(selectRandom ["rhs_bmp2k_tv","rhs_bmp1_tv"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			} else {
				[(selectRandom _statspwn2),(selectRandom ["rhs_t80","rhs_btr60_vdv","rhs_t72be_tv"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			};
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 2) exitWith {};
		}; 

		sleep 5;
	
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str;

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		hint "End";
	};
	// MAT - Moving Target PRACTICE
	case 9: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		_path = selectRandom _mvhwspwn;

		hint "Start";

		// Create Spawn Target Vic
		[(_path select 0),(_path select 1),"rhs_bmp2k_tv",true,4.5,_terminal,_g,true] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 200) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str; 

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		hint "End";
	};
	// HAT
	case 10: {
		
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qh_box addWeaponCargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 10];

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			if (_terminal getVariable ["SR_Hit",0] == 1) then {
				["qh_mmg_spawn2","qh_mmg_wp2","rhs_btr60_vdv",true,5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;	
			} else {
				[(selectRandom ["qh_mat_jav1"]),(selectRandom ["rhs_t80"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			};
			
			// Wait Until target has been hit or Course abborded
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if ((_s + 1) == 2) exitWith {};
		}; 
		sleep 5;
		
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// MMG -Static target PRACTICE
	case 11: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		_draw = round random 7;
		_dirMod = 40;
		_current = 0;
		
		hint "Start";
		_targetspwn = _statspwn1 + _statspwn2;
//		_targetspwn pushBack _statspwn2;
		_targetspwn = _targetspwn call BIS_fnc_arrayShuffle;
				
		while {_terminal getVariable ["SR_Test",false]} do {
			_spawnMarker = _targetspwn select _current;
			_target = "SR_PopUpTarget_Big" createVehicle [0,0,0];
			_target setDir _dirMod;
			_target setPos (markerPos _spawnMarker);
	
			private _hits = 8;
			//[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,_hits,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_current = _current + 1;
			
			// Random Weapon Jam
			private _s = _terminal getVariable ["SR_Hit",0];
			if (_s == 3 + _draw) then {
				[_con, currentWeapon _con] remoteExec ["ace_overheating_fnc_jamWeapon",_con,true];
			};
			// Wait Until target has been hit or Course aborted
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 6) exitWith {};
		};
		// If course completed compile result message
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 500) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str; 
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];
	
		_pos = markerPos "hws";
		_targets = [];
		_targets append (_pos nearObjects ["TargetBootcampHumanSimple_F",700]);
		{
			deleteVehicle _x;
		} forEach _targets;
		
		hint "End";
	};
	//MAT Airburst Practice
	case 12 :{
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		hint "Start";

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			if (_terminal getVariable ["SR_Hit",0] == 1) then {
				[(selectRandom _statspwn1),(selectRandom ["O_G_Offroad_01_armed_F","rhsgref_cdf_reg_uaz_spg9"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			} else {
				[(selectRandom _statspwn2),(selectRandom ["rhsgref_cdf_reg_uaz_dshkm","RHS_UAZ_MSV_01"]),(round random 90),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			};
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 2) exitWith {};
		}; 

		sleep 5;
	
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 3) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str;

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		hint "End";	
	};
	// MAT RPG
    case 13: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qh_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammobox
		qh_box addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag", 10];  
		qh_box addmagazinecargoGlobal ["rhs_rpg7_PG7VR_mag", 10];

		// Create Target Array
		
		_targets = [qh_t1_5,qh_t2_4,qh_t2_2];
		_targets = _targets call BIS_fnc_arrayShuffle;
		_element = [qh_t1_1,qh_t1_2,qh_t1_3];
		_element = _element call BIS_fnc_arrayShuffle;
		
		for [{_i=0}, {_i < 3}, {_i = _i + 1}] do {
			_tandem = (_element select _i);
			_targets pushBack _tandem;
		};
		
		//Loop Variable
		_current = 0;

		// Target Pop-Up Course function
		while {_terminal getVariable ["SR_Test",false]} do {

			// Prepare and Popup Target
			private _hits = 1;
			_target = _targets select _current;
			[_target,clientOwner] remoteExec ["setOwner",2];
			// Reduce Hit count for 1km targets
			[_target,_hits,_terminal] spawn fw_fnc_eventHit;
			sleep 2;
			_target animate ["terc", 0];
			_current = _current + 1;

			private _s = _terminal getVariable ["SR_Hit",0];

			// Wait Until target has been hit or Course aborted
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

			// If course completed compile result message
			if (_terminal getVariable ["SR_Hit",0] == 6) exitWith {
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 8) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 
		
		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];
		
		// End Horn
		[qh_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// Course Info for Instructor
	case 0: {

		// Remove all Tasks
		[_g] call fw_fnc_removeTasks;

		// Reset _terminal
		_terminal setVariable ["SR_Test",false,true];

		{
			_x setPos (markerPos "qh_base");
			sleep 1;
		}forEach units group _ldr;

		// General
		_task = _ldr createSimpleTask ["Heavy Weapons Qualification Info"];
		_task setSimpleTaskDescription ["Recommended order by tasks. Individual courses can be repeated, preferely not back-to-back. Procedures are evaluated by the Instructor. Most of the hard requirements are evaluated by the script and will be provided as a message at the end of each individual course.","Heavy Weapons Qualification Info",""];
		_task setSimpleTaskDestination (markerPos "qh_base");

		// MMG 1
		_task = _ldr createSimpleTask ["MMG 1 - Static Targets"];
		_task setSimpleTaskDescription ["Engage 12 Targets down Range (multi-hit-targets). <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/> Testee needs to fire at least 3-round-bursts.
		<br/>","MMG Range 1 - Static Target",""];

		// MMG 2
		_task = _ldr createSimpleTask ["MMG 2 - Moving Targets"];
		_task setSimpleTaskDescription ["Engage the approaching Vehicle. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/> Testee needs to fire at least 3-round-bursts.
		<br/>","MMG 2 - Moving Target",""];

		// NLAW
		_task = _ldr createSimpleTask ["NLAW"];
		_task setSimpleTaskDescription ["Engage the two approaching Vehicles. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","NLAW",""];

		// MAT HEDP
		_task = _ldr createSimpleTask ["MAT - HEDP"];
		_task setSimpleTaskDescription ["Engage the 5 Targets. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","MAT - HEDP",""];

		// MAT HE Airburst
		_task = _ldr createSimpleTask ["MAT - HE Airburst"];
		_task setSimpleTaskDescription ["Engage the 5 Targets. <br/>Rockets must explode in the air (Airburst). <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","MAT - HE Airburst",""];

		// MAT HEDP Heavy Target
		_task = _ldr createSimpleTask ["MAT - HEDP Heavy Target"];
		_task setSimpleTaskDescription ["Engage the 2 heavy Targets. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","MAT - HEDP Heavy Target",""];

		// MAT HEDP Moving Target
		_task = _ldr createSimpleTask ["MAT - HEDP Moving Target"];
		_task setSimpleTaskDescription ["Engage the 1 Target approaching. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","MAT - HEDP Moving Target",""];

		// RPG MAT HEDP
		_task = _ldr createSimpleTask ["RPG MAT"];
		_task setSimpleTaskDescription ["Testee equips MAT-RU loadout.<br/>Engage the 6 Targets. <br/>The first 3 ranging from 300-500m with PG-7VL - HEAT Light shells<br/>The second 3 ranging 100-200 with PG-7VR - Tandem Charge HEAVY shells <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to either side of the target.<br/>
		<br/>","RPG MAT",""];

		// HAT
		_task = _ldr createSimpleTask ["HAT"];
		_task setSimpleTaskDescription ["Engage the 2 Target one behind cover with top mode and one moving with eitehr top or direct. <br/>Instructor is allowed to correct the Testee, but not provede ranges. Meaning calling weither the tester is shooting above, below or off to eitehr side of the target.<br/>
		<br/>","HAT",""];
	};
};