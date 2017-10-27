/*		
	Parameters:
		<-- Player as Object
		<-- Trigger as Object
		
		Trigger Condition:
		player == driver (objectParent player) && vehicle player in thisList
		
		Trigger OnActivation:
		nul = [player,thisTrigger] spawn fw_fnc_repairStation;
		
*/

// Parameter init
_unit = _this select 0;
_veh = objectParent _unit;

// Get Status
hint "Starting Service...";
sleep 5;

// Repair
_veh setDamage 0;
hint "...repair done...";
sleep 5;

// Fuel
_veh setfuel 1;
hint "...refueling done...";
sleep 5;

// Ammunition
{
	["VehicleAmmo", [_x], _x] call CBA_fnc_targetEvent;
} forEach (units vehicle _unit);
hint "...rearming done, Service finished.";
