/*
	Parameters:
		<-- Intel as Object
		<-- Time to pickup as Integer
		<-- Message Progress Bar as String

		Description:
		Action to pick up intel. Intel object gets deleted on sucess.
		
		Example:
		none
*/

// Parameter Init
_target = _this select 0;
_time = _this select 2 select 1;
_stg = _this select 2 select 2;

// Progress Bar and Animation
ace_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
[_time, _target, {deleteVehicle (_this select 0)},{hint "Action Canceled"}, _stg] call ace_common_fnc_progressBar;
