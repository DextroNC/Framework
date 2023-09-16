/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Terminal as Object
		<--(Optional) Contestent as Object

		Description:
			Manages the functions for the bootcamp
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;

_MT = [mt1,mt2,mt3,mt4,mt5,mt6,mt7,mt8,mt9,mt10,mt11,mt12,mt13,mt14,mt15,mt16,mt17,mt18,mt19,mt20,mt21,mt22,mt23,mt24,mt25,mt26,mt27,mt28];

// Unified Start
// _terminal set Active
_terminal setVariable ["SR_Test",true,true];
_terminal setVariable ["SR_Hit",0,true];

// Select Group Leader if group only has 1 person
if (isNil "_con") then {
	_con = ((units _g) - [leader _g]) select 0;
	if (isNil "_con") then {_con = leader _g};
};
// Removes Markers
FNC_Para_Cleanup = {
	// Input array of Marker Names
	{
		deleteMarker _x;
	} forEach _this;
};

// Parachute Result Info
FNC_Para_Result = {
	params ["_unit","_targetMarker"];
	
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
	private _str = format ["Landed: %1m from DZ\nCourse %2",_dist,_result];
	_str remoteExec ["hint", (group _unit)]; 
	_unit setPos (getPos (leader group _unit));
	_unit setVariable ["SR_Falling",false];
};

//Rifle targets
rifleTargets = {
	params ["_BRF","_terminal","_unit"];
		{
			[_x,clientOwner] remoteExec ["setOwner",2];
			[_x,2,_terminal] spawn fw_fnc_eventHit;
		} forEach _BRF ;
		
		// Create Target Array
		_targets = _BRF call BIS_fnc_arrayShuffle;
		"Get Ready" remoteExec ["hint", _unit];
		sleep 3;
		"Live" remoteExec ["hint", _unit];
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];
		{
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
			sleep 2;
			_x animate ["terc", 0];
			_x addEventHandler ["HandleDamage", {false}];
			_s = _terminal getVariable ["SR_Hit",0];
			if (_s == 2) then {
					[_unit, currentWeapon _unit] remoteExec ["ace_overheating_fnc_jamWeapon",_unit];
			};
			waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
		}forEach _targets;

		_terminal setVariable ["SR_Test",false,true];
		[[_BRF ]] spawn fw_fnc_resetPopTargets;
		
		"Cease Fire" remoteExec ["hint", _unit];
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];
		sleep 1;
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];
};

