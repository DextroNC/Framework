params ["_shootingPosition"];

_RangePositionMarker = "r1_p" + str _shootingPosition + "_cleanuparea";
[_RangePositionMarker] spawn fw_fnc_cleanUp;
player removeEventHandler["Fired", 0];
player setVariable ["shotsFired", nil];
player setVariable ["laneMode", nil ];
player setVariable ["startTime", nil ];

_terminalRef = (missionNamespace getVariable (format ["r1_p%1_terminal", str _shootingPosition]) );
_terminalRef setVariable ["rangeActive", false, true];
