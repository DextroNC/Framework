/*
	Parameters:
		<-- Unit as Object

		
	Description:
		Applies a killed Eventhandler to garrison units to enable path finding
		
	Example:
		nul = [_unit] spawn fw_fnc_garrisonKilledEH;

*/

// Parameter Init
params ["_unit"];


// Killed Eventhandler
_unit addEventHandler ["Killed", {
	// Parameter Init
	params ["_dead"];

	// Find Killer and create info string
	private _killer = (_dead getVariable ["ace_medical_lastDamageSource", objNull]);

	// Check if player
	if (_killer in allPlayers && _killer distance2d _dead < SR_InstigatorDistance) then {
		// Calculate number of AI to release
		private _groupUnits = (units group _dead) call BIS_fnc_arrayShuffle;
		private _maxCount = floor (count _groupUnits * SR_MaxRatio) - ({_x checkAIFeature "PATH" && alive _x} count _groupUnits);
		if (_maxCount <= 0) then {_maxCount = 0};

		// Filter all relevant units
		private _releaseUnits =  [];
		{
			// Filter based on distance and disabled path finding
			if (_x distance2D _dead < SR_ReleaseDistance && alive _x && !(_x checkAIFeature "PATH") && selectRandomWeighted [true,SR_ReleaseProb,false,1-SR_ReleaseProb]) then {
				_releaseUnits pushBackUnique _x;
 			};

			// Remove EH
			_x removeAllEventHandlers "Killed";

		} forEach _groupUnits;

		// Clip _releaseUnits to _maxCount
		if (count _releaseUnit > _maxCount) then {_releaseUnits resize _maxCount;};

		{
			// Release units
			_x enableAI "PATH";
			_x setCombatMode "RED";
			
			// Debug
			if (SR_Debug) then { format ["%1 now has pathing enabled", _x] remoteExec ["systemChat", 0]; };
		} forEach _releaseUnits;
	};
}];