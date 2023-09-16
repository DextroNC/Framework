/*
	Parameters:
		<-- Dummy AI Unit as Object
		<-- Group as Group
		<-- Terminal as Object
		<-- Suppression as Integer

	Description:
		Adds Suppression Test mechanic to Dummy AI
*/

// Parameter Init
params ["_ai","_group","_terminal","_suppression"];
_count = 0;
_str = "";

// Adjust AI Skill
sleep 5;
[_ai,["courage",0.75]] remoteExec["setSkill",0];

// Display Loop
while {alive _ai} do {
	_sup = getSuppression _ai;

	// if Target suppressed or else
	if (_sup >= 0.45) then {
		if (_sup >= 0.8) then {
			_count = _count + 2;
			_str = format ["<t color='#00ff00' size='2' >Heavily Suppressed</t>"];
		} else {
			_count = _count + 1;
			_str = format ["<t color='#ffff00' size='2' >Suppressed</t>"];
		};
	} else {
		// Remove count
		if (_count > 0) then {_count = _count - 1;};
		_str = format ["<t color='#ff0000' size='2' >Not Suppressed</t>"];
	};

	// Info Message
	[[_str, "PLAIN DOWN", -1, true, true]] remoteExec ["cutText",_group];

	// End Condition
	if (_count >= _suppression || !(_terminal getVariable ["SR_Test",false])) then {
		deleteVehicle _ai;
		_s = _terminal getVariable ["SR_Hit",0];
		_terminal setVariable ["SR_Hit",(_s + 1),true];
		_str = format ["<t color='#0000FF' size='2' >Cease Fire</t>"];
		[[_str, "PLAIN DOWN", -1, true, true]] remoteExec ["cutText",_group];
	};
	hint Format ["Suppression: %1\nCounter: %2",_sup,_count];
	sleep 1;
	_ai setSkill ["courage",0.75];
};
