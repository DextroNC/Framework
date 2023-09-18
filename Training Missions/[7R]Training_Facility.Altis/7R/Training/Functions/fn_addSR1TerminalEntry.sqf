params ["_parentMenu", "_rangePositionID", "_rangeMode", "_rangeDistance", ["_rangeDistanceVariance", 0.1] ];
_displayString = "";
if (count _rangeDistance > 1) then
{
	_displayString = "All Ranges";
}
else
{
	_displayString = format ["Range: %1m", (_rangeDistance select 0)];
};
_terminalFormatName = "r1_p%1_terminal";

_terminalRef = (missionNamespace getVariable ( format [_terminalFormatName, str _rangePositionID]) );
_aceMenuEntry = [
		("M" + str _rangeMode + "R" + str _rangeDistance),
		_displayString,
		"",
		{
			_actionParams = (_this select 2);
			_rangePositionID = (_actionParams select 0);
			_rangeMode = (_actionParams select 1);
			_rangeDistance = (_actionParams select 2);
			[_rangePositionID, _rangeMode, _rangeDistance] spawn fw_fnc_R1_rifle;
		},
		{
			_actionParams = (_this select 2);
			_terminalRef = (_actionParams select 3);
			!( _terminalRef getVariable ["rangeActive", false] )
		},
		{},
		[_rangePositionID, _rangeMode, _rangeDistance, _terminalRef]
	] call ace_interact_menu_fnc_createAction;
[_terminalRef, 0, ["ACE_MainActions", _parentMenu], _aceMenuEntry] spawn ace_interact_menu_fnc_addActionToObject;

