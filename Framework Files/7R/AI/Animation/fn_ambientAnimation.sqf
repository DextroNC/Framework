/*
	Parameters:
		<-- Unit as Object
		<-- Animation Type as Integer
		<-- Optional: Combat Ready as Boolean (default: false)

	All Animations and Parameters can be found here:
	https://github.com/DextroNC/Framework/wiki/fw_fnc_ambientAnimation
		
	Return:
		none
		
	Description:
		Puts a ai unit into ambient animations
		
	Example:
		[_unit, 1] call fw_fnc_ambientAnimation;
*/
// Parameter Init
params ["_unit",["_animationType",0],["_combatReady",false]];

// Execute where unit is local
if (!local _unit) exitWith {};

// Add Eventhandler to break animation when unit is arrested
["ace_captiveStatusChanged", {[_unit] call zen_modules_fnc_moduleAmbientAnimEnd;}] call CBA_fnc_addEventHandler;

// Add Animation
[{_this call zen_modules_fnc_moduleAmbientAnimStart;}, [_unit,_animationType,_combatReady]] call CBA_fnc_execNextFrame;
