/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start tests.

*/

// Server Only Execute
//if (!isServer) exitWith {};

// Parameter Init;
_terminals = [];

//***********************************************************************************************************
/*
	Starting Terminals
*/
//***********************************************************************************************************

_term = q_term;
_ex = ["sr_test", "Start Infantry Qualification Course", "", {
	nul = [0,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Medical Qualification Course", "", {
	nul = [0,player,_target] spawn fw_fnc_medicalQualification;
}, {leader player == player}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Heavy Weapons Qualification Course", "", {
	nul = [0,player,_target] spawn fw_fnc_heavyRange;
}, {leader player == player}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Marksman Qualification Course", "", {
	nul = [0,player,_target] spawn fw_fnc_marksmanRange;
}, {leader player == player}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Engineer Qualification Course", "", {
	nul = [0,player,_target] spawn fw_fnc_engineerRange;
}, {leader player == player}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
