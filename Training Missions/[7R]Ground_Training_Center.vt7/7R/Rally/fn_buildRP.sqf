/*
	Parameters:
		<-- Unit as Object
		<-- Item Classname as String
		<-- Model Classname as String

	Description:
		Build Rallypoint
	
*/
params ["_unit","_item","_model"];
// Final check if required item is carried by player
if ((_item in weapons _unit) || (_item in items _unit)) then {
	// Play Animation
	[_this select 0, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
	// ACE Progress Bar
	[3, _this, {
		// Parameter Init
		_args = _this select 0;
		_args params ["_unit","_item","_model"];
		private _pos = player modelToWorld [0,1.5,0];
		
		// Create RP Object
		private _rp = _model createVehicle [0,0,0];
		_rp setPos _pos;
		
		_unit removeItem _item;
		_unit removeWeapon _item;
		
		// Delete Existing RP Marker
		deleteMarker "SR_RP";
		
		// Create Waypoint
		private _marker = createMarker ["SR_RP", _pos];
		_marker setMarkerType "respawn_inf";
		_marker setMarkerColor "ColorBlue";
		
		// Add Pick up Action to RP
		_action = ["sr_rp_destroy", "Deconstruct Rallypoint", "", {nul=[_target,_player,"SR_RallyTent"] spawn fw_fnc_destroyRP}, {true}] call ace_interact_menu_fnc_createAction;
		[_rp, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
		["RP: Ready", 1.5] call ace_common_fnc_displayTextStructured;
	},{["RP: Canceled", 1.5] call ace_common_fnc_displayTextStructured;}, "Placing Rallypoint..."] call ace_common_fnc_progressBar;
} else {
	// Abbort when missing required Item
	["RP: Missing Item", 1.5] call ace_common_fnc_displayTextStructured;
};