/*
	Parameters:
		<-- Unit as Object

	Description:
		Civilian takes weapon out of his inventory and engages players

*/
// Parameter Init
params ["_unit"];

// Check if Armed
if (!("hgun_Pistol_01_F" in items _unit)) exitWith {};

// Delay 
sleep (6 + (random 8));

// Check if Armed
if (!("hgun_Pistol_01_F" in items _unit)) exitWith {};

// Become Shooter
[_unit, false] call ACE_captives_fnc_setHandcuffed;
[_unit, false] call ACE_captives_fnc_setSurrendered;
_unit addMagazine "10Rnd_9x21_Mag";
_side = SR_Side call BIS_fnc_enemySides;
_group = createGroup _side;
[_unit] joinSilent _group;
