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
if (isServer) exitWith {
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

// Unload Weapons
{
	player setAmmo [_x, 0];
} forEach weapons player;

// Full Heal Player
[player] call ace_medical_treatment_fnc_fullHealLocal;

// Individual Score Calculation
(getPlayerScores player) params ["_infKills","_vicKills","_armorKills", "_airKills", "_deaths", "_totalScore"];
private _scoreRecord = format ["Your Score:" + "<br/>" + "Kills: " + str(_infKills) + "<br/>" + "Vehicle Kills: " + str(_vicKills) + "<br/>" + "Armor Kills: " + str(_armorKills) + "<br/>" + "Air Kills: " + str(_airKills) + "<br/>" + "Deaths: " + str(_deaths) + "<br/>" + "Total Score: " + str(_totalScore)];

// Debrief Diary Records
// Create Category
player createDiarySubject ["Debrief","Debrief"];
// Records
player createDiaryRecord ["Debrief", ["Casualties", SR_KIA]];
player createDiaryRecord ["Debrief", ["Civilian Casulties", SR_CC]];
player createDiaryRecord ["Debrief", ["War Crimes", SR_WC]];
player createDiaryRecord ["Debrief", ["Friendly Fire", SR_FF]];
player createDiaryRecord ["Debrief", ["Score", _scoreRecord]];
