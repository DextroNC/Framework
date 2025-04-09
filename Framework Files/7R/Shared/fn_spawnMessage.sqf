/*

	Description:
		Uses systemChat to announce new spawn wave

	Example:
	[] spawn fw_fnc_spawnMessage;

*/

if !(isServer) then {};

private _recentlyRun = missionNamespace getVariable ["recentRunGlobal",false];

sleep (0.5 + random 2); // random staggering to avoid running more than once

if !(_recentlyRun) then {
	missionNamespace setVariable ["recentRunGlobal",true]; // stop this from running more than once per wave
	"Reinforcements have spawned" remoteExec ["systemChat", 0];
	sleep 60; // generous sleep to allow for staggered spawns due to desync
	missionNamespace setVariable ["recentRunGlobal",false];
};