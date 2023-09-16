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

_term = practice_para_term; 

_ex = ["SR_Test", "Create HALO DZ", "", {
	nul = [1, player,_target] spawn fw_fnc_practicePara;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["SR_Test", "Create HAHO DZ", "", {
	nul = [2, player,_target] spawn fw_fnc_practicePara;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["SR_Test", "Start SquadDrop", "", {
	nul = [3, player,_target] spawn fw_fnc_practicePara;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;