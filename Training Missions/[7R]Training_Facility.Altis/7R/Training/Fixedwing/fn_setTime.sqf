/*
	Sets time to a specific hour.

    Parameters:
        - Hour (24hr format) as Integer

	Example:
		[17] call fw_fnc_setTime;
*/

params ["_target", "_caller", "_actionId", "_hour"];

_currentDate = date;
[[_currentDate select 0, _currentDate select 1, _currentDate select 2, _hour, _currentDate select 4]] remoteExec ["setDate"];
