/*
	Parameters:
		<-- Box as Object

*/

// Parameter Init
params["_b"];

// Progress Bar and Animation
ace_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
[5, _b, {
	private _b = _this select 0;
	ace_trenches_trenchSupplies = ace_trenches_trenchSupplies + 100;
	publicVariable "ace_trenches_trenchSupplies";
	deleteVehicle _b;
},{hint "Action Canceled"}, "Taking Supplies"] call ace_common_fnc_progressBar;


