/*
	Parameters:
		<-- None

	Description:
		Starts debrief mode, removes hostiles and displays messages.

	Example:
		[] call fw_fnc_debrief;

*/
// Message
["DEBRIEF STARTED", 1.5] remoteExec ["ace_common_fnc_displayTextStructured",0];

// Remove Hostiles
{
	if ([SR_Side, (side _x)] call BIS_fnc_sideIsEnemy && !(_x setVariable ["SR_NoRemoval", false])) then {
		deleteVehicle _x;
	};
} forEach (allUnits-allPlayers);

// Set Variables
phase = 9999;
publicVariable "phase";
SR_Unit_Cap = 0;
publicVariable "SR_Unit_Cap";

// Create Category
[player,["Debrief", "Debrief"]] remoteExec ["createDiarySubject",0];
// KIAs
[player,["Debrief",["Casulties",SR_KIA]]] remoteExec ["createDiaryRecord",0];
// Civilian Casulties
[player,["Debrief",["Civilian Casulties",SR_CC]]] remoteExec ["createDiaryRecord",0];
// War Crimes
[player,["Debrief",["War Crimes",SR_WC]]] remoteExec ["createDiaryRecord",0];

// Server Log
// KIAs
SR_KIA remoteExec ["diag_log",2];
// Civilian Casulties
SR_CC remoteExec ["diag_log",2];
// War Crimes
SR_WC remoteExec ["diag_log",2];

