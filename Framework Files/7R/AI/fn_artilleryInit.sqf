/*
	Parameters:
		<-- Unit as Object
		<-- Ammunition as Integer
		<-- Range as Integer
		<-- Cooldown as Integer
		<-- Should only fire flares as boolean (default is false)
		
	Description:
		Init for Artillery Units to be aviable for AI units to call.
		
	Example:
		On Mortar Init Line:
		nul = [this, 30, 1200, 60] spawn fw_fnc_artilleryInit;
*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (count entities "HeadlessClient_F" > 0) then {
	if (isServer) exitWith {};
};

// Parameter Init
params ["_unit","_ammo","_range","_cool", ["_flares", false]];

// Magazine Management
_ammoArray = [];

_weapon = (_unit weaponsTurret [0]) select 0;
_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

// Find HE
_ammoArray pushBack (getArtilleryAmmo [_unit] select 0); 

// Find Smokes
{
	// Checks if the ammo contains the keyword specified above
	if (["smoke", _x, false] call BIS_fnc_inString || _x isEqualTo "rhs_mag_d832du_10") exitWith {
		_ammoArray pushBack _x;
	};
} forEach _magazines;

// Find Flare
{
	// Checks if the ammo contains the keyword specified above
	if (["flare", _x, false] call BIS_fnc_inString || _x isEqualTo "rhs_mag_3vs25m_10") exitWith {
		_ammoArray pushBack _x;
	};
} forEach _magazines;

// Store Parameters on Unit
_unit setVariable ["SR_Ammo_Class",_ammoArray];
_unit setVariable ["ART_Ammo", _ammo];
_unit setVariable ["ART_Range", _range];
_unit setVariable ["ART_CD", _cool];

/*
 * If the unit should only fire flares
 * */
if (_flares) then {
	_unit setVariable ["ART_FlaresOnly", _flares];
};

// Add Artillery Unit to Artillery Unit Array
if (isNil "AI_ART_Units") then {AI_ART_Units = [];};

AI_ART_Units pushBack _unit;

