/*

	Parameters:
		<-- Lead Vehicle as Object
		<-- Distance as Integer
		<-- Speed Limit as Integer
		<-- Optional: Force on Roads

	Description:
		Makes AI operate a convoy which upon contact reacts

*/
// Only Execute on Server
if(!isServer) exitWith {};

// Parameter Init
params ["_leadVic","_distance",["_speed",160],["_forceRoad",false]];
private _group = group _leadVic;
private _leader = leader _group;
private _vehicles = [_group, true] call BIS_fnc_groupVehicles;

// Disable Vcom
_group setVariable ["Vcm_Disable",true,true]; 
_group setFormation "COLUMN";

// Adjust conditions
{
	_x setConvoySeparation _distance;
	_x forceFollowRoad _forceRoad;
	_x limitSpeed _speed;
	[_x] spawn fw_fnc_convoyReaction;
}forEach _vehicles;