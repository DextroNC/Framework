/*
	Parameters:
		<-- Unit as Object
		<-- Mode as Integer (mode: 1 - Handgrenade Suicide; mode: 2 - Pistol/Shooter)
		
	Description:
		A civilian will pretent to be innocent, but under condition will turn against players.

	Example:
		nul = [this, 1] spawn fw_fnc_civSleeper;	

*/

// Server Only Execute
if(!isServer) exitWith {};

// Parameter Init
params [["_unit",objNull],["_mode",1],["_zone",""]];

// Set Patrol
if (count _zone > 0) then {
	[group _unit, _zone, 4] spawn fw_fnc_civPatrol;
};

switch (_mode) do {
	// Suicide Bomber Mode (When Loaded in a Vic he blows himself up)
	case 1: {
		// Add Explosives
		_unit addItem "rhs_mag_rgd5";

		// Add EH
		_unit addEventHandler ["GetInMan", {
			params ["_unit"];
			[_unit] spawn fw_fnc_civBomberAction;
		}];
	};
	// Weapon Mode
	case 2: {
		// Assign Weapon
		_unit addWeapon "hgun_Pistol_01_F";
		_unit addMagazine "10Rnd_9x21_Mag";
		_unit addMagazine "10Rnd_9x21_Mag";
		sleep 2;

		// Hide Weapon
		[_unit] call ace_weaponselect_fnc_putWeaponAway;

		// Captive EH
		["ace_captiveStatusChanged", {
			params ["_unit","_status","_reason"];
			nul = [_unit] spawn fw_fnc_civShooter; 
		}] call CBA_fnc_addEventHandler;

		// Fired Near EH
		_unit addEventHandler ["FiredNear", {
			params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
			if (_distance < 25) then {
				nul = [_unit] spawn fw_fnc_civShooter; 
			};
		}];
	};
};
