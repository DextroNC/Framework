/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Contestent as Object

		Description:
			Manages the Courses of the Medical Qualification.
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;
suppression = 20;


// Unified Start
// Terminal set Active
_terminal setVariable ["SR_Test",true,true];
_terminal setVariable ["SR_Hit",0,true];
// Select Group Leader if group only has 1 person
if (isNil "_con") then {
	_con = ((units _g) - [leader _g]) select 0;
	if (isNil "_con") then {_con = leader _g};
};

// Phase Case means Phase
switch (_nbr) do {
	// Medical Station
	case 1: {
		hint format ["Testee: %1",_con];

		// Start Horn
		[qm_horn,_g] spawn fw_fnc_courseStart;

		clearItemCargoGlobal qm_box;  
		qm_box addItemCargoGlobal ["SR_Bandage_Pack", 10];   
		qm_box addItemCargoGlobal ["SR_Medicine_Pack", 10];   
		qm_box addItemCargoGlobal ["SR_Utility_Pack", 10];   
		qm_box addItemCargoGlobal ["SR_BloodIV_Pack", 10]; 

		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units <= 10} do {
			
			// Spawn Wounded
			private _pos = ["qm_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// time draw
			private _start = CBA_missionTime;
			_draw = random [120,180,210];

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			} else {
				"New Wounded" remoteExec ["hint", _g];
			};

			// Wait for status or time
			waitUntil {{_x getVariable ["ACE_isUnconscious", false] && alive _x} count _units < 3 || CBA_missionTime - _start > _draw || !(_terminal getVariable ["SR_Test",false])};
			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// End Horn
		[qm_horn,_g] spawn fw_fnc_courseEnd;

		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
		
	};
	case 2: {
		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 1} do {
			
			// Spawn Wounded
			private _pos = ["qm_prac_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// time draw
			private _start = CBA_missionTime;
			_draw = random [120,180,210];

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			};

			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};
		
		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
		
	};
	case 3: {
		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 3} do {
			
			// Spawn Wounded
			private _pos = ["qm_prac_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// time draw
			private _start = CBA_missionTime;
			_draw = random [120,180,210];

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			};

			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
		
	};
	// Course Info for Instructor
	case 0: {
		hint format ["Testee: %1",_con];

		// Removes all Tasks
		[_g] call fw_fnc_removeTasks;

		// Reset Terminal
		_terminal setVariable ["SR_Test",false,true];

		{
			_x setPos (markerPos "qm_base");
			sleep 1;
		}forEach units group _ldr;

		// General
		_task = _ldr createSimpleTask ["Medical Qualification Info"];
		_task setSimpleTaskDescription ["A Series of Questions and small theoretic Scenarios to be answered by the Testee. 
		The evaluation in regards to questions is based on proper medical procedure and medical knowledge. 
		The majority of questions has to be answered correctly. Theoretic Scenarios have to be solved following accurate medical procedures.","Medical Qualification Info",""];
		_task setSimpleTaskDestination (getPos qm_flag);

		// Questions
		_task = _ldr createSimpleTask ["Q: Procedure General"];
		_task setSimpleTaskDescription ["Q: Describe the Medical Procedure Steps
		<br/>- Alert (over Radio)<br/>- Recover<br/>- Stop Bleeding<br/>- Diagnose<br/>- Medicate<br/>- Release","Q: Procedure General",""];

		// Alert
		_task = _ldr createSimpleTask ["Q: Alert"];
		_task setSimpleTaskDescription ["Q: How to Alert
		<br/>
		- over the radio to ensure awareness
		<br/><br/>
		Q: When to Alert
		<br/>- immidiately
		","Q: Alert",""];

		// Recover
		_task = _ldr createSimpleTask ["Q: Recover"];
		_task setSimpleTaskDescription ["Q: How to Recover
		<br/>
		- bring patient to cover<br/>
		- request/use smoke and suppressive fire<br/>
		- limit individual risk<br/>
		- appropriate movement method (carry/drag)<br/>
		- treatment location should be in cover and covered by friendlies
		<br/><br/>
		Q: When to drag/carry
		<br/>
		- drag: short distance since quicker<br/>
		- carry: large distances
		<br/><br/>
		Q: When can I treat at point of injury
		<br/>
		- never (a dead patient is not as bad as a dead medic)
		","Q: Recover",""];

		// Treament and Vitals
		_task = _ldr createSimpleTask ["Q: Treatment and Vitals"];
		_task setSimpleTaskDescription ["Q: What primary vital stages exist and what are their entry conditions?
		<br/>
		- Injured - hemorrhage 1 to 3, pain<br/>
		- Critical (Unconcious) - Critical injury, critival vitals, overdose<br/>
		- Cardiac Arrest - Hemorrhage 4, large damage to vital organs, large sum of trauma<br/>
		- Fatal - Fatal blood volume, more than 5 minutes of cardiac arrest without treatment
		<br/><br/>
		Q: If a patient is bleeding, what do you do?
		<br/>
		- Apply tourniquets and bandages
		<br/><br/>
		Q: What are the differt between bandages and their general effect
		<br/>
		- Field Dressing - Bandage with medium effectiveness while being prone to open<br/>
		- Packing Bandage - Bandage with low effectiveness with moderate likeliness to reopen<br/>
		- Elastic Bandage - Highly effective bandage which is highly likely to reopen<br/>
		- Quick Clot - Low effectiveness to close the wound while maintaining a decent ability to keep the wound closed
		<br/><br/>
		Q: What are the effects of a tourniquet 
		<br/>
		- stops bleeding<br/>
		- less mobility<br/>
		- causes pain over time
		<br/><br/>
		Q: What is Morphine doing
		<br/>
		- reduces pain<br/>
		- can cause overdose
		<br/><br/>
		Q: What is Epinephrine doing
		<br/>
		- wakes up unconcious patient<br/>
		- can cause overdose
		<br/><br/>
		Q: What are primary treamtents and their priority?
		<br/>
		- CPR to restore heart rate <br/>
		- IV Transfusion to restore blood pressure <br/>
		- Epinephrine to wake patient up <br/>
		- Morphine to reduce pain
		<br/><br/>
		Q: What are secondary treamtents and their priority?
		<br/>
		- Bandage all wounds <br/>
		- Remove tourniquets <br/>
		- Apply splints<br/>
		- Stich wounds
		<br/><br/>
		Q: When do you skip secondary treatments?
		<br/>
		- patient is operational and needed e.g. combat ready
		<br/><br/>
		Q: What is the priority in a mass casualty situation
		<br/>
		- getting as many patients as possible to combat-ready state
		<br/><br/>
		Q: What is the treatment priority
		<br/>
		- medical personnel
		- leadership personnel
		- regular soldiers
		- secondly who can be brought to combat-ready state the quickest
		<br/><br/>
		Q: What is the responsibility of a medic besides treating patients
		<br/>
		- fighting<br/>
		- distribution of medical equipment
		","Q: Treatment and Vitals",""];

		// Triage
		_task = _ldr createSimpleTask ["Q: Triage Station"];
		_task setSimpleTaskDescription ["
		Q: What is a Triage Station
		<br/>
		- centralized treatment location to gather wounded<br/>
		<br/><br/>
		Q: Who is incharge of a Triage Station
		<br/>
		- Platoon Medic<br/>
		- with Platoon Medic absent the first Medic at the station
		<br/><br/>
		Q: What kind of personnel is operating at a Triage Station
		<br/>
		- medical personnel: focussed on medic exclusive treatment options (diagnose and medicate)<br/>
		- assistant personnel: stop the bleeding of incomming patients, provide CPR and lining them up for easier treatment
		<br/><br/>
		Q: As a medic arriving at a triage station what do you do
		<br/>
		- ask the person incharge what to do
		<br/><br/>
		Q: How many people should treat one patient
		<br/>
		- only one<br/>
		- exception: heavily bleeding patient at risk of dying momentarily
		","Q: Triage Station",""];

		// Triage 2
		_task = _ldr createSimpleTask ["Q: Triage Station 2"];
		_task setSimpleTaskDescription ["
		Q: How much and what personnel is needed to deal with 3 stabilized patients
		<br/>
		- one medic to treat<br/>
		- one assistant to keep others stabilized<br/>
		- additional personnel to cover
		<br/><br/>
		Q: What is the load a triage station with one medic and one assistant (assuming it does not require covering) can handle
		<br/>
		- 2-4 non-bleeding patients and 1-2 critical patients<br/>
		- medic is treating the stabilized patients while the assistant is dealing with the critical patients and the upkeep of the stabilized state<br/>
		- if amount of critical patients exceeds assistant personnel the medic has to help stabilizing
		<br/><br/>
		Q: What should a medic do with incoming patients to increase effectiveness of the triage station
		<br/>
		- quickly diagnose to assess treatment priorities
		","Q: Triage Station 2",""];

		// practical part
		_task = _ldr createSimpleTask ["Practical Part"];
		_task setSimpleTaskDescription ["
		Situation:<br/>
		Both Testee and Instructor are at a Triage Station. Multiple wounded will appear and require treatment. The Testee will be the Medic and the Instructor will be the assistant.
		<br/><br/>
		Requirements:<br/>
		- proper application of procedure<br/>
		- proper prioritization, maximizing survival of patients over finishing treatment of an individual patient, maximizing combat-ready state patients<br/>
		- does not continue treating dead patients<br/>
		","Practical Part",""];
		_task setSimpleTaskDestination (markerPos "qm_area");
	};
};