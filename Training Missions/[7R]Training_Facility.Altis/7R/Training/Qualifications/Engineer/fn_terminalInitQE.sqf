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

_term = qe_term1;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Mines Defusal", "", {
	nul = [1,player,_target] spawn fw_fnc_engineerRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


_ex = ["sr_test", "Start Test: Light Repair", "", {
	nul = [2,player,_target] spawn fw_fnc_engineerRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Full Repair", "", {
	nul = [3,player,_target] spawn fw_fnc_engineerRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Transition", "", {
	nul = [4,player,_target] spawn fw_fnc_engineerRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Defence", "", {
	nul = [5,player,qe_term1] spawn fw_fnc_engineerRange;
}, {leader player == player && !(qe_term1 getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_term2, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

// Practice
_ex = ["sr_test", "Spawn: Repair Station Box", "", {
	nul = [2,qe_prac_spawn2] spawn fw_fnc_cargoSpawn;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_prac_term2, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Spawn: Fortification Box", "", {
	nul = [3,qe_prac_spawn2] spawn fw_fnc_cargoSpawn;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_prac_term2, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_terminals pushBack qe_prac_term1;

_ex = ["sr_test", "Practice: small Repair", "", {
	nul = [6,player,_target] spawn fw_fnc_engineerRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_prac_term1, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Practice: full Repair", "", {
	nul = [7,player,_target] spawn fw_fnc_engineerRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_prac_term1, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Practice: Mines Defusal", "", {
	nul = [8,player,_target] spawn fw_fnc_engineerRange;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[qe_prac_term3, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_terminals pushBack qe_prac_term3;

{
	_end = ["sr_test", "END Current Test", "", {
		_target setVariable ["SR_Test",false,true];
	}, {leader player == player && _target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;

_end = ["sr_test", "END Current Test", "", {
	qe_term1 setVariable ["SR_Test",false,true];
}, {leader player == player && qe_term1 getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[qe_term2, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