launcherTargets = {
	params ["_LT","_terminal","_unit"];
	
		_target = selectRandom _LT;
		[_target,clientOwner] remoteExec ["setOwner",2];
		[_target,1,_terminal] spawn fw_fnc_eventHit;
		
		"Get Ready" remoteExec ["hint", _unit];
		sleep 3;
		"Live" remoteExec ["hint", _unit];
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];

		_target animate ["terc", 0];
		_target addEventHandler ["HandleDamage", {false}];
		
		// Wait Until target has been hit or Course aborted
		private _s = _terminal getVariable ["SR_Hit",0];
		waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};

		_terminal setVariable ["SR_Test",false,true];		
		[[_LT ]] spawn fw_fnc_resetPopTargets;
		
		"Cease Fire" remoteExec ["hint", _unit];
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];
		sleep 1;
		["FD_Course_Active_F"] remoteExec ["playSound",_unit];
};
switch (_nbr) do {

 // Show Marker HALO
	case 1: {
		// Remove old Markers
		["BparaDZ","BparaStart","BDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [bc_para,"BDZ","DZ","mil_objective","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Create Eject Marker
		_mEject = createMarker ["BparaDZ",(getMarkerPos "mHALO_approach")];
		_mEject setMarkerText "Approach";
		_mEject setMarkerType "hd_arrow";
		_mEject setMarkerColor "colorBLUFOR";
		_mEject setMarkerDir ((getMarkerPos "mHALO_approach") getDir bc_para);
		
		// Create Start Marker
		_mStart = createMarker ["BparaStart",(getMarkerPos "m_bcparaspawn")];
		_mStart setMarkerText "Empty";
		_mStart setMarkerType "";
		_mStart setMarkerColor "colorBLUFOR";
		_mStart setMarkerDir ((getMarkerPos "m_bcparaspawn") getDir bc_para);

		_terminal setVariable ["SR_Test",false,true];
		"HALO Prepared." remoteExec ["Hint", _g];
	};
	// Show Marker HAHO
	case 2: {
		// Remove old Markers
		["BparaDZ","BparaStart","BDZ"] spawn FNC_Para_Cleanup;
		
		// Create DZ Marker
		_handle = [bc_para,"BDZ","DZ","mil_objective","colorBLUFOR",0] spawn fw_fnc_paraMarker;
		waitUntil {scriptDone _handle};
		sleep 1;

		// Create Eject Marker
		_mEject = createMarker ["BparaDZ",(getMarkerPos "mHAHO_approach")];
		_mEject setMarkerText "Approach";
		_mEject setMarkerType "hd_arrow";
		_mEject setMarkerColor "colorBLUFOR";
		_mEject setMarkerDir ((getMarkerPos "mHAHO_approach") getDir bc_para);
		
		// Create Start Marker
		_mStart = createMarker ["BparaStart",(getMarkerPos "m_bcparaspawn")];
		_mStart setMarkerText "Empty";
		_mStart setMarkerType "";
		_mStart setMarkerColor "colorBLUFOR";
		_mStart setMarkerDir ((getMarkerPos "m_bcparaspawn") getDir bc_para);

		_terminal setVariable ["SR_Test",false,true];
		"HAHO Prepared." remoteExec ["Hint", _g];
	};
	// Start Parachute
	case 3: {
		// Error when no DZ is available
		if (markerPos "BparaDZ" isEqualTo [0,0,0]) exitWith {
			"No Parachute Marker!" remoteExec ["Hint", _g];
		};

		// Start Plane
		[_terminal,_ldr,0,["BparaDZ","BparaStart",2500,"Windrunner 2-1",false]] spawn fw_fnc_paraDrop;
		sleep 5;
		_ldr setPos (markerPos "BDZ");
		sleep 2;
		_handle = [_con,"BDZ"] spawn FNC_Para_Result;
		waitUntil {scriptDone _handle};

		// Remove old Markers
		_terminal setVariable ["SR_Test",false,true];
		sleep 5;
		["BparaDZ","BparaStart","BDZ"] spawn FNC_Para_Cleanup;
	};
	// Rifle Range lane 1
	case 4: {
		
		[[brf1,brf2,brf3,brf4,brf5,brf6], _terminal, _ldr] spawn rifleTargets;
		
	};
	// LAT Range lane 1
	case 5: {
		
		[[lt1,lt2,lt3], _terminal, _ldr] spawn launcherTargets;
		
	};
	// Rifle Range lane 2
	case 6: {
		
		[[brf1_1,brf2_1,brf3_1,brf4_1,brf5_1,brf6_1], _terminal, _ldr] spawn rifleTargets;
		
	};
	// LAT Range lane 2
	case 7: {
		
		[[lt1_1,lt2_1,lt3_1], _terminal, _ldr] spawn launcherTargets;
		
	};	
	// Rifle Range lane 3
	case 8: {
		
		[[brf1_2,brf2_2,brf3_2,brf4_2,brf5_2,brf6_2], _terminal, _ldr] spawn rifleTargets;
		
	};
	// LAT Range lane 3
	case 9: {
		
		[[lt1_2,lt2_2,lt3_2], _terminal, _ldr] spawn launcherTargets;
		
	};	
	// Rifle Range lane 4
	case 10: {
		
		[[brf1_3,brf2_3,brf3_3,brf4_3,brf5_3,brf6_3], _terminal, _ldr] spawn rifleTargets;
		
	};
	// LAT Range lane 4
	case 11: {
		
		[[lt1_3,lt2_3,lt3_3], _terminal, _ldr] spawn launcherTargets;
		
	};
	// Rifle Range lane 5
	case 12: {
		
		[[brf1_4,brf2_4,brf3_4,brf4_4,brf5_4,brf6_4], _terminal, _ldr] spawn rifleTargets;
		
	};
	// LAT Range lane 5
	case 13: {
		
		[[lt1_4,lt2_4,lt3_4], _terminal, _ldr] spawn launcherTargets;
		
	};
	// Mout House
	case 14: {		
		{
			[_x,clientOwner] remoteExec ["setOwner",2];
			_x addEventHandler ["HandleDamage", {false}];
			_x addEventHandler ["hit", {
				params ["_t"];
				private "_c";
				_c = _t getVariable ["SR_Hit",0];
				if (_c == 2) then {
					_t animate ["terc", 1];
					private "_s";
					_t setVariable ["SR_Hit",0];
					_s = bc_mout_term getVariable ["SR_Hit",0];
					bc_mout_term setVariable ["SR_Hit",(_s + 1), true];
				} else {
					_t setVariable ["SR_Hit", (_c + 1)];
				};			
			}];
			_x animate ["terc", 0];
		} forEach _MT;

		//nearest building to the unit
		_building = mout_house;
		//get the number of doors from the buildings config
		_numDoors = getNumber (configFile >> "CFGVehicles" >> "Land_i_Barracks_V1_F" >> "numberOfDoors");
				
		for "_doorNum" from 1 to _numDoors do {
		_building animateSource [ format["door_%1_sound_source",_doorNum], 0];
		};
		
		"Get Ready" remoteExec ["hint", _g];
		sleep 3;
		bc_mout_term setVariable ["SR_Test",true,true];	
		"Live" remoteExec ["hint", _g];
		["FD_Course_Active_F"] remoteExec ["playSound",_g];
		
		waitUntil {bc_mout_term getVariable ["SR_Hit",0] == (count _MT) || !(bc_mout_term getVariable ["SR_Test",false])};
	//	[[_MT]] spawn fw_fnc_resetPopTargets;
		{
		_x animate ["terc", 0];
		_x removeAllEventHandlers "hit";
		_x removeAllEventHandlers "HandleDamage";
		_x addEventHandler ["HandleDamage", {false}];
		_x setVariable ["SR_Hit",0];
		} forEach _MT;
		
		bc_mout_term setVariable ["SR_Test",false,true];	
		"Cease Fire" remoteExec ["hint", _g];
		["FD_Course_Active_F"] remoteExec ["playSound",_g];
		sleep 1;
		["FD_Course_Active_F"] remoteExec ["playSound",_g];
	};	
};