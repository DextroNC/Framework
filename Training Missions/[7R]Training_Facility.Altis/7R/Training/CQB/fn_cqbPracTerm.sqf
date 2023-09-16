/*
	Adds the Ace Actions to the Terminals at Range 2 

*/

// Parameter Init;
_terminals = [];

_term = r2_p6_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,6] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p7_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,7] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p8_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,8] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p9_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,9] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p10_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,10] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p11_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,11] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

_term = r2_p12_t;
_terminals pushBack _term;

_ex = ["sr_test", "Start Course", "", {
nul = [_target,_player,12] spawn fw_fnc_CQBcourse;
}, {!(_target getVariable ["SR_Test", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;	

{
_end = ["sr_test", "End-Reset Course", "", {
		_target setVariable ["SR_Test",false,true];
	}, {_target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;