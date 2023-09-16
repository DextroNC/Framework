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

// Init Timer and Loop Variable
private _start = CBA_MissionTime;

/**************************************************************************************************************

Course Code
Cases are Courses

**************************************************************************************************************/

switch (_nbr) do {
	// Defusal
    case 1: {

		// Start Horn
		[qe_horn,_g] spawn fw_fnc_courseStart;

		// Parameter Init
		_class = "APERSMine";
		_mines = [];

		// Show Marker
		"qe_mines" setMarkerAlpha 1;

		// Create Mines
		for "_i" from 1 to 10 do {
			private _pos = ["qe_mines", true] call CBA_fnc_randPosArea;
			private _veh = createMine [_class,_pos, [], 0];
			_mines pushBack _veh;
		};
		
		// WaitUntil End
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || damage _con > 0.1 || {alive _x} count _mines <= 7};
		"qe_mines" setMarkerAlpha 0;

		// Result Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if (damage _con <= 0.1 && {alive _x} count _mines <= 7) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Time Passed (in sec): %1\nCourse %2",_time,_result];
		_str remoteExec ["hint", _g]; 
		_terminal setVariable ["SR_Test",false,true];

		// Delete Mines
		{
			deleteVehicle _x;
		} forEach _mines;

		// End Horn
		[qe_horn,_g] spawn fw_fnc_courseEnd;
	};
	// Light Repair
	case 2: {
		// Start Horn
		[qe_horn,_g] spawn fw_fnc_courseStart;

		_wheels = ["wheel_1","wheel_2","wheel_3","wheel_4"];
				
		private _veh = createVehicle ["rhsusf_m1025_d",(position qe_vehicle_spawn), [], 0, "NONE"];
		_veh setDir (direction qe_vehicle_spawn);
		_veh sethit [selectRandom _wheels, 1];
		
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || {_veh getHit _x == 0} count _wheels == 4};
		
		// Result Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if ({_veh getHit _x == 0} count _wheels == 4) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Time Passed (in sec): %1\nCourse %2",_time,_result];
		_str remoteExec ["hint", _g]; 
		_terminal setVariable ["SR_Test",false,true];

		// End Horn
		[qe_horn,_g] spawn fw_fnc_courseEnd;

		// DeleteVehicle
		sleep 3;
		deleteVehicle _veh;
	};
	// Full  Repair
	case 3: {
		// Start Horn
		[qe_horn,_g] spawn fw_fnc_courseStart;

		_wheels = ["wheel_1","wheel_2","wheel_3","wheel_4"];
				
		private _veh = createVehicle ["rhsusf_m1025_d",(position qe_vehicle_spawn), [], 0, "NONE"];
		_veh setDir (direction qe_vehicle_spawn);
		_veh sethit [(selectRandom _wheels), 1];
		_veh sethit [(selectRandom _wheels), 1];
		_veh sethit ["engine", 0.75];
		_veh sethit ["vehicle", 0.5];
		_veh engineOn true;
		
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || {_veh getHit _x == 0} count _wheels == 4};
		
		// Result Message
		private _time = (CBA_missionTime - _start);
		private _result = "";
		if ({_veh getHit _x == 0} count _wheels == 4) then {_result = "Passed"} else {_result = "Failed"};
		private _str = format ["Time Passed (in sec): %1\nCourse %2",_time,_result];
		_str remoteExec ["hint", _g]; 
		_terminal setVariable ["SR_Test",false,true];

		// End Horn
		[qe_horn,_g] spawn fw_fnc_courseEnd;

		// DeleteVehicle
		sleep 3;
		deleteVehicle _veh;
	};
	// Transition
	case 4: {
		// Start Horn
		[qe_horn,_g] spawn fw_fnc_courseStart;

		// Marker
		"qe_drive" setMarkerAlpha 1;
				
		// Spawn Vehicle
		private _veh = createVehicle ["rhsusf_m1025_d_m2",(position qe_vehicle_spawn), [], 0, "NONE"];
		_veh setDir (direction qe_vehicle_spawn);
		_veh setVehicleAmmo 0;
		
		// Spawn Boxes
		[4,qe_box_spawn1] spawn fw_fnc_cargoSpawn;
		[2,qe_box_spawn2] spawn fw_fnc_cargoSpawn;
		[3,qe_box_spawn3] spawn fw_fnc_cargoSpawn;

		waitUntil {!(_terminal getVariable ["SR_Test",false])};
		_terminal setVariable ["SR_Test",false,true];

		// End Horn
		[qe_horn,_g] spawn fw_fnc_courseEnd;

		// DeleteVehicle
		sleep 3;
		deleteVehicle _veh;
		{
			deleteVehicle _x;
		}forEach nearestObjects [qe_box_spawn1,["Box_NATO_WpsSpecial_F"],50];
		{
			deleteVehicle _x;
		}forEach nearestObjects [markerPos "qe_drive",["CargoNet_01_box_F","CargoNet_01_barrels_F"],150];
		"qe_drive" setMarkerAlpha 0;
	};
	// Defence
	case 5: {
		// Start Horn
		[qe_horn,_g] spawn fw_fnc_courseStart;

		"qe_defend" setMarkerAlpha 1;
		"qe_attack" setMarkerAlpha 1;
		"qe_pos_main" setMarkerAlpha 1;
		"qe_pos_final" setMarkerAlpha 1;

		clearweaponcargoGlobal qe_ammo;  
		clearmagazinecargoGlobal qe_ammo;  
		clearitemcargoGlobal qe_ammo; 
		clearBackpackCargoGlobal qe_ammo; 
		qe_ammo additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 3];
		qe_ammo additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];
		qe_ammo addmagazinecargoGlobal ["UK3CB_BAF_127_100Rnd", 2];   
		qe_ammo addBackpackCargoGlobal ["VSM_OGA_carryall", 2];   

		waitUntil {!(_terminal getVariable ["SR_Test",false])};
		_terminal setVariable ["SR_Test",false,true];

		// End Horn
		[qe_horn,_g] spawn fw_fnc_courseEnd;

		// Clean Up
		sleep 3;
		_objects = [
			"Box_NATO_WpsSpecial_F",
			"UK3CB_BAF_Static_L111A1_Mid",
			"UK3CB_BAF_Static_L111A1_Low",
			"UK3CB_BAF_Static_L111A1_High",
			"ACE_envelope_small",
			"ACE_envelope_small_NoGeo",
			"ACE_envelope_big",
			"ACE_envelope_big_NoGeo",
			"Land_BagBunker_Small_F",
			"Land_BagFence_Round_F",
			"Land_BagFence_Long_F",
			"Land_CzechHedgehog_01_F",
			"Land_Razorwire_F",
			"Land_SandbagBarricade_01_half_F",
			"Land_SandbagBarricade_01_F",
			"Land_SandbagBarricade_01_hole_F"
		];
		// Delete Objects
		{
			deleteVehicle _x;
		}forEach nearestObjects [markerPos "qe_drive",_objects,250];
		// Delete Mines
		{
			if (_x distance2d (markerPos "qe_drive") <= 250) then {
				deleteVehicle _x;
			};
		}forEach allMines;
		// Hide Markers
		"qe_defend" setMarkerAlpha 0;
		"qe_attack" setMarkerAlpha 0;
		"qe_pos_main" setMarkerAlpha 0;
		"qe_pos_final" setMarkerAlpha 0;
	};
	// PRACTICE Light Repair
	case 6: {
		_wheels = ["wheel_1","wheel_2","wheel_3","wheel_4"];
				
		private _veh = createVehicle ["rhsusf_m1025_d",(position qe_prac_spawn1), [], 0, "NONE"];
		_veh setDir (direction qe_prac_spawn1);
		_veh sethit [selectRandom _wheels, 1];
		
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || {_veh getHit _x == 0} count _wheels == 4};
		_terminal setVariable ["SR_Test",false,true];

		// DeleteVehicle
		sleep 2;
		deleteVehicle _veh;
	};
	// PRACTICE Full Repair
	case 7: {
		_wheels = ["wheel_1","wheel_2","wheel_3","wheel_4"];
				
		private _veh = createVehicle ["rhsusf_m1025_d",(position qe_prac_spawn1), [], 0, "NONE"];
		_veh setDir (direction qe_prac_spawn1);
		_veh sethit [(selectRandom _wheels), 1];
		_veh sethit [(selectRandom _wheels), 1];
		_veh sethit ["engine", 0.75];
		_veh sethit ["vehicle", 0.5];
		_veh engineOn true;
		
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || {_veh getHit _x == 0} count _wheels == 4};
		_terminal setVariable ["SR_Test",false,true];

		// DeleteVehicle
		sleep 2;
		deleteVehicle _veh;
	};
	// Practice Defusal
    case 8: {
		// Parameter Init
		_class = "APERSMine";
		_mines = [];

		// Create Mines
		for "_i" from 1 to 10 do {
			private _pos = ["qe_p_mines", true] call CBA_fnc_randPosArea;
			private _veh = createMine [_class,_pos, [], 0];
			_mines pushBack _veh;
		};
		
		// WaitUntil End
		waitUntil {!(_terminal getVariable ["SR_Test",false]) || {alive _x} count _mines == 0};
		_terminal setVariable ["SR_Test",false,true];

		// Delete Mines
		{
			deleteVehicle _x;
		} forEach _mines;
	};
	// Course Info for Instructor
	case 0: {

		// Remove all Tasks
		[_g] call fw_fnc_removeTasks;

		// Reset _terminal
		_terminal setVariable ["SR_Test",false,true];

		{
			_x setPos (markerPos "qe_main");
			sleep 1;
		}forEach units group _ldr;

		// Question
		_task = _ldr createSimpleTask ["Questions: Explosives"];
		_task setSimpleTaskDescription ["
		Testee prove his knowledge about explosives.<br/><br/>
		Q: Name the Explosives on the Table (left to right), including their purpose and usage. 
		<br/>
		- APERS Bounding Mine - Pressure activated anti-personnel mine (Bouncing Betty).<br/>
		- APERS Mine - Classic pressure activated anti-personnel mine.<br/>
		- AT Mine - Anti vehicle / tank mine activated by pressure. It will not be activated by infantry stepping on it.<br/>
		- APERS Tripwire Mine - Classic anti-personnel mine activated by a tripwire.<br/>
		- IED - Either pressure or remotely activated. Usually based on a artillery shell. Highly effective with a large explosion radius. Effective against vehicles and personnel.<br/>
		- SLAM - Directional anti vehicle / tank mine. Either activated by pressure in bottom attack mode, laser in side attack mode or remotely activated.<br/>
		- Claymore - Directional anti-personnel mine. Usually remotely activated.<br/>
		- Explosive Charge - Explosive charge activated either by timer or remotely.<br/>
		- Explosive Satchel - Large explosive charge activated either by timer or remotely.<br/>
		<br/>
		Q: What common targets require Explosive Stachels / Explosive Charges.
		<br/>
		- Stachels: Buildings, Tanks
		- Charges: Planes, Walls
		","Questions: Explosives",""];
		_task setSimpleTaskDestination (markerPos "qe_main");

		// Mine defusal
		_task = _ldr createSimpleTask ["Mine Defusal"];
		_task setSimpleTaskDescription ["Testee Kit: EOD <br/><br/>
		Q: What are the two methods of defusing an explosive?<br/>
		- Defusal Kit and Shooting it
		<br/><br/>
		Testee has to clear 3 mines from the mine field (by defusing).
		","Mine Defusal",""];
		_task setSimpleTaskDestination (markerPos "qe_mines");

		// Light Repair
		_task = _ldr createSimpleTask ["Light Repair"];
		_task setSimpleTaskDescription ["Testee Kit: EOD <br/><br/>
		Testee has to change the Wheel of the vehicle.
		","Light Repair",""];
		_task setSimpleTaskDestination (markerPos "qe_main");

		// Full Repair
		_task = _ldr createSimpleTask ["Full Repair"];
		_task setSimpleTaskDescription ["Testee Kit: Repair <br/><br/>
		Testee has to conduct a full repair.
		","Full Repair",""];
		_task setSimpleTaskDestination (markerPos "qe_main");

		// Transition
		_task = _ldr createSimpleTask ["Transition to Defence Course"];
		_task setSimpleTaskDescription ["Testee Kit: Fortification <br/><br/>
		Testee has to load the box with the dissassembled machine gun. Further he has to drive the instructor to the defence location. He has to use the present vehicle supply box to resupply the vehicle and collect the fortification resources from the box present. In addition the transported box must be unloaded<br/><br/>
		Both should leave the vehicle before ending over the terminal.
		","Transition to Defence Course",""];
		_task setSimpleTaskDestination (markerPos "qe_drive");

		// Transition
		_task = _ldr createSimpleTask ["Defence"];
		_task setSimpleTaskDescription ["Testee Kit: Fortification <br/><br/>
		Q: How do you organize your defence?<br/>
		- In layers. Preferebly 3 (Forward Position, Main Position, Final Stand).
		<br/><br/>
		Q: What defines the Forward Postion?<br/>
		- Detection and delay engagement of the enemy before their arrival at the main position. A temporary postion with only low resource commitment.
		<br/><br/>
		Q: What defines the Main Position?<br/>
		- Main line of defence, most resource commitment.
		<br/><br/>
		Q: What defines the Final Stand?<br/>
		- Last and final fallback position (last option).
		<br/><br/>
		Scenario: Defence of the Compount (blue area restriction)<br/>
		- Testee has to define Forward Position (south-east by the powerline due to elevation and further view)<br/>
		- Testee has to define the escape routes from each position<br/>
		- Testee has to position and assemble the machine gun (building top floor) and has to describe the purpose of the gun (against light armored vehicles)<br/>
		- Testee has to load the Weapon with ammunition from the box<br/>
		- Testee has to place Slams (on incoming road)<br/>
		- Testee has to place Claymores (around Forward Position to deny enemy taking high ground)<br/>
		- Testee has to place Fortifications (trenches at Forward Position and fortifications at Main Position / Roadblock at stop-sign)<br/>
		- Testee has to define the Triage and Resupply Point (somewhere around or in the buildings)<br/>
		- Testee has to outline where he would deploy<br/>
		<br/><br/>
		Comment:<br/>
		Instructor should ask questions to assess the knowledge of the Testee. The goal is to evaluate weither the Testee understood the mechanics and tactical aspects of defending.
		He does not need to construct everything though. Deviations are allowed as long as the Testee can outline his thought-process which has to be conclusive.
		","Transition to Defence (Final)",""];
		_task setSimpleTaskDestination (markerPos "qe_drive");

	};
};