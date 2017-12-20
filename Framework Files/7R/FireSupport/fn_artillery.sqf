/*
	Parameters:
		<-- Target Marker Name as String
		<-- Type of Shell as String
		<-- Amount of Rounds to Fire as Integer
		<-- Dispersion as Integer (Impact Radius in meter)
		<-- Traveltime as Integer (Seconds)
		
	Recommended:
	ModuleOrdnanceMortar_F
	ModuleOrdnanceHowitzer_F
	ModuleOrdnanceRocket_F 
	
	Description:
		Handles simulated artillery support.

	Example:
	nul = ["ModuleOrdnanceMortar_F","Sh_82mm_AMOS",3,30,35,100] spawn fw_fnc_artillery;
*/

// Parameter Init
params ["_target","_type","_rounds","_disp","_traveltime"];

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "ArtilleryFireMissionLock") then {ArtilleryFireMissionLock = false; publicVariable "ArtilleryFireMissionLock";};
if (isNil "ArtilleryCallAmmo") then {ArtilleryCallAmmo = 30; publicVariable "ArtilleryCallAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (ArtilleryFireMissionLock) exitWith {
	[[SR_Side, "IND"],"Negative: Artillery Fire Support available. Other Mission in progress."] remoteExec ["sideChat", -2];
};
if (ArtilleryCallAmmo == 0) exitWith {
	[[SR_Side, "IND"],"Negative: Artillery Fire Support available. Out of Ammunition."] remoteExec ["sideChat", -2];
};
if (markerPos _target isEqualto [0,0,0]) exitWith {
	[[SR_Side, "IND"],"No Artillery Target designated."] remoteExec ["sideChat", -2];
};

// Locks other requests, only one Fire Mission at a time.
ArtilleryFireMissionLock = true;
publicVariable "ArtilleryFireMissionLock";

// if not enough ammo to fulfill mission, remaining will be used.
if (ArtilleryCallAmmo < _rounds) then {_rounds = ArtilleryCallAmmo};

// Fire Mission Confirmation Message with Target and Volume + Create Log
_str = "Artillery Fire Mission: " + str (_rounds) + " Rounds to Grid " + (mapGridPosition markerPos _target) + ".";
[[SR_Side, "IND"],_str] remoteExec ["sideChat", -2];
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// Delay
sleep random 3;

// Simulated Firing
[[SR_Side, "IND"],"Rounds away."] remoteExec ["sideChat", -2];
for [{_i=1},{_i<=_rounds},{_i=_i+1}] do {
	sleep 2;
};
[[SR_Side, "IND"],"Rounds complete."] remoteExec ["sideChat", -2];

// Simulated Travel Time
sleep _traveltime + random 2;
[[SR_Side, "IND"],"Splash out."] remoteExec ["sideChat", -2];
sleep 1;

// Spawning of the Shells above Impact
for [{_i=1},{_i<=_rounds},{_i=_i+1}] do {
	_targetpos = [_target, _disp] call CBA_fnc_randPos;
	_shell = _type createVehicle _targetpos;
	ArtilleryCallAmmo = ArtilleryCallAmmo - 1;
	sleep random 3;
};

// Publishing of new Ammo Count and Ending Message
publicVariable "ArtilleryCallAmmo";
deleteMarker _target;
sleep 5;
_str = "Artillery Fire Mission completed. " + str (ArtilleryCallAmmo) + " Rounds left.";
[[SR_Side, "IND"], _str] remoteExec ["sideChat", -2];

// Lock release to allow new Fire Missions
ArtilleryFireMissionLock = false;
publicVariable "ArtilleryFireMissionLock";