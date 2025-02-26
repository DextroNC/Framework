/*
	Parameters:
		<-- Unit as Object
		<-- Opt.: Animation as Integer (Animation Type based of fw_fnc_ambientAnimation, default: 32)
		<-- Opt.: Sleeper As Integer (1: Bomber, 2: Weapon, default: 0 none)

	
	Description:
		VIP will stay at location and play an animation. VIP is blocked from cleanup removal.
	
	Trigger Condition: 
		hvt getVariable ["SR_HVT_Escaped", false]
		
	Example:
		nul = [this] spawn fw_fnc_vip; (HVT init line)
*/

// Only on Server
if (!isServer) exitWith {};

// Parameter Init
params ["_unit",["_animation", 32],["_sleeper",0]];
private _group = group _unit;

// Modify AI Behaviour and disable AI Mods
_group setVariable ["Vcm_Disable",true];
_group setVariable ["lambs_danger_disableGroupAI", true];
_unit setVariable ["lambs_danger_disableAI", true];

// Remove from HC transfer
_unit setVariable ["acex_headless_blacklist", true];

// Remove HVT from dead body clean up
_unit setVariable ["SR_NoRemoval", true, true];

// Ambient Animation
[_unit, _animation] spawn fw_fnc_ambientAnimation;

// Add Sleeper mode
if (_sleeper > 0) exitWith {
	[_unit, _sleeper min 2] spawn fw_fnc_civSleeper;	
};

// Add killed EH to track Killer if no sleeper
[_unit,false] spawn fw_fnc_civEventhandler;