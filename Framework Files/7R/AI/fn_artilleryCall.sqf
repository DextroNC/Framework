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

// Mode Selection
if (_mode == 2 && "8Rnd_82mm_Mo_Smoke_white" in getArtilleryAmmo [_u]) then {_mag = "8Rnd_82mm_Mo_Smoke_white";};
if (_mode == 3 && "8Rnd_82mm_Mo_Flare_white" in getArtilleryAmmo [_u]) then {_mag = "8Rnd_82mm_Mo_Flare_white";};

// Ammo Check
if (_ammo - _rounds < 0) then {_rounds = _ammo};

// Exec Fire Support
_handle = [_u,_target,_mag,100,_rounds,[5,10],{},25] spawn BIS_fnc_fireSupport;
_ammo = _ammo - _rounds;

waitUntil {scriptDone _handle};

// Update Status
_u setVariable ["ART_LM", CBA_MissionTime];
_u setVariable ["ART_Ammo", _ammo];
// Remove from available Artillery if ammo is depleded
if (_ammo <= 0) then {AI_ART_Units = AI_ART_Units - [_u]};