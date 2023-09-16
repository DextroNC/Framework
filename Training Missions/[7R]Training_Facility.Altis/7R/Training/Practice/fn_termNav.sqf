/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start tests.

*/
//***********************************************************************************************************
/*
	Navigation training
*/
//***********************************************************************************************************
_term = tnav_term; 
_ex = ["sr_test", "Start Navigation Training", "", {
	nul = [player,_target] spawn fw_fnc_navigation;
}, {!(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;