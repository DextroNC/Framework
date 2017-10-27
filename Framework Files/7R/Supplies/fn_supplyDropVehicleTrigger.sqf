/*
	Parameters:
		<-- Box as Object

*/

// Parameter Init
params["_b"];

// Manipulate Trigger
_trg = createTrigger ["EmptyDetector", getPos _b]; 
_trg setTriggerArea [15, 15, 0, false, 15];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["player == driver (objectParent player) && vehicle player in thisList", "nul = [player,thisTrigger] spawn fw_fnc_resupplyPost", ""];
