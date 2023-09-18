/*
	Parameters:
		<-- None

	Description:
		Adds Actions to Terminals to start bootcamp's practices.

*/

// Parameter Init;
_terminals = [];

//***********************************************************************************************************
/*
	Parachuting
*/
//***********************************************************************************************************

_term = bc_para_term; 
//_terminals pushBack _term;
_ex = ["sr_test", "Create HALO DZ", "", {
	nul = [1, player,_target] spawn fw_fnc_bootcamp;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Create HAHO DZ", "", {
	nul = [2, player,_target] spawn fw_fnc_bootcamp;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Parachuting", "", {
	nul = [3, player,_target] spawn fw_fnc_bootcamp;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_term = medic_demo_term;
_terminals pushBack _term;
/*
 * MEDICAL STATION
 * */
_subMenuMedical = ["sub_menu_medical", "Wounded", "", {}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _subMenuMedical] spawn ace_interact_menu_fnc_addActionToObject;

// 1 wounded
_medicOneW = ["sr_test", "1 Wounded", "", {
	[1,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions", "sub_menu_medical"], _medicOneW] spawn ace_interact_menu_fnc_addActionToObject;

// 3 wounded
_medicThreeW = ["sr_test", "3 Wounded", "", {
	[2,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions", "sub_menu_medical"], _medicThreeW] spawn ace_interact_menu_fnc_addActionToObject;

// 5 wounded
_medicFiveW = ["sr_test", "5 Wounded", "", {
	[3,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions", "sub_menu_medical"], _medicFiveW] spawn ace_interact_menu_fnc_addActionToObject;

/*
 * Prisoner Menu
 */
_subMenuPrisoner = ["sub_menu_prisoner", "Prisoner", "", {}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _subMenuPrisoner] spawn ace_interact_menu_fnc_addActionToObject;

// spawn 1 Prisoner
_prisonOne = ["sr_test", "1 Prisoner", "", {
	[4,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sub_menu_prisoner"], _prisonOne] spawn ace_interact_menu_fnc_addActionToObject;

// spawn 3 Prisoner
_prisonThree = ["sr_test", "3 Prisoner", "", {
	[5,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sub_menu_prisoner"], _prisonThree] spawn ace_interact_menu_fnc_addActionToObject;

// spawn 5 Prisoner
_prisonFive = ["sr_test", "5 Prisoner", "", {
	[6,player,_target] spawn fw_fnc_spawnWoundedBC;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sub_menu_prisoner"], _prisonFive] spawn ace_interact_menu_fnc_addActionToObject;


/************************************************************************************************************
 * Shooting Practice Lane 1
 */
_term = bc_shooting_term;
_terminals pushBack _term;

_ex = ["sr_test", "Rifle Targets", "", {
	nul = [4, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Launcher Targets", "", {
	nul = [5, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

/*
 * Shooting Practice Lane 2
 */
_term = bc_shooting_term_1;
_terminals pushBack _term;

_ex = ["sr_test", "Rifle Targets", "", {
	nul = [6, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Launcher Targets", "", {
	nul = [7, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

/*
 * Shooting Practice Lane 3
 */
_term = bc_shooting_term_2;
_terminals pushBack _term;

_ex = ["sr_test", "Rifle Targets", "", {
	nul = [8, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Launcher Targets", "", {
	nul = [9, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


/*
 * Shooting Practice Lane 4
 */
_term = bc_shooting_term_3;
_terminals pushBack _term;

_ex = ["sr_test", "Rifle Targets", "", {
	nul = [10, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Launcher Targets", "", {
	nul = [11, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

/*
 * Shooting Practice Lane 5
 */
_term = bc_shooting_term_4;
_terminals pushBack _term;

_ex = ["sr_test", "Rifle Targets", "", {
	nul = [12, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;
_ex = ["sr_test", "Launcher Targets", "", {
	nul = [13, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


//***********************************************************************************************************

_term = bc_mout_term;
_terminals pushBack _term;
_ex = ["sr_test", "Start Shoot House", "", {
	nul = [14, player,_target] spawn fw_fnc_bootcamp;
}, {!(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//***********************************************************************************************************
/*
	END TEST
*/
//**********************************************************************************************************
// End: Shooting Range

{
_end = ["sr_test", "END Current Test", "", {
		_target setVariable ["SR_Test",false,true];
	}, {_target getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _terminals;