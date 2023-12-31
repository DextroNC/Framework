/*
	Parameters:
		<-- Group as Group
		
	Return:
		<-- Artillery as Object (ObjNull for non)
		
	Description:
		Checks wheiter Artillery available.
		
	Example:
		OnActivation of a Trigger:
		_art = [_grp] call fw_fnc_artilleryCheck;
*/
// Parameter Init
params ["_grp"];
_return = objNull;

// Exit if no Artillery Units are present
if (count AI_ART_Units == 0) exitWith {_return};

// Check weither Artillery is within Range and available
{
	// Check Range
	if ((_x getVariable ["ART_Range", 1000]) > (_x distance2d leader _grp)) then {
		// Check Cooldown
		if ((CBA_MissionTime - (_x getVariable ["ART_LM", 0])) > (_x getVariable ["ART_CD", 120])) then {
			// Check Ammo
			if ((_x getVariable ["ART_Ammo", 0]) > 0 && side _x == side _grp) exitWith {
				_return = _x;
			};
		};
	};
}forEach AI_ART_Units;

_return
