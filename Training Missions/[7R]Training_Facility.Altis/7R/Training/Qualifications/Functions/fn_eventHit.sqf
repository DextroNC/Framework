/*
	Parameters:
		<-- Target as Object
		<-- Hit to Kill as Integer
		<-- Terminal as Object

	Description:
		Adds Hit EH to Pop-up Targets

*/

// Parameter Init;
params ["_target","_hitCount","_terminal"];
hitCount = _hitCount;
terminal = _terminal;

// Hit EH
_target addEventHandler ["hit", {
	params ["_t"];
	private "_c";

	_c = _t getVariable ["SR_Hit",0];
	_t setVariable ["SR_Hit", (_c + 1)];

	if ((_c + 1)  == hitCount) then {
		_t animate ["terc", 1];
		private "_s";
		_t setVariable ["SR_Hit",0];
		_s = terminal getVariable ["SR_Hit",0];
		terminal setVariable ["SR_Hit",(_s + 1),true];
		_t removeAllEventHandlers "hit";
	};		
}];