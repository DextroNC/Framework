/*
	Parameters:
		<-- Box as Object

	Description:
		Adds Actions to Vehicle Supply Box

*/

// Parameter Init
params["_b"];

// adding Action to Assemble Post
_action = ["sr_fort", "Build Mobile Vehicle Supply Station", "", {nul = [_this select 0] spawn fw_fnc_supplyDropVehicleAction;}, {(_this select 0) getVariable ["ACE_isRepairFacility", 0] == 0}, {},[_b]] call ace_interact_menu_fnc_createAction;
[_b, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

// adding Action spare Wheel
_action2 = ["sr_fort", "Get Spare Wheel", "", {nul = [_this select 0,"ACE_Wheel"] spawn fw_fnc_supplyDropSparePart;}, {(_this select 0) getVariable ["ACE_isRepairFacility", 0] == 1}, {},[_b]] call ace_interact_menu_fnc_createAction;
[_b, 0, ["ACE_MainActions"], _action2] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

// adding Action spare Track
_action2 = ["sr_fort", "Get Spare Track", "", {nul = [_this select 0,"ACE_Track"] spawn fw_fnc_supplyDropSparePart;}, {(_this select 0) getVariable ["ACE_isRepairFacility", 0] == 1}, {},[_b]] call ace_interact_menu_fnc_createAction;
[_b, 0, ["ACE_MainActions"], _action2] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

// Make unloadable
[_b, -1] call ace_cargo_fnc_setSize;

