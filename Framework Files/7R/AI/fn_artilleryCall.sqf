/*
	Parameters:
		<-- Artillery as Object
		<-- Mode as Integer (1: HE, 2: Smoke, 3: Flare)
		<-- Target as Position
	
	_rounds = 5;
} else {
	_magClass = _magArray select (_mode - 1);
	_u addMagazine _magClass;
	_disperions = [100,75,150] select (_mode - 1);
	_rounds = [3,4,5] select (_mode - 1);
};

// Ammo Check
if (_ammo - _rounds < 0) then {_rounds = _ammo};

// Exec Fire Support
_handle = [_u, _target, _magClass,_disperions, _rounds, [8, 12], {}, 35] spawn BIS_fnc_fireSupport;
_ammo = _ammo - _rounds;

waitUntil {scriptDone _handle};
