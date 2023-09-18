/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start tests.

*/
// Parameter Init;
_terminals = [];

//***********************************************************************************************************
/*
	Shooting Range Terminal
*/
//***********************************************************************************************************

_term = qh_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: MMG 1 - Static", "", {
	nul = [1,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MMG 2 - Moving", "", {
	nul = [2,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: NLAW", "", {
	nul = [3,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - Static", "", {
	nul = [4,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - Airburst", "", {
	nul = [4,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - Heavy Target", "", {
	nul = [5,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - Moving Target", "", {
	nul = [6,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: HAT", "", {
	nul = [10,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - RPG", "", {
	nul = [13,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
//**************************************************************************************************************************************

// Practice Moving Targets

//****************************************************************************************************************************************

_term = hw_prac_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: MMG - Moving Target", "", {
	nul = [7,player,_target] spawn fw_fnc_heavyRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: MAT - Moving Target", "", {
	nul = [9,player,_target] spawn fw_fnc_heavyRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//**************************************************************************************************************************************

// Practice  Static Targets

//****************************************************************************************************************************************

_term = hw_prac_term_1;
_terminals pushBack _term;
_ex = ["sr_test", "Start Test: MAT - Heavy Target", "", {
	nul = [8,player,_target] spawn fw_fnc_heavyRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Start Test: MAT - Airburst", "", {
	nul = [12,player,_target] spawn fw_fnc_heavyRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Start Test: MMG - Static Target", "", {
	nul = [11,player,_target] spawn fw_fnc_heavyRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//**************************************************************************************************************************************

// End

//****************************************************************************************************************************************

{
	_end = ["sr_test", "END Current Test", "", {
		_target setVariable ["SR_Test",false,true];
	}, {_target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;
