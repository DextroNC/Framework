/*
	Parameters:
		<-- Laptop as Object
		<-- Player as Object
		
		Description:
		Action for Laptop pick up.
		
		Example:
		none

*/

// Parameter Init
params ["_laptop","_unit"];

// Annimation
_unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

// Progress Bar
[3, _laptop, {
	// delete Laptop
	deleteVehicle (_this select 0); 
	// add inventory item to player
	player addItem "ARP_Objects_Laptop_M";
},{hint "Action Canceled"}, "Picking up Laptop..."] call ace_common_fnc_progressBar;
