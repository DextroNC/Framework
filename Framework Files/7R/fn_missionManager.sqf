/*		
	Parameters:
		<-- Phase Number as Integer
		
	Description:
	Modify and add unit spawn template code per phase. 
	
	You can also use it to spawn counter attacks, just handle them as a Phase.
	Add further case in the switch-do-loop.
	
	Make Phase Variable an Integer. On trigger Act. use instead of phase = true; phase = phase + 1 or phase = 2.
		
	Example:
		nul = [1] spawn fw_fnc_missionManager - Counter Attack 1
		nul = [2] spawn fw_fnc_missionManager - Mission Phase 2
		nul = [3] spawn fw_fnc_missionManager - Counter Attack 2
		
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter init
params ["_nbr"];

// Phase Case means Phase
switch (_nbr) do {
    case 1: {
		["a1","PATROL",7,["a1","SAFE","LIMITED","NOFOLLOW"]] spawn fw_fnc_spawnTemplate; 
		["os1_2","GARRISON",1,[150,true,true]] spawn fw_fnc_spawnTemplate; 
		["a2",["LOP_CHR_Civ_Random"], 10,0] spawn fw_fnc_civSpawn;
	};
    case 2: {

	};
	case 3: {

	};
};