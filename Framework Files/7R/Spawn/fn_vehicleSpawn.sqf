/*

	Parameters:
		<-- Type as String
		<-- SpawnPos as Object (Helipad invisible)
		<-- Cargo as Integer (Loadout Case of Vehicle Cargo Content)

		Addaction:
		this addaction ["<t color=""#00FF00"">" +"Spawn Vehicle", fw_fnc_vehicleSpawn,["B_T_LSV_01_armed_F",v_pad]];
*/

// Parameter init
_args = _this select 3;
_args params ["_type","_posObj",["_cargo",0]];


// Clear Landing Pad

_old = nearestObjects [_posObj,["AllVehicles"],10];
{
	if (!((typeOf _x) isEqualTo "Burnes_LCAC_1")) then {
		deleteVehicle _x;
	};
}forEach _old;

// Despawn
if (count _type == 0) exitWith {
	hint "Spawn Pad Cleared";
};

sleep 2;

// Spawn, Port, set Direction
_veh = _type createVehicle (getPosASL _posObj);
_veh setDir (getDir _posObj);

// Cargo
if (_cargo > 0) then {
	[_veh,_cargo] execVM "loadouts\_vehicle_cargo_content.sqf";
};
