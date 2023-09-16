/*
/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Terminal as Object
		<--(Optinal) Contestent as Object

		Description:
			Manages the Courses of the Marksman Qualification.
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;

// Shooting Targets Arrays
_pT = [qmm_pt1,qmm_pt2,qmm_pt3];
_sT = [qmm_1,qmm_2,qmm_3,qmm_4,qmm_5,qmm_6,qmm_7,qmm_8,qmm_9];
_eT = [qmm_21,qmm_22,qmm_23,qmm_24];
_statbtr = ["mm_btr1","mm_btr2","mm_btr3","mm_btr4","mm_btr5","mm_btr6"];

// Start with Reset
[[_sT + _eT + _pT]] spawn fw_fnc_resetPopTargets;

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
clearweaponcargoGlobal qmm_range_ammo;  
clearmagazinecargoGlobal qmm_range_ammo;   

// Init Timer and Loop Variable
private _start = CBA_MissionTime;

/**************************************************************************************************************

Course Code
Cases are Courses

**************************************************************************************************************/

switch (_nbr) do {
	// DMR Range
    case 1: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Create Target Array
		_targets = _pT;
		_current = 0;

		// Set Wind
		[[-1,0, true]] remoteExec ["setWind",2];

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
				if (_shots <= 15 && _time <= 600) then {_result = "Passed"} else {_result = "Failed"};
				private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
				_str remoteExec ["hint", _g]; 
				_terminal setVariable ["SR_Test",false,true];
				_terminal setVariable ["SR_Hit",0,true];
				_con setVariable ["SR_Fire", 0];
			};
		}; 

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// Remove Target Plate Event Handler
		{
			[_x,"hitPart"] remoteExec ["removeAllEventHandlers",0];
		}forEach _targets;

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Sniper Rifle Silhouette
	case 3: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qmm_range_ammo additemcargoGlobal ["HandGrenade", 10];

		// Create Target Array
		_targets = _sT;

		// Init Loop Variable
		_current = 0;

		// Set Wind
		[[selectRandom [random [-6,-4,-2],random [6,4,2]], random -3, true]] remoteExec ["setWind",2];

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
			if (_terminal getVariable ["SR_Hit",0] == 9) exitWith {
				private _time = (CBA_missionTime - _start);
				private _result = "";
				private _shots = _con getVariable ["SR_Fire", 0];
				if (_shots <= 15 && _time <= 600) then {_result = "Passed"} else {_result = "Failed"};
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
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	// Static BTR
    case 4: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qmm_range_ammo addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 10];  

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			[(selectRandom ["qmm_static"]),(selectRandom ["rhs_btr60_vdv"]),(round random 10),3,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 1) exitWith {};
		}; 

		sleep 5;
	
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 2) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Moving Technical
	case 5: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qmm_range_ammo addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 10];  

		// Create Spawn Target Vic
		["qmm_spawn1","qmm_wp","O_G_Offroad_01_armed_F",true,3.5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 5) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Moving BTR
	case 6: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Fill Ammo Box
		qmm_range_ammo addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 10];  

		// Create Spawn Target Vic
		["qmm_spawn2","qmm_wp","rhs_btr60_vdv",true,4,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 5) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		_str remoteExec ["hint", _g]; 

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Static Tank Air Strike
    case 7: {
		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		CASCallAmmo = 1;
		PublicVariable "CASCallAmmo";

		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

			// Spawn Vehicle
			[(selectRandom ["qmm_static1","qmm_static2","qmm_static3","qmm_static4"]),(selectRandom ["rhs_btr60_vdv"]),(round random 30),5,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;
		
			
			// Wait Until target has been hit or Course aborted
			private _s = _terminal getVariable ["SR_Hit",0];
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
			if (_terminal getVariable ["SR_Hit",0] == 1) exitWith {};
		}; 

		sleep 3;

		// Reset Variables
		_terminal setVariable ["SR_Hit",0,true];
		_terminal setVariable ["SR_Test",false,true];
		_con setVariable ["SR_Fire", 0];

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Sniper Exercise
	case 8: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseStart;

		// Ammo to Ammobox
		qmm_range_ammo additemcargoGlobal ["HandGrenade", 10];

		// Create Target Array
		_targets = _eT;

		// Adjust Position
		_con setPos (markerPos (selectRandom ["qmm_ex1","qmm_ex2","qmm_ex3","qmm_ex4"]));
		_ldr setPos (markerPos "qmm_ex_inst"); 

		// Set Wind
		[[random -3, selectRandom [random [-5,-3,-2],random [5,3,2]], true]] remoteExec ["setWind",2];

		// Prepare and Popup Target
		{
			_target = _x;
			[_target,clientOwner] remoteExec ["setOwner",2];
			[_target,1,_terminal] spawn fw_fnc_eventHit;
			sleep 1;
			_target animate ["terc", 0];
		}forEach _targets;

		// Wait Until target has been hit or Course aborted
		private _s = _terminal getVariable ["SR_Hit",0];
		waitUntil {_terminal getVariable ["SR_Hit",0] == 3 || !(_terminal getVariable ["SR_Test",false])};

		// If couse completed compile result message
		if (_terminal getVariable ["SR_Hit",0] == 3) then {
			private _time = (CBA_missionTime - _start);
			private _result = "";
			private _shots = _con getVariable ["SR_Fire", 0];
			if (_shots <= 5 && _time <= 600) then {_result = "Passed"} else {_result = "Failed"};
			private _str = format ["Time Passed (in sec): %1\nShots Fired: %2\nCourse %3",_time,_shots,_result];
			_str remoteExec ["hint", _g]; 
			_terminal setVariable ["SR_Test",false,true];
			_terminal setVariable ["SR_Hit",0,true];
			_con setVariable ["SR_Fire", 0];
			
		};

		// Teleport
		{
			_x setPos (getPos qmm_range);
			sleep 1;
		}forEach units group _ldr;

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		[qmm_range_horn,_g] spawn fw_fnc_courseEnd;

		// Set Wind
		[[-1,-1, true]] remoteExec ["setWind",2];

		// Reset Course
		[[_targets]] spawn fw_fnc_resetPopTargets;
	};
	//Practice Moving Technical
	case 9: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		hint "Starting Wind";
		
		// Set Wind
		[[random -3, selectRandom [random [-5,-3,-2],random [5,3,2]], true]] remoteExec ["setWind",2];
		
		sleep 30;
		hint "Start";
		
		// Create Spawn Target Vic
		["mm_spawn1","mm_wp",(selectRandom ["O_G_Offroad_01_armed_F","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9"]),true,3.5,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 5) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str;

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];
		
		// Set Wind
		[[-1,-1, true]] remoteExec ["setWind",2];
	
		// End Horn
		hint "End";
	};
	//Practice Moving BTR
	case 10: {

		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;

		// Start Horn
		hint "Starting Wind";
		
		// Set Wind
		[[random -3, selectRandom [random [-5,-3,-2],random [5,3,2]], true]] remoteExec ["setWind",2];
		
		sleep 30;
		hint "Start";
					
		// Create Spawn Target Vic
		["mm_spawn2","mm_wp","rhs_btr60_vdv",true,4,_terminal,_g,false] spawn fw_fnc_spawnMovingCar;

		waitUntil {!(_terminal getVariable ["SR_Test",false]) || ((_terminal getVariable ["SR_Hit",0]) == 1)};
		sleep 2;

		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
		if (_shots <= 5) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
		hint _str;

		// End
		_terminal setVariable ["SR_Test",false,true];
		_terminal setVariable ["SR_Hit",0,true];
		_con setVariable ["SR_Fire", 0];

		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];
		
		// Set Wind
		[[-1,-1, true]] remoteExec ["setWind",2];
		
		// End Horn
		hint "End";
	};
	//  Activate Range with random wind
	case 11: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		// Start Horn
		hint "Start"; 
		
		// Set Wind
		[[random -3, selectRandom [random [-5,-3,-2],random [5,3,2]], true]] remoteExec ["setWind",2];
		
		// Wait Until target has been hit or Course aborted
		waitUntil {_terminal getVariable ["SR_Hit",0] == 5 || !(_terminal getVariable ["SR_Test",false])};

		// If course completed compile result message
		if (_terminal getVariable ["SR_Hit",0] > 5) then {
			private _result = "";
			private _shots = _con getVariable ["SR_Fire", 0];
			if (_shots <= 8) then {_result = "Passed"} else {_result = "Failed"};
			private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
			hint _str;
			_terminal setVariable ["SR_Test",false,true];
			_terminal setVariable ["SR_Hit",0,true];
			_con setVariable ["SR_Fire", 0];
			
		};
		
		// Remove Fired EH from Shooter
		_con  removeEventHandler ["Fired", _ehShooter];

		// End Horn
		hint "End";

		// Set Wind
		[[-1,-1, true]] remoteExec ["setWind",2];
	};
	// Static BTR random spawn
	case 12: {
		// add Shooter EH
		_ehShooter = [_con] call fw_fnc_trackShooter;
		
		CASCallAmmo = 1;
		PublicVariable "CASCallAmmo";
		// Start Horn
		hint "Start";
		
		// Set Wind
		[[random -3, selectRandom [random [-5,-3,-2],random [5,3,2]], true]] remoteExec ["setWind",2];
	
		// Spawn Loop
		while {_terminal getVariable ["SR_Test",false]} do {

		// Spawn Vehicle
		[(selectRandom _statbtr),(selectRandom ["rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv","rhs_ins_btr60"]),(round random 90),4,_terminal,_g,false] spawn fw_fnc_spawnStaticCar;

			
		// Wait Until target has been hit or Course aborted
		private _s = _terminal getVariable ["SR_Hit",0];
		waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
		if (_terminal getVariable ["SR_Hit",0] == 1) exitWith {};
		}; 

		sleep 5;
	
		// Evaluation
		private _result = "";
		private _shots = _con getVariable ["SR_Fire", 0];
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
		
		// Set Wind
		[[-1,-1, true]] remoteExec ["setWind",2];	
	};
	// Course Info for Instructor
	case 0: {

		// Remove all Tasks
		[_g] call fw_fnc_removeTasks;

		// Reset _terminal
		_terminal setVariable ["SR_Test",false,true];

		{
			_x setPos (getPos qmm_range);
			sleep 1;
		}forEach units group _ldr;

		// DMR
		_task1 = _ldr createSimpleTask ["DMR on Target"];
		_task1 setSimpleTaskDescription ["Testee engages Targets 1-3. It requires a hit in the center. Instructor can call adjustments, but will not give range or wind. Testee has to shoot without the precise range and wind.<br/>
		<br/>","DMR on Target",""];
		_task1 setSimpleTaskDestination (getPos qmm_range);

		// Sniper
		_task2 = _ldr createSimpleTask ["Sniper Questions"];
		_task2 setSimpleTaskDescription ["Testee has to explain how to use the vector, kestrel and rangecard. He has to show that he understands all the tools."
		,"Sniper on Target",""];
		_task2 setSimpleTaskDestination (getPos qmm_range);
	
		// Questions Sniper
		_task2 = _ldr createSimpleTask ["Sniper Questions"];
		_task2 setSimpleTaskDescription ["Q: Provide Crosswind to a specific bearing<br/>- Instructor will varify that the Testee knows how to operate Kestrel.<br/><br/>
		Q: How does Headwind impact the ballistics?<br/>- Slows down the bullet -> faster drop <br/><br/>
		Q: How does Tailwind impact the ballistics?<br/>- Speeds up the bullet -> slower drop"
		,"Sniper on Target",""];
		_task2 setSimpleTaskDestination (getPos qmm_range);

		// Sniper Silhouette
		_task3 = _ldr createSimpleTask ["Sniper Silhouette"];
		_task3 setSimpleTaskDescription ["Testee engages the 10 Targets down range. Instructor will provide range and wind. Time is crucial. For the first target the testee has to provide crosswind and headwind."
		,"Sniper Silhouette",""];
		_task3 setSimpleTaskDestination (getPos qmm_range);

		// Sniper Static Target
		_task3 = _ldr createSimpleTask ["Anti-Material Static"];
		_task3 setSimpleTaskDescription ["Testee has to engage the static target and disable the gun. Instructor will provide range and wind."
		,"Anti-Material Static",""];
		_task3 setSimpleTaskDestination (getPos qmm_range);

		// Sniper moving Target
		_task3 = _ldr createSimpleTask ["Anti-Material Moving Technical"];
		_task3 setSimpleTaskDescription ["Testee has to engage the static target, destroying the engine and/or crew. Instructor will provide range and wind."
		,"Anti-Material Moving Technical",""];
		_task3 setSimpleTaskDestination (getPos qmm_range);

		// cas
		_task3 = _ldr createSimpleTask ["CAS"];
		_task3 setSimpleTaskDescription ["Testee has to provide accurate marker for the Tank. Instructor will call CAS. Tank must be destroyed."
		,"CAS",""];
		_task3 setSimpleTaskDestination (getPos qmm_range);

		// final
		_task3 = _ldr createSimpleTask ["Final Exam"];
		_task3 setSimpleTaskDescription ["Testee must sneak into position and engage 3 out of 4 targets successfully within 5min while not being detected by the Instructor. There must be a 10 second pause between shots and request over radio. Once the first target has been engaged the Instructor is allowed to spot with his vector."
		,"Final Exam",""];
		_task3 setSimpleTaskDestination (getPos qmm_range);
	};
};