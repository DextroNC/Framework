/*
	Parameters:
		<-- Terminal as Object
		<-- Unit as Object
		<-- Course as Integer
		<-- Timer as Integer
	
*/
// Parameter init
params ["_terminal","_unit","_course"];

_cqb_t1 = [qcb_t6_1, qcb_t6_2, qcb_t6_3, qcb_t6_4, qcb_t6_5, qcb_t6_6, qcb_t6_7, qcb_t6_8, qcb_t6_9, qcb_t6_10, qcb_t6_11];
_cqb_t2 = [qcb_t7_1, qcb_t7_11, qcb_t7_2, qcb_t7_3, qcb_t7_4, qcb_t7_5, qcb_t7_6, qcb_t7_7, qcb_t7_8, qcb_t7_9, qcb_t7_10];
_cqb_t3 = [qcb_t8_1, qcb_t8_2, qcb_t8_3, qcb_t8_4, qcb_t8_5, qcb_t8_6, qcb_t8_7, qcb_t8_8, qcb_t8_9];
_cqb_t4 = [qcb_t9_1, qcb_t9_2, qcb_t9_3, qcb_t9_4, qcb_t9_5, qcb_t9_6, qcb_t9_7, qcb_t9_8, qcb_t9_9];
_cqb_t5 = [qcb_t10_1, qcb_t10_2, qcb_t10_3, qcb_t10_4, qcb_t10_5, qcb_t10_6, qcb_t10_7, qcb_t10_8, qcb_t10_9];
_cqb_t6 = [qcb_t11_1, qcb_t11_2, qcb_t11_3, qcb_t11_4, qcb_t11_5, qcb_t11_6, qcb_t11_7, qcb_t11_8, qcb_t11_9, qcb_t11_10, qcb_t11_11, qcb_t11_12, qcb_t11_13, qcb_t11_14, qcb_t11_15, qcb_t11_16, qcb_t11_17, qcb_t11_18, qcb_t11_19, qcb_t11_20];
_cqb_t7 = [qcb_t12_1, qcb_t12_2, qcb_t12_3, qcb_t12_4, qcb_t12_5, qcb_t12_6, qcb_t12_7];

// Set Course Active
_terminal setVariable ["SR_Test",true,true];

_con = [];

{
	if (_x distance2D _terminal < 14) then {
		_con pushBack _x;
	};
} forEach (allPlayers - entities "HeadlessClient_F");


/*	CQB Setup	*/
cqb_setup ={
	params ["_cqb_targets","_terminal","_unit","_type","_doors","_timer"];
	// Target Array
	_targets = _cqb_targets call BIS_fnc_arrayShuffle;
	_logic = _doors select 0;
	_vips =[];
	// Prepare Targets
	{
		[_x,clientOwner] remoteExec ["setOwner",2];
		[_x,5,_terminal] spawn fw_fnc_eventHit;
	}forEach _targets;
	
	{
		// Relative Position
		_tar = _targets select _forEachIndex;
 		// Check if Hostage or Hostile and spawn Target
		if (_x) then {
			_pos = [getPosATL _tar select 0, getPosATL _tar select 1, 0];
			
			_grenade_chance = [true, false];
			// Create VIP
			_group = createGroup civilian;
			_vip = _group createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
			_vips pushBack _vip;
			_vip disableAi "ALL";
			if ( selectRandom _grenade_chance ) then {
				_vip addItem "HandGrenade"; 
			};
			_vip setDir (random 360);
			_vip setPosATL _pos;
			[_vip, true] call ACE_captives_fnc_setSurrendered;
		} else {
			_tar setPosATL [getPosATL _tar select 0, getPosATL _tar select 1, 0];
			_tar animate ["terc", 0];
		};
	}forEach _type;

	// Close all Doors
	{
		_x animateSource ["Door_1_sound_source",0];
	}forEach _doors;
	sleep 1;

	// Start Horn
	[_logic,_unit] spawn fw_fnc_courseStart;
	// Wait for Door to open to start timer
	waitUntil {(_doors select 0) animationSourcePhase "Door_1_sound_source" == 1 || !(_terminal getVariable ["SR_Test",false])};
	_start = CBA_MissionTime;
	
	// WaitUntil End
	waitUntil {(CBA_MissionTime - _start) > _timer ||!(_terminal getVariable ["SR_Test",false])};

	// Result Message
	private _time = (CBA_missionTime - _start);
	private _kills = _terminal getVariable ["SR_Hit",0];
	private _result = "";
	private _str = format ["Time Passed (in sec): %1\nTargets Killed: %2",_time,_kills];
	_str remoteExec ["hint", _unit]; 
	_terminal setVariable ["SR_Hit",0,true];

	// End Horn
	[_logic,_unit] spawn fw_fnc_courseEnd;

	// Reset Course
	[[_targets]] spawn fw_fnc_resetPopTargets;
	{
	deleteVehicle _x;
	}forEach _vips;
	{
	_x setPosATL [getPosATL _x select 0, getPosATL _x select 1, -10];
	}forEach _targets;
		// Close all Doors
	{
		_x animateSource ["Door_1_sound_source",0];
	}forEach _doors;
	_terminal setVariable ["SR_Test",false,true];
};

switch (_course) do {

	case 6: {
	
		_type = [false,false,false,false,false,true,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p6_d];
		[_cqb_t1,_terminal,_con,_type,_doors,45] spawn cqb_setup;
	};
	case 7: {
		_type = [false,false,false,false,true,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p7_d];
		[_cqb_t2,_terminal,_con,_type,_doors,45] spawn cqb_setup;
	};

	case 8: {
		_type = [false,false,false,false,false,false,true,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p8_d];
		[_cqb_t3,_terminal,_con,_type,_doors,45] spawn cqb_setup;
	};

	case 9: {
		_type = [false,false,false,false,false,true,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p9_d,r2_p9_d_1];
		[_cqb_t4,_terminal,_con,_type,_doors,45] spawn cqb_setup;
	};

	case 10: {
		_type = [false,false,false,false,true,true,false,false,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p10_d,r2_p10_d_1,r2_p10_d_2];
		[_cqb_t5,_terminal,_con,_type,_doors,60] spawn cqb_setup;
	};

	case 11: {
		_type = [false,false,false,false,false,true,true,false,false,false,false,false,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p11_d,r2_p11_d_1,r2_p11_d_2,r2_p11_d_3,r2_p11_d_4,r2_p11_d_5];
		[_cqb_t6,_terminal,_con,_type,_doors,60] spawn cqb_setup;	
	};

	case 12: {
		_type = [false,false,false,false,false,false,true] call BIS_fnc_arrayShuffle;
		_doors = [r2_p12_d];
		{
			[_x,clientOwner] remoteExec ["setOwner",2];
		}forEach [qcb_t12_8, qcb_t12_9, qcb_t12_10, qcb_t12_11, qcb_t12_12, qcb_t12_13, qcb_t12_14];		
		[_cqb_t7,_terminal,_con,_type,_doors,120] spawn cqb_setup;
	};
};