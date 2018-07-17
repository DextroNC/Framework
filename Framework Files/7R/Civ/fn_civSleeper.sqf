/*
	Parameters:
		<-- Unit as Object
		<-- Mode as Integer (mode: 1 - Handgrenade Suicide; mode: 2 - Pistol)
		
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
			params ["_unit", "_role", "_vehicle", "_turret"];
			if (!alive _unit || !("HandGrenade" in items _unit)) exitWith {};
			sleep (2 + (random 5));
			[_unit, "akbar"] remoteExec ["say3D"];
			sleep 3;
			"GrenadeHand" createVehicle (position _unit);
		}];
	};
	// Weapon Mode
	case 2: {
		_unit addItem "hgun_Pistol_01_F";
		_unit addMagazine "10Rnd_9x21_Mag";
	
		["ace_captiveStatusChanged", {
			params ["_unit","_status","_reason"];
			nul = [_unit] spawn fw_fnc_civShooter; 
		}] call CBA_fnc_addEventHandler;
	};
};
