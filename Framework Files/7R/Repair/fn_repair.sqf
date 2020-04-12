/*		
	Parameters:
		<-- Vehicle as Object
		<-- Player as Object
		
	Description:
		Vehicle Repair Action
		
*/

// Parameter init
params ["_vehicle","_player"];
private _timer = 0;
private _fuel = 0;
private _dmg = 0;
private _hitPoints = false;
private _end = false;
private _eng = true;
private _arm = "WAITING";

// Wait
sleep 1;
// Condition
FNC_condiction = {
	private _player = _this; 
	count nearestObjects [vehicle _player,["SR_SupplyPadEmpty","SR_SupplyPad"],15,true] > 0 && vehicle _player != _player && isTouchingGround (vehicle _player)
};

// When Vehicle is in Zone conduct services
while {_player call FNC_condiction} do {
	
	// Timeout until Engine is turned off
	if (isEngineOn _vehicle) then {
		["","Turn off the Engine"] spawn fw_fnc_info;
		_eng = true;
	} else {
		_eng = false;
		 _text = ["Service Status: <br/>Damage: %1%4<br/>Fuel: %2%4<br/>Rearm: %3", (round (_dmg * 100)), (round (_fuel * 100)),_arm, "%"];
		 [_text, 2.5] call ace_common_fnc_displayTextStructured;
	};
	
	// Get Status
	_fuel = fuel _vehicle; 
	_dmg = damage _vehicle;

	if (_dmg > 0 && !_eng) then {
		_vehicle setDamage (_dmg - 0.025);
	};

	if (_dmg == 0 && !_hitPoints) then {	
		{
			[_vehicle, _x, 0, false] spawn BIS_fnc_setHitPointDamage;
		}forEach ((getAllHitPointsDamage _vehicle) select 0);
		_hitPoints = true;
	};

	if (_dmg == 0 && _fuel < 1 && !_eng) then {
		_vehicle setFuel (_fuel + 0.025);
	};
	
	if (_dmg <= 0 && _fuel >= 1 && !_eng) exitWith {
		[_vehicle, player, _vehicle] spawn ace_rearm_fnc_rearmEntireVehicle;
	};
	sleep 1;
};

// ExitMsg on Abort
if (! (_player call FNC_condiction)) then {["", "Service Aborted"] spawn fw_fnc_info;} else {
	["","Service Completed"] spawn fw_fnc_info;	
};