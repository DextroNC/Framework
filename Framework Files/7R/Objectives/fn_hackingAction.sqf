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
param
	_unit removeItem "ARP_Objects_Laptop_M";
	
	// Set Variables
	_trg setVariable ["SR_Hack",0,true];
	_trg setVariable ["SR_Hack_Device",_comp,true];
	_comp setVariable ["SR_Hack_Interrupt",false,true];
	
	// Start Loop
	[_trg,_comp] remoteExec ["fw_fnc_hackingLoop", 2];
	
	// Add Pick up Action to Laptop
	_action = ["sr_hack_pickup", "Pick up Laptop", "", {nul=[_this select 0, _this select 1] spawn fw_fnc_hackingPickup}, {true}] call ace_interact_menu_fnc_createAction;
	[_comp, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
	c_progressBar;
