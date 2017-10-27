/*
		
	Parameters:
		<-- Type as String
		<-- SpawnPos as Object (Helipad invisible)
		<-- Cargo as Boolean (applies Vehicle Cargo)
		<-- Pylon Details as Array [[pylon name/index, magazine name, forced, turret],[pylon name/index, magazine name, forced, turret]]
	
		Used with Addaction:
		this addaction ["<t color=""#00FF00"">" +"Spawn Helicopter", fw_fnc_heloSpawn,["RHS_UH1Y",pad,false]];
		
*/

// Parameter init
_args = _this select 3;
_array = [];
_args params ["_type","_posObj","_cargo","_array"];

// Clear Landing Pad
_old = nearestObjects [_posObj,["AllVehicles"],10];
{
	deleteVehicle _x;
}forEach _old;

// Time Out
sleep 1;

// Spawn, Port, set Direction
_helo = _type createVehicle [0,0,0];
_helo setPosASL (getPosASL _posObj);
_helo setDir (getDir _posObj);

// Adding Fast Rope System
[_helo] call ace_fastroping_fnc_equipFRIES;

// Adding Pylons
if (count _array > 0) then {
	{
		_helo setPylonLoadOut _x;
	} forEach _array;
};

// Cargo
if (isNil "_cargo") exitWith {};
if (_cargo) then {
	[_helo] execVM "7R\VehicleCargoContent.sqf";	
};