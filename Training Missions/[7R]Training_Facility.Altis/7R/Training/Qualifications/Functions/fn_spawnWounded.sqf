/*
	Parameters:
		<-- Position as Position
		<-- Amount of Wounds as Intiger
		<-- Injury Strengh as Integer (0-1 float)

	Description:
		Adds Actions to Terminals to start tests.

*/

// Parameter Init
params ["_pos","_wounds","_strengh"];

// Parameter Processing
private _location = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
private _origin = ["shell","grenade","explosive","stab","bullet","vehiclecrash","backblast","falling"];
_location = _location call BIS_fnc_arrayShuffle; 
_origin = _origin call BIS_fnc_arrayShuffle; 

// Spawn with Basic Settings
private _group = createGroup civilian;
private _unit = _group createUnit ["B_Survivor_F", _pos, [],0,"NONE"];
_unit disableAi "ALL";
_unit setvariable ["ace_medical_preventInstaDeath", true, true];
_unit addItemToUniform "SR_PAK";

// Add injuries
for [{_i=0}, {_i <= _wounds}, {_i = _i + 1}] do {
	_strengh = _strengh + random [-1,0,1];
	[_unit, _strengh, (_location select _i),(_origin select _i)] call ace_medical_fnc_addDamageToUnit;
};

// Set Unconscious and add pain
//	[_unit, (_strengh + random [-1,0,1])] call ace_medical_fnc_adjustPainLevel;
[_unit, true] call ace_medical_fnc_setUnconscious;

_unit