/*
	Parameters:
		<-- Unit as Object
		<-- Optional (default: true): Add as Boolean, false removes the Eventhandler again
	

	Description:
		Applies a killed Eventhandler tracking waypointCompletionRadius crimes.
		Must run where the unit is local, since ace_medical_lastDamageSource is only set on that machine.
		A mounted unit gets no EH unless it is already handcuffed: ACE refuses to surrender it, so it is not a POW.
		Removal leaves the EH on a unit that is handcuffed by then, since it is a POW after all.
		
	Example:
		[_unit] remoteExec ["fw_fnc_powKilledEH", _unit];
		[_unit, false] remoteExec ["fw_fnc_powKilledEH", 0];

*/

// Parameter Init
params ["_unit",["_add",true]];

// Killed Eventhandler
private _code = {
	// Parameter Init
	params ["_dead"];

	// Find Killer and create info string
	private _killer = (_dead getVariable ["ace_medical_lastDamageSource", objNull]);

	// Check if player
	if (_killer in allPlayers) then {
		// Create String
		private _str = (name _dead) + " has been killed by " + (name _killer) + ".";

		// Publish info string through the server, the only machine that writes SR_WC
		[_str] remoteExecCall ["fw_fnc_logWarCrime", 2];
	};
};

// Swap the EH in one unscheduled step (isNil), so two calls for the same unit cannot interleave and stack.
// The index is only valid on this machine, so it is kept in a local variable.
isNil {
	// A timeout that raced a zip-tie keeps the EH, judged here on the owner where ace_captives_isHandcuffed is current
	if (!_add && {_unit getVariable ["ace_captives_isHandcuffed", false]}) exitWith {};

	private _old = _unit getVariable ["SR_PowKilledEH", -1];
	if (_old >= 0) then {_unit removeEventHandler ["Killed", _old]};
	_unit setVariable ["SR_PowKilledEH", nil];

	// Checked here rather than by the caller, so it runs on the same machine as ACE's own mounted check
	if (_add && {isNull objectParent _unit || {_unit getVariable ["ace_captives_isHandcuffed", false]}}) then {
		_unit setVariable ["SR_PowKilledEH", _unit addEventHandler ["Killed", _code]];
	};
};