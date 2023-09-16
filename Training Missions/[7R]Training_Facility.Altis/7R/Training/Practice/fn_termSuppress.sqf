/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start bootcamp's practices.

*/
//***********************************************************************************************************
/*
	Parachuting
*/
//***********************************************************************************************************

_term = suppression_term; 
_ex = ["SR_Test", "Start Suppression practice", "", {
	nul = [player,_target] spawn fw_fnc_practiceSuppression;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_end = ["sr_test", "END Current Test", "", {
	suppression_term setVariable ["SR_Test",false,true];
}, {suppression_term getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[suppression_term, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;