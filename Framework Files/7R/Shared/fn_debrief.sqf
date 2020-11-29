/*
	Parameters:
		<-- Opt: No Deletion as Boolean

	Description:
		Starts debrief mode, removes hostiles and displays messages.

	Example:
		[] call fw_fnc_debrief; (Global Execute)

*/
// Parameter Init
params [["_noDelete",false]];


// Exit when debrief already in progress
if (phase == 9999) exitWith {
	["DEBRIEF IN PROGRESS", 1.5] spawn ace_common_fnc_displayTextStructured;
};

// Message
["DEBRIEF STARTED", 1.5] spawn ace_common_fnc_displayTextStructured;

// Server Only
if (isServer) then {
	// Stop recording
	["WMT_fnc_EndMission", _this] call CBA_fnc_localEvent;

	// Remove Hostiles
	if (!_noDelete) then {
		// Deny new spawns
		SR_Unit_Cap = 0;
		publicVariable "SR_Unit_Cap";
		// Remove Hostiles
		{
			if ([SR_Side, (side _x)] call BIS_fnc_sideIsEnemy && !(_x setVariable ["SR_NoRemoval", false])) then {
				deleteVehicle _x;
			};
		} forEach (allUnits-allPlayers);
	};

	// Set Variables
	phase = 9999;
	publicVariable "phase";
	
	// Server Log
	{
		diag_log _x;
	} forEach [SR_KIA,SR_CC,SR_WC];

	// Remove Corpses (perFrameEH)
	[{
		// Remove Corpses
		{
			deleteVehicle _x;
		} forEach allDeadMen;
	} , 1, []] call CBA_fnc_addPerFrameHandler;
};

// Debrief Diary Records
// Create Category
[player,["Debrief", "Debrief"]] remoteExec ["createDiarySubject",0];
// KIAs
[player,["Debrief",["Casulties",SR_KIA]]] remoteExec ["createDiaryRecord",0];
// Civilian Casulties
[player,["Debrief",["Civilian Casulties",SR_CC]]] remoteExec ["createDiaryRecord",0];
// War Crimes
[player,["Debrief",["War Crimes",SR_WC]]] remoteExec ["createDiaryRecord",0];
// Friendly Fire
[player,["Debrief",["Friendly Fire",SR_FF]]] remoteExec ["createDiaryRecord",0];

// Unload Weapons
{
	player setAmmo [_x, 0];
} forEach weapons player;

// Full Heal Player
[player] call ace_medical_treatment_fnc_fullHealLocal;
