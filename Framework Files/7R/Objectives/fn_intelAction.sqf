/*
	Parameters:
		<-- Intel as Object
		<-- Time to pickup as Integer
		<-- Message Progress Bar as String
		<-- Optional: Action Description as Text

	Description:
	Adds the intel pickup action to intel piece.
	
	
	Example:
	nul=[this,3,"Picking up intel..."] spawn fw_fnc_intelAction; (intel init line)

*/

// Server only exec
if(!isServer) exitWith {};

// Parameter init
params ["_object", "_time", "_text","_info"];
if (isNil "_info") then {
	_info = "Collect Intel";
};

// adding Action
_action = ["sr_intel_collection", _info, "", {nul = [_this select 0, _this select 1, _this select 2] spawn fw_fnc_intelCollection;}, {true}, {}, [_object,_time,_text]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

