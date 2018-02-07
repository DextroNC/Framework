/*
	Parameters:
		<-- Unit as Object
		<-- Ammunition as Integer
		<-- Range as Integer
		<-- Cooldown as Integer
		
		
	Description:
		Init for Artillery Units to be aviable for AI units to call.
		
	Example:
		On Mortar Init Line:
		nul = [this, 30, 1200, 60] spawn fw_fnc_artilleryInit;
*/

// Server only execute
if (!isServer) exitWith {};

// Parameter Init
params ["_unit","_ammo","_range","_cool"];

// Store Parameters on Unit
_unit setVariable ["ART_Ammo", _ammo];
_unit setVariable ["ART_Range", _range];
_unit setVariable ["ART_CD", _cool];

// Add Artillery Unit to Artillery Unit Array
if (isNil "AI_ART_Units") then {AI_ART_Units = [];};

AI_ART_Units pushBack _unit;

