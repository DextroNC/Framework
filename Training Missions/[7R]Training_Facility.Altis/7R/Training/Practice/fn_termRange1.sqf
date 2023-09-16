_main = {
	for "_rangePositionID" from 1 to 8 do
	{
		[_rangePositionID] call fw_fnc_R1AddAllModes;
	};
};

[] call _main;