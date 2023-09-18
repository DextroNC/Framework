/*
	Parameters:
		<-- Position as Position
		<-- Terminal as Object
		<-- Wall as Object
		<-- Hits to Kill as Integer
	
	Return:
		Targets as Object
		
	Description:
		Spawns sphere Target
		
	Example:
		nul = [[2,3,4],1,r2_p1_t,r2_p1,3] call fw_fnc_sphereTarget;

*/
// Parameter init
params ["_pos","_terminal","_wall","_hits","_class"];
_return = objNull;

_target = _class createVehicle [0,0,0];
_target enableSimulation false;
_target setDir (getDir _wall);
_target setPos _pos;

_target setVariable ["SR_Count", _hits];
_eh = _target addEventHandler ["hit", {
	params ["_t"];
	private "_c";
	_c = _t getVariable ["SR_Hit",0];
	_t setVariable ["SR_Hit", _c + 1];
	if (_t getVariable ["SR_Hit",0] == _t getVariable ["SR_Count", 1]) then {
		deleteVehicle _t;
	};		
}];

_target
