/*

	Parameters:
		<-- Vehicle as Object
		<-- Pylons as Array (https://community.bistudio.com/wiki/getPylonMagazines)

	Description:
		Changes the pylons on an aircraft

	Example:
		[drone, ["PylonRack_3Rnd_ACE_Hellfire_AGM114N","PylonRack_3Rnd_ACE_Hellfire_AGM114K"]] spawn fw_fnc_changePylons;

*/

// Parameter init
params ["_vehicle","_pylons"];

// Get pylon config paths
private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply { getArray (_x >> "turret") };

// Remove existing pylons
{
	_vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
} forEach (getPylonMagazines _vehicle);

// Add new Pylons
{ 
	_vehicle setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex];
} forEach _pylons;