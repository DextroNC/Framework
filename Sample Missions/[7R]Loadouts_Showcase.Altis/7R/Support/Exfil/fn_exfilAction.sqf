/*
	Parameters:
		<-- Helicopter as Object
		<-- Mode - default: Need to be inside; 1: need to be within 15m
	
		Description:
		Adds liftoff action to helicopter
		
		Example:
		none
*/

// Parameter Init
params ["_vehicle",["_mode",0]];

// Add Action to Helicopter
_action = ["7R_EZA","Liftoft","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",{
	[2, (_this select 0), {(_this select 0) setVariable ['liftoff',true,true];},{["","Action Canceled"] spawn sr_support_fnc_infoMessage;}, "Call for liftoff"] call ace_common_fnc_progressBar;
},{!((_this select 0) getVariable ['liftoff',false])},{},[],"",5,[false, true, false, false, false]] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Add Selfaction to Helicopter
_selfAction = ["7R_EZA","Liftoft","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",{
	(_this select 0) setVariable ['liftoff',true,true];
},{!((_this select 0) getVariable ['liftoff',false])},{},[],"",5,[false, true, false, false, false]] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _selfAction] call ace_interact_menu_fnc_addActionToObject;