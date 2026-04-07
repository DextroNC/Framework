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
_action = ["7R_EZA","Lift off","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",{
	_target setVariable ['fw_transport_takeoff_ready', true, true];
},{!(_target getVariable ['fw_transport_takeoff_ready',false])},{},[],"",5,[false, true, false, false, false]] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Add Selfaction to Helicopter
_selfAction = ["7R_EZSA","Lift off","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",
{
    // _this = [_target, _player, _params]
    private _veh = (_this select 2) select 0;
    _veh setVariable ['fw_transport_takeoff_ready', true, true];
},
{
    private _veh = (_this select 2) select 0;
    !(_veh getVariable ['fw_transport_takeoff_ready', false])
},
{}, [_vehicle], "", 5,  // <-- Pass _vehicle as custom param
[false, true, false, false, false]
] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _selfAction] call ace_interact_menu_fnc_addActionToObject;