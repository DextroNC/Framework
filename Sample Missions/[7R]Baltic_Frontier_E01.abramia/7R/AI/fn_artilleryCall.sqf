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
_magClass = "";
_disperions = 100;
_rounds = 3;
_magArray = _u getVariable ["SR_Ammo_Class",nil];

// Check Ammo
private _ammo = _u getVariable ["ART_Ammo", 0];
 
// Set last mission time to block while firing
_u setVariable ["ART_LM", CBA_MissionTime];

// Select Magazines based on Mode
if (_u getVariable ["ART_FlaresOnly", false]) then {
	_magClass = _magArray select 2;
	_u addMagazine _magClass;
	_disperions = 150;	
	_rounds = 5;
} else {
	_magClass = _magArray select (_mode - 1);
	_u addMagazine _magClass;
	_disperions = [100,75,150] select (_mode - 1);
	_rounds = [3,4,5] select (_mode - 1);
};

// Ammo Check
if (_ammo - _rounds < 0) then {_rounds = _ammo};

// Exec Fire Support
_handle = [_u, _target, _magClass,_disperions, _rounds, [8, 12], {}, 35] spawn BIS_fnc_fireSupport;
_ammo = _ammo - _rounds;

waitUntil {scriptDone _handle};

// Update Status
_u setVariable ["ART_LM", CBA_MissionTime];
_u setVariable ["ART_Ammo", _ammo];
// Remove from available Artillery if ammo is depleded
if (_ammo <= 0) then {AI_ART_Units = AI_ART_Units - [_u]};