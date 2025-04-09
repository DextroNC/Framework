/*

	Description:
		Forces Respawn of all players in queue

	Example:
	[] spawn fw_fnc_forceRespawn;

*/

//Player only execute
if !(hasInterface) exitWith {};

setPlayerRespawnTime 1;