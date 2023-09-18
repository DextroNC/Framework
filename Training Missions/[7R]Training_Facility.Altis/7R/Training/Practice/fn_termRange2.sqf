/*
	Adds the Ace Actions to the Terminals at Range 2 and BootCamp

*/

// Range 2 Terminal Inits - CQB
_term = [r2_p1_t,r2_p2_t,r2_p3_t];
_wall = [r2_p1,r2_p2,r2_p3];

// Test Loop
{
	// Add Test
	_test1 = ["sr_test", "Start Test 1 (16 nT, 3h)", "", {
		nul = [_target,(_this select 2 select 0),_player,16,3,0,"Steel_Plate_F"] spawn fw_fnc_R2_reactionCourse;
	}, {!(_target getVariable ["SR_Active", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _test1] spawn ace_interact_menu_fnc_addActionToObject;

	_test2 = ["sr_test", "Start Test 2 (12nt, 2h, 3s)", "", {
		nul = [_target,(_this select 2 select 0),_player,12,2,3,"Steel_Plate_F"] spawn fw_fnc_R2_reactionCourse;
	}, {!(_target getVariable ["SR_Active", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _test2] spawn ace_interact_menu_fnc_addActionToObject;

	_test3 = ["sr_test", "Start Test 3 (6bt, 5h)", "", {
		nul = [_target,(_this select 2 select 0),_player,6,5,0,"Steel_Plate_L_F"] spawn fw_fnc_R2_reactionCourse;
	}, {!(_target getVariable ["SR_Active", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _test3] spawn ace_interact_menu_fnc_addActionToObject;

	_test4 = ["sr_test", "Start Test 4 (12 st, 2h, 3s)", "", {
		nul = [_target,(_this select 2 select 0),_player,12,2,3,"Steel_Plate_S_F"] spawn fw_fnc_R2_reactionCourse;
	}, {!(_target getVariable ["SR_Active", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _test4] spawn ace_interact_menu_fnc_addActionToObject;
	
	_test5 = ["sr_test", "Start Test 5", "", {
		nul = [_target,(_this select 2 select 0),_player,12,2,0,"Steel_Plate_F",true] spawn fw_fnc_R2_reactionCourse;
	}, {!(_target getVariable ["SR_Active", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _test5] spawn ace_interact_menu_fnc_addActionToObject;

	// Reset Test
	_reset = ["sr_test", "End-Reset Test", "", {
		_target setVariable ["SR_Active",false,true];
	}, {(_target getVariable ["SR_Active", false])}, {}, []] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _reset] spawn ace_interact_menu_fnc_addActionToObject;
	
	// call Cover
	_cover = ["sr_test", "call Cover", "", {
		nul = [_target,(_this select 2 select 0),false] spawn fw_fnc_rcCover;
	}, {!(_target getVariable ["SR_Cover", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _cover] spawn ace_interact_menu_fnc_addActionToObject;
	
	// Remove Cover
	_coverR = ["sr_test", "Remove Cover", "", {
		nul = [_target,(_this select 2 select 0),true] spawn fw_fnc_rcCover;
	}, {(_target getVariable ["SR_Cover", false])}, {}, [(_wall select _forEachIndex)]] call ace_interact_menu_fnc_createAction;
	[_x, 0, ["ACE_MainActions"], _coverR] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _term;

// Reset Test
_reset = ["sr_test", "End-Reset Test", "", {
	_target setVariable ["SR_Active",false,true];
}, {(_target getVariable ["SR_Active", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[r3_t1, 0, ["ACE_MainActions"], _reset] spawn ace_interact_menu_fnc_addActionToObject;

// call Cover
_cover = ["sr_test", "call Spotting Target", "", {
	nul = [_target] spawn fw_fnc_spotPractice;
}, {!(_target getVariable ["SR_Active", false])}, {}, []] call ace_interact_menu_fnc_createAction;
[r3_t1, 0, ["ACE_MainActions"], _cover] spawn ace_interact_menu_fnc_addActionToObject;
