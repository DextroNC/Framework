/*
	Parameters:
		<-- Artillery as Object
		<-- Mode as Integer (0: HE, 1: Smoke, 2: Flare)
		<-- Target as Object
		
	Description:
		Makes Artillery Unit Fire
		
	Example:
		nul = [_art,1,_targetPos] spawn fw_fnc_artilleryCall;
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
	_magClass = _magArray select _mode;
	_u addMagazine _magClass;
	_disperions = [75,50,150] select _mode;
	_rounds = [3,3,3] select _mode;
};

// Ammo Check
if (_ammo - _rounds < 0) then {_rounds = _ammo};
// Exec Fire Support
for "_i" from 1 to _rounds do {
	private _target = [[[_target, _disperions]],[[_target, 25]]] call BIS_fnc_randomPos;
	_u doArtilleryFire [_target, _magClass, _rounds];
	sleep random [1,2,3];
};

//waitUntil {scriptDone _handle};
if (SR_Debug) then {systemChat format ["%1 fired %2 rounds %3 at %4", _u, _rounds, _magClass, (mapGridPosition _target)];};

// Update Status
_u setVariable ["ART_LM", CBA_MissionTime];
_ammo = _ammo - 1;
_u setVariable ["ART_Ammo", _ammo];
// Remove from available Artillery if ammo is depleded
if (_ammo <= 0) then {AI_ART_Units = AI_ART_Units - [_u]};