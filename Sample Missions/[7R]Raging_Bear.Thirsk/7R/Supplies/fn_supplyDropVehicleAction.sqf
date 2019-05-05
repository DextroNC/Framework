/*
	Parameters:
		<-- Box as Object

	Description:
		Build Vehicle Supply Station

*/

// Parameter Init
params["_b"];

// Progress Bar and Animation
ace_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
[10, _b, {
	private _b = _this select 0;
	_b setVariable ["ACE_isRepairFacility",1,true];
	
	// Create Trigger
	[_b] remoteExec ["fw_fnc_supplyDropVehicleTrigger", 0, true];

},{hint "Action Canceled"}, "Building Mobile Vehicle Supply Station"] call ace_common_fnc_progressBar;


