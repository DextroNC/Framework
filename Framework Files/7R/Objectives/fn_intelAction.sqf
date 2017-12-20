/*
	Parameters:
		<-- Intel as Object
		<-- Time to pickup as Integer
		<-- Message Progress Bar as String
		<-- Optional: Action Description as Text
		<-- Optional: Investigation Mode as Boolean

	Description:
	Adds the intel pickup action to intel piece.
	
	
	Example:
		Intel pickup:
			nul=[this,3,"Picking up intel..."] spawn fw_fnc_intelAction;
		
		Investigation:
			nul=[this,5,"Investigating...","Investigate",true] spawn fw_fnc_intelAction;
	

*/

// Server only exec
if(!isServer) exitWith {};

// Parameter init
params ["_object", "_time", "_text","_info","_inv"];
if (isNil "_info") then {
	_info = "Collect Intel";
};
if (isNil "_inv") then {
	_inv = false;
};

// adding Action
_action = ["sr_intel_collection", _info, "", {nul = [_this select 0, _this select 1, _this select 2, _this select 3] spawn fw_fnc_intelCollection;}, {!(_target getVariable ["SR_Investigated",false])}, {}, [_object,_time,_text,_inv]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

