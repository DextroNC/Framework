/*

	Parameters:
		<-- Vehicle as Object

	Description:
		Handler for AI reaction to convoy assault

*/
// Only Execute on Server
if(!isServer) exitWith {};

// Parameter Init
params ["_vehicle"];
private _group = group _vehicle;
private _leader = leader _group;

// Handler for Dammage
private _index = _vehicle addEventHandler ["Dammaged",{
	(leader group driver (_this select 0)) setVariable ['dismount', true, true];
}];

// Wait Until Contact 
waitUntil {_leader getVariable ["dismount", false] || !alive _leader || !alive _vehicle || _leader call BIS_fnc_enemyDetected };
_leader setVariable ["dismount", true,true];

// Split off vehicle group
private _newGroup = createGroup (side _group);
crew _vehicle join _newGroup;
private _newLeader = leader _newGroup;
_newGroup setVariable ["Vcm_Disable",false,true]; 

// Create Patrol Zone
private _marker = createMarkerLocal [str (_newLeader), position _newLeader];
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSizeLocal [100, 100];

// React to contact
[leader _newGroup, [_marker, "P"], [_marker, "P"], 4] spawn fw_fnc_dismountVehicle;