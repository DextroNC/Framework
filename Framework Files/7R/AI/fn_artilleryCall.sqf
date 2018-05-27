/*
	Parameters:
		<-- Artillery as Object
		<-- Mode as Integer (1: HE, 2: Smoke, 3: Flare)
		<-- Target as Position
		
	Description:
		Makes Artillery Unit Fire
		
	Example:
		nul = [_art,1] spawn fw_fnc_artilleryCall;
*/
// Parameter Init
params ["_u","_mode","_target"];
_mag = "";
_rounds = 3;

// Check Ammo
private _ammo = _u getVariable ["ART_Ammo", 0];
 
// Set last mission time to block while firing
_u setVariable ["ART_LM", CBA_MissionTime];

/*
 * Stops the script when the unit is flares only but AI did not request flares
 * */
if (_u getVariable ["ART_FlaresOnly", false] && _mode != 3) exitWith {};

// Mode Selection
_possibleAmmo = [];

if (_mode != 1) then {
	// Loops through all the possible ammo types
	{
		private ["_keyword"];

		// Selects the keyword according to the mode number
		switch (_mode) do {
			case 3: {
				_keyword = "flare";
			};
			default {
				_keyword = "smoke";
			};
		};

		// Checks if the ammo contains the keyword specified above
		if ([_keyword, _x, false] call BIS_fnc_inString) then {
			// Adds the ammo type to the list
			_possibleAmmo = _possibleAmmo + [_x];
		};
	} forEach ((getArtilleryAmmo [_u]) call BIS_fnc_arrayShuffle);
};

/*
 * Exits the script if there is no possible ammo
 * Only executes when the mode is not 1
 * */
_condition = count _possibleAmmo == 0 && _mode != 1;

if (_condition) exitWith {};
if (!_condition) then {
	_mag = selectRandom _possibleAmmo;
};

// Ammo Check
if (_ammo - _rounds < 0) then {_rounds = _ammo};

// Exec Fire Support
_handle = [_u, _target, _mag, 100, _rounds, [10, 15], {}, 35] spawn BIS_fnc_fireSupport;
_ammo = _ammo - _rounds;

waitUntil {scriptDone _handle};

// Update Status
_u setVariable ["ART_LM", CBA_MissionTime];
_u setVariable ["ART_Ammo", _ammo];
// Remove from available Artillery if ammo is depleded
if (_ammo <= 0) then {AI_ART_Units = AI_ART_Units - [_u]};