/*		
	Parameters:
		<-- Phase Number as Integer
		
	Description:
	Modify and add unit spawn template code per phase. 
	
	You can also use it to spawn counter attacks, just handle them as a Phase.
	Add further case in the switch-do-loop.
	
	Make Phase Variable an Integer. On trigger Act. use instead of phase = true; phase = phase + 1 or phase = 2.
		
	Example:
		nul = [1] spawn fw_fnc_missionManager;
		
*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1
    case 1: {
		_handle = ["a1","PATROL",7,["a1","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
		waitUntil {scriptDone _handle};
		["os1_2","GARRISON",1,[150,true,true]] spawn fw_fnc_spawnTemplate; 
		["a2",["LOP_CHR_Civ_Random"], 10,0] spawn fw_fnc_civSpawn;
		["vs1","VEHICLE",9,["is1",false,["a1","SAFE"]]] spawn fw_fnc_spawnTemplate;
	};
    case 2: {

	};
	case 3: {

	};
};