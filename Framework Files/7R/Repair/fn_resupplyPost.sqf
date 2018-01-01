/*		
	Parameters:
		<-- Player as Object
		<-- Trigger as Object
		
		Trigger Condition:
		player == driver (objectParent player) && vehicle player in thisList
		
		Trigger OnActivation:
		nul = [player,thisTrigger] spawn fw_fnc_resupplyPost;
		
*/

// Parameter init
params ["_unit","_trg"];
_veh = objectParent _unit;
_timer = 0;
_fuel = 0;
_dmg = 0;
_rearmed = false;
_end = false;
_eng = true;
_arm = "WAITING";

sleep 1;

// When Vehicle is in Zone conduct services
while {(position _veh inArea _trg) && !_end} do {
	
	// Timeout until Engine is turned off
	if (isEngineOn _veh) then {
		hint "Turn off the Engine!";
		_eng = true;
	} else {
		_eng = false;
		 hint format ["Service Status:\nFuel: %1%3\nRearm: %2", (round (_fuel * 100)),_arm, "%"];
	};
	
	// Get Status
	_fuel = fuel _veh; 

	if (_fuel < 1 && !_eng) then {
		_veh setFuel (_fuel + 0.025);
	};
	
	if (_fuel == 1 && !_eng) then {
		_timer = _timer + 1;
		_arm = str ((20 - _timer)) + "s"; 
	};
	if (_timer == 20) then {
		{
			["VehicleAmmo", [_x], _x] call CBA_fnc_targetEvent;
		} forEach (units _veh);
		_arm = "DONE";
		_end = true;
		hint format ["Service Status: \nDamage: %1%4\nFuel: %2%4\nRearm: %3", (round (_dmg * 100)), (round (_fuel * 100)),_arm, "%"];
		sleep 1;
		hint "Service complete!";
	};
	sleep 1;
	if (!(position _veh inArea _trg)) then {hint "Service aborted!";};
};