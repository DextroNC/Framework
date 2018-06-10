/*
	Parameters:
		<-- Box as Object
		<-- Spare Part as String of Classname

	Description:
		Spawn Spare Parts

*/

// Progress Bar and Animation
ace_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
[2, _this, {
	(_this select 0) params ["_b","_p"];
	_veh = _p createVehicle position _b;
	
},{hint "Action Canceled"}, "Getting Spare Parts"] call ace_common_fnc_progressBar;


