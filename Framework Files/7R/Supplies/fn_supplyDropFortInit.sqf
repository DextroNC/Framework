/*
	Parameters:
		<-- Box as Object

*/

// Parameter Init
params["_b"];

// adding Action
_action = ["sr_fort", "Take Fortification Supplies", "", {nul = [_this select 0] spawn fw_fnc_supplyDropFortAction;}, {true}, {},[_b]] call ace_interact_menu_fnc_createAction;
[_b, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];



