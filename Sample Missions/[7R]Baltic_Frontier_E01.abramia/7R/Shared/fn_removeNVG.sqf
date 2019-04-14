/*
	Parameters:
		<-- Unit as Object

	Description:
		Removes the NVG Mount or Helmet of a unit. 
		If SR_AI_addFlashlight is true it will add a flashlight to the gun of the AI.

	Example:
		[unit] spawn fw_fnc_removeNVG;

*/

// Parameter init
params ["_unit"];

// add Flashlight
if (SR_AI_addFlashlight) then {
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "acc_flashlight";
};

// Check if Unit has Mounted NVG and remove it
private _nvg = hmd _unit;
if (_nvg != "") exitWith {_unit unassignItem _nvg; _unit removeItem _nvg};

// Check if Helmet has inbuilt NVG and remove it
private _helmet = headGear _unit;
private _nvgHelmet = "";

if (_helmet != "") then {
    private _subItems = [(configFile>>"CfgWeapons">>_helmet), "subItems", []] call BIS_fnc_returnConfigEntry;
    { if (getText(configFile>>"CfgWeapons">>_x>>"simulation") == "NVGoggles") exitWith {removeHeadgear _unit} } forEach _subItems;
};

// Remove NVGs from Inventory
{ if (getText(configFile>>"CfgWeapons">>_x>>"simulation") == "NVGoggles") exitWith {_nvg = _x} } forEach items _unit;
if (_nvg != "") then {
	_unit removeItem _nvg;
};