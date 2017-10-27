/*		
	Parameters:
		<-- Player as Object
		<-- Trigger as Object
		
		Trigger Condition:
		player == driver (objectParent player) && vehicle player in thisList
		
		Trigger OnActivation:
		nul = [player,thisTrigger] spawn fw_fnc_resupplyPost;
		
*/

// Parameter init
params ["_unit","_trg"];
_veh = objectParent _unit;

// Get Status
hint "Starting Service...";
sleep 5;

if (!(_veh inArea _trg)) exitWith {hint "Service aborted, Vehicle left Service Area.";};
// Fuel
_veh setfuel 1;
hint "...refueling done...";
sleep 5;

if (!(_veh inArea _trg)) exitWith {hint "Service aborted, Vehicle left Service Area.";};
// Ammunition
{
	["VehicleAmmo", [_x], _x] call CBA_fnc_targetEvent;
} forEach (units vehicle _unit);
hint "...rearming done, Service finished.";
