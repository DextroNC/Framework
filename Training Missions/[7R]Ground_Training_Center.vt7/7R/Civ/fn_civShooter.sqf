/*
	Parameters:
		<-- Unit as Object

	Description:
		Civilian takes weapon out of his inventory and engages players

*/
// Parameter Init
params ["_unit"];

// Check if Armed
if (!(handgunWeapon _unit isEqualTo "hgun_Pistol_01_F")) exitWith {};

// Remove Killed echo
_unit removeAllEventHandlers "killed";

// Delay 
sleep (5 + (random 3));

// Check if Armed
if (!(handgunWeapon _unit isEqualTo "hgun_Pistol_01_F")) exitWith {};

// Become Shooter
[_unit, false] call ACE_captives_fnc_setHandcuffed;
[_unit, false] call ACE_captives_fnc_setSurrendered;
_unit addMagazine "10Rnd_9x21_Mag";
_side = SR_Side call BIS_fnc_enemySides;
_group = createGroup (_side select 1);
[_unit] joinSilent  _group;
/*
sleep 2;
_muzzles = getArray(configFile >> "cfgWeapons" >> (handgunWeapon _unit) >> "muzzles");
_unit selectWeapon (_muzzles select 0);
*/

_unit reveal (_unit findNearestEnemy _unit); 


// Remove all FiredNear EH
_unit removeAllEventHandlers "FiredNear";