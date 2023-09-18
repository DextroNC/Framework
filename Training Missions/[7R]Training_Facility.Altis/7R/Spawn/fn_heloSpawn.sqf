/*

	Parameters:
		<-- Type as String
		<-- SpawnPos as Object (Helipad invisible)
		<-- Optional: Cargo as Integer (Loadout Case of Vehicle Cargo Content)
		<-- Pylon Details as Array [[pylon name/index, magazine name, forced, turret],[pylon name/index, magazine name, forced, turret]]

	Description:
		Spawns a Helicopter

	Example:
		Used with Addaction:
		this addaction ["<t color=""#00FF00"">" +"Spawn Helicopter", fw_fnc_heloSpawn,["RHS_UH1Y",pad]];

*/

// Parameter init
_args = _this select 3;
_args params ["_type","_posObj",["_cargo",0],["_array",[]]];

// Clear Landing Pad
_old = nearestObjects [_posObj,["AllVehicles"],10];
{
	deleteVehicle _x;
}forEach _old;

// Despawn
if (count _type == 0) exitWith {
	hint "Spawn Pad Cleared";
};

// Time Out
sleep 2;

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

// Default Cargo
clearweaponcargoGlobal _helo;
clearmagazinecargoGlobal _helo;
clearitemcargoGlobal _helo;
clearBackpackCargoGlobal _helo;
_helo addItemCargoGlobal ["SR_PAK", 4];
_helo additemcargoGlobal ["SmokeShellPurple", 4];
_helo additemcargoGlobal ["ACE_HandFlare_Green", 4];

// Cargo
if (_cargo > 0) then {
	[_helo,_cargo] execVM "loadouts\VehicleCargoContent.sqf";
};

// UH-1 Camo
if (_type in ["rhs_uh1h_hidf","rhs_uh1h_hidf_gunship"]) then {
	[
		_helo,
		["us_army",1],
		true
	] call BIS_fnc_initVehicle;
};
