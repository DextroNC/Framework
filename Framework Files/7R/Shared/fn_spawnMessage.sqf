/*

	Description:
		Uses systemChat to announce new spawn wave

	Example:
	[player] spawn fw_fnc_spawnMessage;

*/

params ["_unit"];

//Player only execute
if !(local _unit) exitWith{};

private _recentlyRun = missionNamespace getVariable ["spawnMessageSentRecently",false];

sleep (0.5 + random 2); // random staggering to avoid running more than once

if !(_recentlyRun) then {
	missionNamespace setVariable ["spawnMessageSentRecently",true]; // stop this from running more than once per wave
	"Reinforcements have spawned" remoteExec ["systemChat", 0];
	sleep 60; // generous sleep to allow for staggered spawns due to desync
	missionNamespace setVariable ["spawnMessageSentRecently",false];
};