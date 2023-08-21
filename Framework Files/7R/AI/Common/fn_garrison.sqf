/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Radius as Integer

	Return:
	--> None

	Description:
		Makes the unit garrison random buildings

	Example:
		[_position,_units,_radius] spawn fw_fnc_garrison;
*/
// Parameter Init
params ["_position","_units","_radius",["_mode",0]];

// Minimum Radius and Garrison Function
if (_radius < 0) then {
    [_position, nil, _units, 20, _mode, false, true] call ace_ai_fnc_garrison;
} else {
	[_position, nil, _units, _radius, _mode, false, true] call ace_ai_fnc_garrison;
};

_group = group (_units select 0);
_group deleteGroupWhenEmpty true;
SR_PatrolUnits pushBackUnique _group;

{// Add event handler globally to enable pathing on nearby group members when ally is killed

	[_x,
		["Killed", 
			{
				params ["_unit", "_killer", "_instigator", "_useEffects"];

				// Debug
				if (SR_Debug) then { format ["%1 was killed", _unit] remoteExec ["systemChat", 0]; };

				if ((_unit distance2D _instigator) < SR_InstigatorDistance) then {
					{
						if ((_unit distance2D _x) < SR_ReleaseDistance) then {

							if (selectRandomWeighted [true,SR_ReleaseProbability,false,1-SR_ReleaseProbability]) then {
								_x enableAI "PATH";
								_x setCombatBehaviour "COMBAT";

								// Debug
								if (SR_Debug) then { format ["%1 now has pathing enabled", _x] remoteExec ["systemChat", 0]; };
							};

							[_x ,["Killed", _thisEventHandler]] remoteExec ["removeEventHandler", 0];

						};
					} forEach (units _unit);
				};
			} 
		]
	] remoteExec ["addEventHandler", 0, true];
	
} forEach _units;

// Debug
if (SR_Debug) then { format ["%1 garrison %2 with radius %3", group (_units select 0), mapGridPosition _position, _radius] remoteExec ["systemChat", 0]; };
