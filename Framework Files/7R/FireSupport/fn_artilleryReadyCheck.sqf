/*
	Parameters:
		<-- Target Marker Name as String

	Return:
		--> Artillery Available as Boolean


	Description:
		Check wether artillery is available.

	Example:
		_return = [] call fw_fnc_artilleryReadyCheck;
*/

// Parameter Init
params ["_target"];
private _return = true;

// Check if other Fire Mission in progress, no Ammunition left and no Target designated.
if (ArtilleryFireMissionReady  >= 0) then {
	if (ArtilleryFireMissionReady > CBA_MissionTime) then {
		private _timeLeft = ArtilleryFireMissionReady - CBA_MissionTime;
		[("Negative: Artillery Fire Support not available. Try again in " + str(round _timeLeft) + " seconds."),("FS: Cooldown " + str(round _timeLeft) + " s")] spawn fw_fnc_info;
		_return = false;
	} else {
		if (ArtilleryCallAmmo <= 0) then {
			["Negative: Artillery Fire Support not available. Out of Ammunition.","FS: No Ammunition"] spawn fw_fnc_info;
			_return = false;
		} else {
			if (([_target] call fw_fnc_findLocation) isEqualto [0,0,0]) then {
				["No Artillery Target designated.","FS: No Target"] spawn fw_fnc_info;
				_return = false;
			};
		};
	};
} else {
	["No Artillery available.","FS: No Artillery"] spawn fw_fnc_info;
};

_return
