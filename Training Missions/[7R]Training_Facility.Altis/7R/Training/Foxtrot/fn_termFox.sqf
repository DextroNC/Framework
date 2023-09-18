/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start bootcamp's practices.
		
	ace_interact_menu_fnc_createAction	
	* Argument:
	* 0: Action name <STRING>
	* 1: Name of the action shown in the menu <STRING>
	* 2: Icon <STRING>
	* 3: Statement <CODE>
	* 4: Condition <CODE>
	----------
	* 5: Insert children code <CODE> (Optional)
	* 6: Action parameters <ANY> (Optional)
	* 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
	* 8: Distance <NUMBER> (Optional)
	* 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
	* 10: Modifier function <CODE> (Optional)
		
		
		
	ace_interact_menu_fnc_addActionToObject
	* Argument:
	* 0: Object the action should be assigned to <OBJECT>
	* 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
	* 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
	* 3: Action <ARRAY>
	
*/
//***********************************************************************************************************
/*
	Broken Tank Repair
*/
//***********************************************************************************************************
_term = fx_repair_term; 

_ex = ["sr_repair", "Spawn Damaged Tank", "", {
	nul = [1, player, _target] spawn fw_fnc_brokenTankSpawn;
}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_repair", "Remove Tank", "", {
	nul = [2, player, _target] spawn fw_fnc_brokenTankSpawn;
}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

// Qualification Course

_term = fx_comm_term;

_ex = ["sr_test", "Start Course", "", {
	nul = [1, player, fx_comm_term] spawn fw_fnc_commander;
}, {leader player == player && !(fx_comm_term getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_end = ["sr_test", "END Current Test", "", {
	fx_comm_term setVariable ["SR_Test",false,true];
}, {leader player == player && fx_comm_term getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[fx_comm_term, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;