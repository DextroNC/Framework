/*
	Parameters:
		<-- Intel as Object
		<-- Time to pickup as Integer
		<-- Message Progress Bar as String
		<-- Investigation Mode as Boolean

		Description:
			Action to pick up intel or investigate.
		
		Example:
		none
*/

// Parameter Init
_target = _this select 0;
_time = _this select 2 select 1;
_stg = _this select 2 select 2;
_inv = _this select 2 select 3;

// Progress Bar and Animation
ace_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
if (_inv) then {
	[_time, _target, {(_this select 0)setVariable ["SR_Investigated",true,true]},{hint "Action Canceled"}, _stg] call ace_common_fnc_progressBar;
} else {
	[_time, _target, {deleteVehicle (_this select 0)},{hint "Action Canceled"}, _stg] call ace_common_fnc_progressBar;
};

