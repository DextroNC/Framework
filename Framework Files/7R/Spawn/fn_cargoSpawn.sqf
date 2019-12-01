/*
		
	Parameters:
		<-- Type as Integer
		<-- SpawnPos as Object (Helipad invisible)
	
	Description:
		Spawns Box on Cargo Load Point.
	
	Example:
		nul = [1,slingpad] spawn fw_fnc_cargoSpawn;
	
*/

// Parameter init
params ["_mode","_posObj"];

// Clear Landing Pad
_old = nearestObjects [_posObj,["ReammoBox_F"],5];
{
	deleteVehicle _x;
}forEach _old;

// Delay
sleep 2;

// Spawn Box
private _box = [_mode] call fw_fnc_supplySpawn;
_box setPosASL (getPosASL _posObj);
_box setDir (getDir _posObj);
_box allowDamage true;

// Information Hint
["","Sling-Load Box Spawned"] spawn fw_fnc_info;