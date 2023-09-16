	/*
	Parameters:
		<-- Course Number as Integer
		<-- Group Leader as Object
		<-- Terminal as Object
		<--(Optinal) Contestent as Object

		Description:
			Manages the Courses of the Armour Course.
	

*/

// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;

_poptgt = [arm_1,arm_2, arm_3, arm_4, arm_5, arm_6, arm_7, arm_8, arm_9, arm_10, arm_11, arm_12, arm_13, arm_14, arm_15, arm_16, arm_17, arm_18, arm_19, arm_20, arm_21, arm_22, arm_23, arm_24, arm_25, arm_26, arm_27, arm_28, arm_29, arm_30, arm_31, arm_32, arm_33, arm_34, arm_35, arm_36, arm_37, arm_38, arm_39, arm_40, arm_41, arm_42, arm_43, arm_44, arm_45, arm_46, arm_47, arm_48, arm_49, arm_50, arm_51, arm_52, arm_53, arm_54, arm_55, arm_56, arm_57, arm_58, arm_59, arm_60];
_vicspwn = ["arm_t1","arm_t2","arm_t3","arm_t4"];
_posmines  = ["arm_mines_1","arm_mines_2","arm_mines_3","arm_mines_4"];

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

switch (_nbr) do {
	// Town Range
    case 1: {
	

	_tanks =[];
	
	{
		// Create Vehicle
		_vehicle = (selectRandom ["rhs_t80","rhs_btr60_vdv","rhs_t72be_tv"]) createVehicle [0,0,0];
		_vehicle setDir ((markerDir _x) + (round random 90));
		_vehicle setPos (markerPos _x);
		_vehicle engineOn true;
		_tanks pushBack _vehicle;

	} forEach _vicspwn;

	// Parameter Init
	_class = selectRandom["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanSmall_Range","IEDLandBig_F","IEDUrbanBig_F","IEDLandSmall_F","IEDUrbanSmall_F","ATMine","ACE_SLAMBottomMine"];
	_mines = [];

	// Create Mines
	for "_i" from 1 to 2 do {
		_activemine = selectRandom _posmines;
		private _pos = [_activemine, true] call CBA_fnc_randPosArea;
		private _veh = createMine [_class,_pos, [], 0];
		_mines pushBack _veh;
	};

	// Pop Targets
	{
		[_x,clientOwner] remoteExec ["setOwner",2];
		_x addEventHandler ["HandleDamage", {false}];
		[_x,5,_terminal] spawn fw_fnc_eventHit;
		_x animate ["terc", 0];

	} forEach _poptgt;
	
	
	_terminal setVariable ["SR_Test",true,true];	
	"Get Ready" remoteExec ["hint", _g];
	sleep 3;
	"Live" remoteExec ["hint", _g];
	["FD_Course_Active_F"] remoteExec ["playSound",_g];	
	
	// Init Timer and Loop Variable
	private _start = CBA_MissionTime;

	// WaitUntil End
	waitUntil {!(_terminal getVariable ["SR_Test",false])};
	
	// Result Message
	private _time = (CBA_missionTime - _start);
	private _result = "";
	private _str = format ["Time Passed (in sec): %1",_time];
	_str remoteExec ["hint", _g]; 
	
	// Delete Tanks
	{
		deleteVehicle _x;
	} forEach _tanks;

	// Delete Mines
	{
		deleteVehicle _x;
	} forEach _mines;


	[[_poptgt]] spawn fw_fnc_resetPopTargets;
	_terminal setVariable ["SR_Hit",0,true];
};
};