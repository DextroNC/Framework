/*
	Parameters:
		<--- None
		
	Auto Exec on Start.

*/

// ACRE Settings
// General
[false, false] call acre_api_fnc_setupMission;

// Terrain Loss (Interference)
[0] call acre_api_fnc_setLossModelScale;

// Full Duplex (Multi people can talk at the same time)
[true] call acre_api_fnc_setFullDuplex;

// Interference (Multi people sending at same frequency)
[false] call acre_api_fnc_setInterference;

// AI hearing players
[true] call acre_api_fnc_setRevealToAI;

// Disables simulation of Antenna Direction
[true] call acre_api_fnc_ignoreAntennaDirection;

// Channel Names
["ACRE_PRC152", "default", 1, "description", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 2, "description", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "description", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 4, "description", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 5, "description", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 6, "description", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC148", "default", 1, "label", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 2, "label", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 3, "label", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 4, "label", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 5, "label", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 6, "label", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC117F", "default", 1, "name", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "name", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "name", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "name", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "name", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "name", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

/*
// Players only
if (hasInterface) then
{
	// Wait until ACRE initialized
	waitUntil{[] call acre_api_fnc_isInitialized};
	
};

*/