/*
	Parameters:
		<-- Trigger as Object
		
	Description:
		All enemy units within trigger get set to rampage mode.
		
	Example:
		OnActivation of a Trigger:
		nul = [thisTrigger] spawn fw_fnc_rampageArea;
*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter Init
params ["_trg"];
_allGroups = [];

// Find all enemy Units in Trigger Area which are hostile to Players
{
	if ((_x inArea _trg) && ([SR_Side, (side _x)] call BIS_fnc_sideIsEnemy)) then {
		_allGroups pushBackUnique (group _x);
	};
} forEach (allUnits - allPlayers);

{
	if (!(_x getVariable ["SR_PatrolMode",""] isEqualTo "RP")) then {
		_x setVariable ["SR_PatrolMode","RP"];
		deleteWaypoint [_x, 1];
	};
}forEach _allGroups;
