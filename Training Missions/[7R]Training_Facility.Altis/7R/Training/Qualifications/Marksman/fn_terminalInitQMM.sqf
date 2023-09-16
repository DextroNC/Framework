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

_term = qmm_range_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: DMR (Silhouette)", "", {
	nul = [1,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Sniper (Silhouette)", "", {
	nul = [3,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Anti-Material (Static)", "", {
	nul = [4,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Anti-Material (Technical moving)", "", {
	nul = [5,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: CAS (static)", "", {
	nul = [7,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Final Test", "", {
	nul = [8,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//**************************************************************************************************************************************

// Practice Moving Targets

//****************************************************************************************************************************************

_term = mm_prac_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Anti-Material (Technical moving)", "", {
	nul = [9,player,_target] spawn fw_fnc_marksmanRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Anti-Material (BTR moving)", "", {
	nul = [10,player,_target] spawn fw_fnc_marksmanRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Sniper Range (Wind active)", "", {
	nul = [11,player,_target] spawn fw_fnc_marksmanRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

// Practice  Static Targets
_ex = ["sr_test", "Start Test: Anti-Material/CAS (Static)", "", {
	nul = [12,player,_target] spawn fw_fnc_marksmanRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

{
	_end = ["sr_test", "END Current Test", "", {
		_target setVariable ["SR_Test",false,true];
	}, {_target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;

_end = ["sr_test", "END Current Test", "", {
	qmm_range_term setVariable ["SR_Test",false,true];
}, {qmm_range_term getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[qmm_range_term2, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;