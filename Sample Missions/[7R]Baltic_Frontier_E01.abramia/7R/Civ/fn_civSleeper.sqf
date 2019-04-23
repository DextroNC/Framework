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
params [["_unit",objNull],["_mode",1]];

switch (_mode) do {
	// Suicide Bomber Mode
	case 1: {
		_unit addItem "HandGrenade";
		_unit addEventHandler ["GetInMan", {
			params ["_unit"];
			[_unit] spawn fw_fnc_civBomber;
		}];
	};
	// Weapon Mode
	case 2: {
		_unit addWeapon "hgun_Pistol_01_F";
		_unit addMagazine "10Rnd_9x21_Mag";
		_unit addMagazine "10Rnd_9x21_Mag";
		sleep 2;
		[_unit] call ace_weaponselect_fnc_putWeaponAway;
		["ace_captiveStatusChanged", {
			params ["_unit","_status","_reason"];
			nul = [_unit] spawn fw_fnc_civShooter; 
		}] call CBA_fnc_addEventHandler;
	};
};
