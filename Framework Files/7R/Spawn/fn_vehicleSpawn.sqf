/*
		
	Parameters:
		<-- Type as String
		<-- SpawnPos as Object (Helipad invisible)
		<-- Cargo as Boolean

		Addaction:
		this addaction ["<t color=""#00FF00"">" +"Spawn Vehicle", fw_fnc_vehicleSpawn,["B_T_LSV_01_armed_F",v_pad, false]];
*/

// Parameter init
_type = (_this select 3) select 0;
_posObj = (_this select 3) select 1;
_cargo = (_this select 3) select 2;

// Clear Landing Pad

_old = nearestObjects [_posObj,["AllVehicles"],10];
{
	deleteVehicle _x;
}forEach _old;

sleep 1;

// Spawn, Port, set Direction
_veh = _type createVehicle (getPosASL _posObj);
_veh setDir (getDir _posObj);

// Cargo
if (isNil "_cargo") exitWith {};
if (_cargo) then {
	[_veh] execVM "7R\VehicleCargoContent.sqf";	
};