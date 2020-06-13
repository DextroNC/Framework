/*
	Parameters:
		<-- Trigger as Object
		<-- Hack as Object
		
		Description:
		Server Side Hacking Loop (per frame). Handles the hacking progression.
		
		To evaluate if hack is completed:
		trg getVariable ["SR_Hack",0] == 100 (Condition on seperate Trigger)
			- trg = trigger object of the hack zone trigger
			- Return of "SR_Hack" is progression in %
		
		Example:
		[_trg,_laptop] remoteExec ["fw_fnc_hackingLoop", 2];
*/
// Server only Exec
if (!isServer) exitWith {};

// Per Frame Event Handler
[{
	// Parameter Init
	Params ["_args","_handle"];
	_args params ["_trg","_hack"];
	private ["_cur","_str"];
	_cur = _trg getVariable "SR_Hack";
	
	// Exit Loop on Error (should never happen) to prevent infinit loop
	if (isNil "_cur") exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	// Laptop does not exist anymore (or being picked up) - abbord
	if (!alive _hack) exitWith {
		
		[_handle] call CBA_fnc_removePerFrameHandler;
	}; 
	
	// Hack completed
	if (_cur == 99) exitWith {
		_cur = _cur + 1;
		_trg setVariable ["SR_Hack",100,true];
		["","Hack Completed" ] remoteExec ["fw_fnc_info"];
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
	
	// Interupted frame exit
	if (_hack getVariable ["SR_Hack_Interrupt",false]) exitWith{};

	// Interrupt if no players close to laptop
	if ((count (allPlayers inAreaArray _trg))== 0) exitWith{
		_hack setVariable ["SR_Hack_Interrupt",true,true];
		["","Hack Paused" ] remoteExec ["fw_fnc_info"];
	};
	
	// Regular Hacking Progress Increase
	_cur = _cur + 1;
	_trg setVariable ["SR_Hack",_cur,true];
	_str = format ["Hack Progress: %1 %", _cur];
	["",_str] remoteExec ["fw_fnc_info"];

} , 2, [_this select 0, _this select 1]] call CBA_fnc_addPerFrameHandler;