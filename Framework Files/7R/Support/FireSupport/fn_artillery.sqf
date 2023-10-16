/*
	Parameters:
		<-- Target Marker Name as String
		<-- Mission Type as String
		<-- Optional: Traveltime as Integer (Default: 10)
		
	Description:
		Handles simulated artillery support.

	Example:
	nul = ["Marker","spotting"] spawn fw_fnc_artillery;
*/

// Parameter Init
params ["_target","_type"];

// Check availability
if (!([_target] call fw_fnc_artilleryReadyCheck)) exitWith {};


// Variable Init
private _ammo = "Sh_155mm_AMOS";
private _rounds = 3;
private _cost = 1;
private _multipler = 1;
private _cooldown = 24;
private _dispersion = 25;
private _delay = [1,2];
private _altitude = 250;
private _speed = 150;
private _safezone = 10;
private _traveltime = 10;
private _removal = true;

// Select type
switch _type do {
    case "concentrated": {
		//_ammo = "M_Mo_155mm_AT";
		_rounds = 18; 
		_cost = 3;
		_multipler = 4;
		_dispersion = 30;
		_safezone = 0;
	};
    case "area": {
		_rounds = 24; 
		_cost = 4; 
		_multipler = 6;
		_dispersion = 150;
		_delay = [0.75,1.5];
	};
    case "medium": {
		_rounds = 16; 
		_cost = 2; 
		_multipler = 3;
		_dispersion = 80;
	};
    case "cluster": {
		_ammo = "Cluster_155mm_AMOS";
		_rounds = 3;
		_multipler = 4;
		_cost = 3;
		_delay = [2.5,4];
		_dispersion = 70;
	};
    case "smoke": {
		_ammo = "SR_ArtillerySmoke_120mm";
		_rounds = 9; 
		_cost = 0;
		_multipler = 1.5;
		_dispersion = 80;
		_safezone = 0;
	};
    case "flare": {
		_ammo = "SR_Artillery_Flare";
		_rounds = 5;
		_cost = 0;
		_delay = [30,45];
		_dispersion = 200;
		_multipler = 1.5;
		_altitude = 250;
		_speed = 0.10;
		_removal = false;
	};
	// Adjust by Fire
    default {
		_removal = false;
		_safezone = 0;
		//_multipler = 0.5;
	};
};

// Set cooldown
ArtilleryFireMissionReady = CBA_MissionTime + (_cooldown * _multipler);
publicVariable "ArtilleryFireMissionReady";

// Fire Mission Confirmation Message with Target and Volume + Create logEntities
private _feedback = "FS: " + _type + " barrage of " + str (_rounds) + " Rounds to Grid " + (mapGridPosition markerPos _target) + ".";
[_feedback,_feedback] spawn fw_fnc_info;
["CombatLog", ["Support", _feedback]] spawn CBA_fnc_globalEvent; 

// Delay
sleep random 3;

// Simulated Firing
["Rounds away."] spawn fw_fnc_info;

sleep (_rounds min 6);

["Rounds complete."] spawn fw_fnc_info;

// Simulated Travel Time
sleep _traveltime * _multipler;
["Splash out."] spawn fw_fnc_info;
sleep 1;

// Fire Support Function
private _handle = [_target,_ammo,_dispersion,_rounds,_delay,{},_safezone,_altitude,_speed] spawn BIS_fnc_fireSupportVirtual;

// Update Ammo
ArtilleryCallAmmo = ArtilleryCallAmmo - _cost;
publicVariable "ArtilleryCallAmmo";

// End
waitUntil {scriptDone _handle};
_feedback = "Artillery Fire Mission completed. " + str (ArtilleryCallAmmo) + " Artillery Supplies left.";
[_feedback,_feedback] spawn fw_fnc_info;

// Delete Marker
if (_removal) then {
	deleteMarker _target;
};