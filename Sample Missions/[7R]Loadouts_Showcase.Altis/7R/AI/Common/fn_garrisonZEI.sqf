/*
	Parameters:
		<-- Position as Array
		<-- Units as Array
		<-- Group as Group

	Return:
	--> None

	Description:
		Makes the unit garrison in the closest building

	Example:
		[_position,_units] spawn fw_fnc_garrisonZEI;
*/
// Parameter Init
params ["_position","_units","_group"];

// Find Closest Building and pass over
_building = (nearestObjects [_position, ["building"], 200, true]) select {count (_x buildingPos -1) > 0};

// Exit if no building available
if (count _building == 0) exitWith {
	// Debug
	if (SR_Debug) then { systemChat format ["%1 could not garrison", group (_units select 0)];};
};

// Garrisson Function
private _bldPos = (_building select 0) buildingPos -1;
{
	if (count _bldPos == 0) exitWith {};
	private _rndPos = selectRandom _bldPos;
	_bldPos = _bldPos - [_rndPos];
	[_group, _x, _rndPos, (_building select 0)] call ZEI_fnc_garrisonUnit;
} forEach _units;

// Add event handler  to enable pathing on nearby group members when ally is killed
{
	[_x] spawn fw_fnc_garrisonKilledEH;
} forEach units _group;

// Debug
if (SR_Debug) then { systemChat format ["%1 garrison %2", group (_units select 0), mapGridPosition _position];};
