// Parameter init
params ["_con","_terminal"];

// Unified Start
// _terminal set Active
_terminal setVariable ["SR_Test",true,true];
_terminal setVariable ["SR_Hit",0,true];

// add Shooter EH
_ehShooter = [_con] call fw_fnc_trackShooter;

// Start Horn
[practice_range_horn,_con] spawn fw_fnc_courseStart;

// Ammo to Ammobox
t_sup_ammo addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];

// Target Pop-Up Course function
while {_terminal getVariable ["SR_Test",false]} do {
	
	// Suppression Target
		private _aiGroup = createGroup east;
		private _ai = _aiGroup createUnit ["O_Survivor_F", [0,0,0], [],0,"NONE"];
		_ai disableAi "TARGET";
		_ai disableAi "AUTOTARGET";
		_ai disableAi "MOVE";
		_ai disableAi "WEAPONAIM";
		_ai disableAi "COVER";
		_ai disableAi "AUTOCOMBAT";
		_ai setUnitPos "UP";
		_ai setVariable ["asr_ai_exclude", true];
		_ai allowDamage false;
		[_ai,true] remoteExec ["hideObjectGlobal",2];
		_ai setSkill 0.5;
		_ai setSkill ["courage",0.75];
		_ai setPosASL (getPosASL t_supp); 
		[_ai,_con,_terminal,20] spawn fw_fnc_suppression;
	
	// Wait Until target has been hit or Course aborted
	private _s = _terminal getVariable ["SR_Hit",0];
	waitUntil {_terminal getVariable ["SR_Hit",0] > _s || !(_terminal getVariable ["SR_Test",false])};
	
	// If couse completed compile result message
	if (_terminal getVariable ["SR_Hit",0] == 1) exitWith {
	private _result = "";
	private _shots = _con getVariable ["SR_Fire", 0];
	if (_shots <= 200) then {_result = "Passed"} else {_result = "Too much ammo spent"};
	private _str = format ["Shots Fired: %1\nCourse %2",_shots,_result];
	_str remoteExec ["hint", _con]; 
	_terminal setVariable ["SR_Test",false,true];
	_terminal setVariable ["SR_Hit",0,true];
	_con setVariable ["SR_Fire", 0];
	};
};
// Remove Fired EH from Shooter
_con  removeEventHandler ["Fired", _ehShooter];
// End Horn
[practice_range_horn,_con] spawn fw_fnc_courseEnd;

clearMagazineCargoGlobal t_sup_ammo;