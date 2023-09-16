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
	Medical Terminal
*/
//***********************************************************************************************************

_term = qm_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Practical Part", "", {
	nul = [1,player,_target] spawn fw_fnc_medicalQualification;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//***********************************************************************************************************
/*
	Medical Practice
*/
//***********************************************************************************************************

_term = qm_prac_term;

_ex = ["sr_test", "call 1 Wounded", "", {
	nul = [2,player,_target] spawn fw_fnc_medicalQualification;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "call 3 Wounded", "", {
	nul = [3,player,_target] spawn fw_fnc_medicalQualification;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_end = ["sr_test", "END Current Test", "", {
	_target setVariable ["SR_Test",false,true];
}, {_target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;



//***********************************************************************************************************
/*
	END TEST
*/
//***********************************************************************************************************

{
	_end = ["sr_test", "END Current Test", "", {
		_target setVariable ["SR_Test",false,true];
	}, {leader player == player && _target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;