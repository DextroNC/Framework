/*
	Parameters:
		<-- Target Marker Name as String
		<-- Type of Shell as String
		<-- Amount of Rounds to Fire as Integer
		<-- Dispersion as Integer (Impact Radius in meter)
		<-- Traveltime as Integer (Seconds)
		<-- Optional: Costs overwrite as Integer
		
	Recommended:
	ModuleOrdnanceMortar_F
	ModuleOrdnanceHowitzer_F
	ModuleOrdnanceRocket_F 
	
	Description:
		Handles simulated artillery support.

	Example:
	nul = ["Marker","ModuleOrdnanceMortar_F",3,50,0] spawn fw_fnc_artillery;
*/

// Parameter Init
params ["_target","_type","_rounds","_disp","_traveltime","_cost"];
if (isNil "_cost") then {_cost = _rounds};

// Init Public variables if not initialized in init.sqf or else with default values.
if (isNil "ArtilleryFireMissionLock") then {ArtilleryFireMissionLock = false; publicVariable "ArtilleryFireMissionLock";};
if (isNil "ArtilleryCallAmmo") then {ArtilleryCallAmmo = 45; publicVariable "ArtilleryCallAmmo";};

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (ArtilleryFireMissionLock) exitWith {
	["Negative: Artillery Fire Support available. Other Mission in progress.","FS: Currently Busy"] spawn fw_fnc_info;
};
if (ArtilleryCallAmmo == 0) exitWith {
	["Negative: Artillery Fire Support available. Out of Ammunition.","FS: No Ammunition"] spawn fw_fnc_info;
};
if (([_target] call fw_fnc_findLocation) isEqualto [0,0,0]) exitWith {
	["No Artillery Target designated.","FS: No Target"] spawn fw_fnc_info;
};

// Locks other requests, only one Fire Mission at a time.
ArtilleryFireMissionLock = true;
publicVariable "ArtilleryFireMissionLock";

// if not enough ammo to fulfill mission, remaining will be used.
if (ArtilleryCallAmmo < _cost) then {_cost = ArtilleryCallAmmo};

// Fire Mission Confirmation Message with Target and Volume + Create logEntities
_str = "Artillery Fire Mission: " + str (_rounds) + " Rounds to Grid " + (mapGridPosition markerPos _target) + ".";
[_str,_str] spawn fw_fnc_info;
["CombatLog", ["Support", _str]] spawn CBA_fnc_globalEvent; 

// Delay
sleep random 3;

// Simulated Firing
["Rounds away."] spawn fw_fnc_info;
for [{_i=1},{_i<=_rounds},{_i=_i+1}] do {
	sleep 2;
};
["Rounds complete."] spawn fw_fnc_info;

// Simulated Travel Time
sleep _traveltime + random 2;
["Splash out."] spawn fw_fnc_info;
sleep 1;

// Fire Support and adjust Ammo
private _handle = [_target,_type,_disp,_rounds,[1.5,4],{},10] spawn BIS_fnc_fireSupportVirtual;
if (_type isEqualTo "UK3CB_BAF_WPSmoke_81mm_AMOS") then {
	[_target,"Smoke_120mm_AMOS_White",50,5,[1.5,4],{},10] spawn BIS_fnc_fireSupportVirtual;
};

ArtilleryCallAmmo = ArtilleryCallAmmo - _cost;
publicVariable "ArtilleryCallAmmo";
waitUntil {scriptDone _handle};

// Finish up
deleteMarker _target;
_str = "Artillery Fire Mission completed. " + str (ArtilleryCallAmmo) + " Rounds left.";
[_str,_str] spawn fw_fnc_info;

// Lock release to allow new Fire Missions
ArtilleryFireMissionLock = false;
publicVariable "ArtilleryFireMissionLock";