/*
	Parameters:
		<-- TriggerObjects as Array
		<-- Unit as Object

	Description:
	Creates the Laptop and calls the hacking process. Creates continue and pickup action to laptop.
	
	Example:
		[SR_Hack_Area,player] spawn fw_fnc_hackingAction;

*/

// Parameter init
params ["_array","_unit"];
_trg = objNull;
{
	if (_unit inArea _x) exitWith {_trg = _x};
}forEach _array;

// Play Animation
[player, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;

// Progress Bar
[6, _trg, {
	// Parameter Init
	private _trg = _this select 0;
	private _pos = player modelToWorld [0,1,0];
	private _unit = player;
	private "_comp";
	
	// Create Laptop
	_comp = "Land_Laptop_unfolded_F" createVehicle [0,0.5,0];
	_comp setPos _pos;
	_comp setDir ((getDir player) - 180);
	_unit removeItem "Land_Laptop_03_olive_F";
	
	// Set Variables
	_trg setVariable ["SR_Hack",0,true];
	_trg setVariable ["SR_Hack_Device",_comp,true];
	_comp setVariable ["SR_Hack_Interrupt",false,true];
	
	// Start Loop
	[_trg,_comp] remoteExec ["fw_fnc_hackingLoop", 2];
	
	// Add Pick up Action to Laptop
	_action = ["sr_hack_pickup", "Pick up Laptop", "", {nul=[_this select 0, _this select 1] spawn fw_fnc_hackingPickup}, {true}] call ace_interact_menu_fnc_createAction;
	[_comp, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
	
	// Add Continue Action to Laptop
	_action2 = ["sr_hack_continue", "Continue Hack", "", {
		// Parameter Init
		params ["_laptop","_unit"];
		// Progress Bar and Animation
		_unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
		[3, _laptop, {(_this select 0) setVariable ["SR_Hack_Interrupt",false,true];},{hint "Action Canceled"}, "Continue Hack"] call ace_common_fnc_progressBar;
	}, {(_this select 0) getVariable ["SR_Hack_Interrupt",false]}] call ace_interact_menu_fnc_createAction;
	[_comp, 0, ["ACE_MainActions"], _action2] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
	
},{hint "Action Canceled"}, "Placing Laptop..."] call ace_common_fnc_progressBar;