/*
	Pick up RP
	
*/
params ["_object","_unit","_item"];

// Final check if required item is carried by player
if (!(_item in weapons _unit) && !(_item in items _unit)) then {
	// Play Animation
	[_unit, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
	// ACE Progress Bar
	[3, _this, {
		// Parameter Init
		_args = _this select 0;
		_args params ["_target","_unit","_item"];
	
		deleteMarker "SR_RP";
		_unit addWeapon _item;
		_unit addItem _item;
		deleteVehicle _target;
		["RP: Picked up", 1.5] call ace_common_fnc_displayTextStructured;
	},{["RP: Canceled", 1.5] call ace_common_fnc_displayTextStructured;}, "Desconstructing Rallypoint..."] call ace_common_fnc_progressBar;
} else {
	// Abbort when missing required Item
	["RP: Already carrying RP Item", 1.5] call ace_common_fnc_displayTextStructured;
};