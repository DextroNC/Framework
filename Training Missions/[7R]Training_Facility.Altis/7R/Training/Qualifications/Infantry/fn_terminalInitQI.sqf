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

_term = qi_range_term;
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Rifle", "", {
	nul = [1,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Grenade Throwing", "", {
	nul = [2,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: 40mm", "", {
	nul = [3,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Autorifle (AR)", "", {
	nul = [4,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Light-AT", "", {
	nul = [5,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: First-Aid-Scenario", "", {
	nul = [6,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


//***********************************************************************************************************
/*
	Parachuting
*/
//***********************************************************************************************************

_term = qi_para_term; 
_terminals pushBack _term;
_ex = ["sr_test", "Create HALO DZ", "", {
	nul = [7, player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Create HAHO DZ", "", {
	nul = [8, player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Parachuting", "", {
	nul = [9, player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false])}, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


//***********************************************************************************************************
/*
	Spotting
*/
//***********************************************************************************************************

_term = qi_spot_term; 
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Spotting", "", {
	nul = [10,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Start Test: Navigation", "", {
	nul = [12,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test_header", "Select Position", "", {
	_target setVariable ["SR_Random",0];
	hint "Selected Position 0";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 1", "", {
	_target setVariable ["SR_Random",1];
	hint "Selected Position 1";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 2", "", {
	_target setVariable ["SR_Random",2];
	hint "Selected Position 2";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 3", "", {
	_target setVariable ["SR_Random",3];
	hint "Selected Position 3";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 4", "", {
	_target setVariable ["SR_Random",4];
	hint "Selected Position 4";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 5", "", {
	_target setVariable ["SR_Random",5];
	hint "Selected Position 5";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 6", "", {
	_target setVariable ["SR_Random",6];
	hint "Selected Position 6";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 7", "", {
	_target setVariable ["SR_Random",7];
	hint "Selected Position 7";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 8", "", {
	_target setVariable ["SR_Random",8];
	hint "Selected Position 8";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 9", "", {
	_target setVariable ["SR_Random",9];
	hint "Selected Position 9";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 10", "", {
	_target setVariable ["SR_Random",10];
	hint "Selected Position 10";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 11", "", {
	_target setVariable ["SR_Random",11];
	hint "Selected Position 11";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 12", "", {
	_target setVariable ["SR_Random",12];
	hint "Selected Position 12";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 13", "", {
	_target setVariable ["SR_Random",13];
	hint "Selected Position 13";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

_ex = ["sr_test", "Select Position 14", "", {
	_target setVariable ["SR_Random",14];
	hint "Selected Position 14";
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions","sr_test_header"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

//***********************************************************************************************************
/*
	Bounding
*/
//***********************************************************************************************************

_term = qi_bounding_term; 
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Bounding", "", {
	nul = [13,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;


//***********************************************************************************************************
/*
	Shoot-House (MOUT)
*/
//***********************************************************************************************************

_term = qi_sh1_term; 
_terminals pushBack _term;

_ex = ["sr_test", "Start Test: Shoot-House", "", {
	nul = [11,player,_target] spawn fw_fnc_shootingRange;
}, {leader player == player && !(_target getVariable ["SR_Test",false]) }, {}, []] call ace_interact_menu_fnc_createAction;
[_term, 0, ["ACE_MainActions"], _ex] spawn ace_interact_menu_fnc_addActionToObject;

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

_end = ["sr_test", "END Current Test", "", {
	qi_sh1_term setVariable ["SR_Test",false,true];
}, {leader player == player && qi_sh1_term getVariable ["SR_Test",false]}, {}, []] call ace_interact_menu_fnc_createAction;
[qi_sh2_term, 0, ["ACE_MainActions"], _end] spawn ace_interact_menu_fnc_addActionToObject;
