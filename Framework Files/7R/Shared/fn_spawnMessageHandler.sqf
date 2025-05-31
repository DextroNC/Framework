/*

	Description:
		Uses systemChat to announce new spawn wave

	Example:
	[] spawn fw_fnc_spawnMessageHandler;

*/

//Server only execute
if !(isServer) exitWith{};

sleep 35; 

SR_RespawnHandler = [
	{
		// Debug
		if (SR_Debug) then {systemChat format ["Spawns checked at time: %1s, SR_SpawnCount: %2", CBA_MissionTime, SR_SpawnCount];};

		// Send Spawn Message
		if (SR_SpawnCount > 0) then {
			["Reinforcements have spawned"] remoteExec ["systemChat", 0];
			SR_SpawnCount = 0;
			publicVariable "SR_SpawnCount";
		};
	}, 
	30,
	[]
] call CBA_fnc_addPerFrameHandler;

publicVariable "SR_RespawnHandler";