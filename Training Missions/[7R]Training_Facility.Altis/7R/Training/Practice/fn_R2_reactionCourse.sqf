/*
	Parameters:
		<-- Terminal as Object
		<-- Wall as Object
		<-- Unit as Object
		<-- Amount of Targets as Integer
		<-- Hits to Kill
		<-- Timer as Integer
		<-- Opt. Jamming
	
	Return:
		None
		
	Description:
		Spawns a Target at the Range
		
	Example:
		nul = [r2_p1_t,r2_p1,player,10,3,0,Steel_Plate_S_F] call fw_fnc_reactionCourse;

*/
// Parameter init
params ["_terminal","_wall","_unit","_count","_hits","_timer","_class","_jam"];
if (isNil "_jam") then {_jam = false};
if (_timer == 0) then {_timer = 9999};

_ehandl = _unit addEventHandler ["Fired",{
	params ["_u"];
	private "_s";
	_s = _u getVariable ["SR_Fired", 0];
	_u setVariable ["SR_Fired", (_s + 1)];
}];

hint "Get Ready - Start in 5s";
sleep 5;
playSound "FD_Course_Active_F";
hint "Live!";

_start = CBA_MissionTime;
_terminal setVariable ["SR_Active",true,true];

_jamChance = round random [2,5,_count];

_counter = 0;
// Loop all Targets
for "_i" from 1 to _count do {
	_time =  CBA_MissionTime;
	_pos = _wall modelToWorld [(random 15)-7.5,-0.58,random [-1.5,0,1.2]];
	_target = [_pos,_terminal,_wall,_hits,_class]call fw_fnc_sphereTarget;
	if (_jam && _i == _jamChance) then {
		[_unit, currentWeapon _unit] call ace_overheating_fnc_jamWeapon;
	};
	if (_jam && _i == 8) then {
		_class = "Steel_Plate_S_F";
	};
	waitUntil {!alive _target || CBA_MissionTime - _time > _timer || !(_terminal getVariable ["SR_Active",false])};
	if (!(_terminal getVariable ["SR_Active",false])) exitWith {deleteVehicle _target;};
	if (!alive _target) then {_counter = _counter + 1};
	deleteVehicle _target;
};
_count = _counter;


_str = name _unit + " fired " + str (_unit getVariable ["SR_Fired", 0]) + " Rounds at " + str (_count) + " Targets in " + str (round (CBA_MissionTime - _start)) + " seconds.";
["CombatLog", ["Shooting Range 2", _str]] spawn CBA_fnc_globalEvent; 

sleep 1;
playSound "FD_Course_Active_F";
sleep 1;
playSound "FD_Course_Active_F";
hint _str;

// Reset EH and Fired Count
_unit setVariable ["SR_Fired",0];
_unit removeEventHandler ["Fired", _ehandl];
_terminal setVariable ["SR_Active",false,true];
