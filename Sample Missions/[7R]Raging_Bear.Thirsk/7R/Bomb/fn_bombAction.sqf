/*
	Parameters:
		<-- Bomb as Object
		
	Adds the ACE Interaction
*/

// Server Only Exec
if (!isServer) exitWith {};

// Parameter Init
Params ["_bomb"];
private _colors = ["blue","red","green","yellow","white"];

// Header 
_isDef = {"ACE_DefusalKit" in (items player) && !(_bomb getVariable ["bombDefused",false])};
_headerDef = ["7R_Def","Defuse","",{},_isDef] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions"], _headerDef] call ace_interact_menu_fnc_addActionToObject;

// Start Defuse
_bombD = ["7R_Def","Defuse","",{_target setVariable ["defuseStart",CBA_missionTime,true];},_isDef] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _bombD] call ace_interact_menu_fnc_addActionToObject;

// Wire Conditions
_blue = {"ACE_DefusalKit" in (items player) && (_bomb getVariable ["defuseStart", -1] > 0;) && !(_bomb getVariable ["bombDefused",false]) && !("blue" in (_bomb getVariable ["wiresCut",[]]))};
_red = {"ACE_DefusalKit" in (items player) && (_bomb getVariable ["defuseStart", -1] > 0;) && !(_bomb getVariable ["bombDefused",false]) && !("red" in (_bomb getVariable ["wiresCut",[]]))};
_green = {"ACE_DefusalKit" in (items player) && (_bomb getVariable ["defuseStart", -1] > 0;) && !(_bomb getVariable ["bombDefused",false]) && !("green" in (_bomb getVariable ["wiresCut",[]]))};
_yellow = {"ACE_DefusalKit" in (items player) && (_bomb getVariable ["defuseStart", -1] > 0;) && !(_bomb getVariable ["bombDefused",false]) && !("yellow" in (_bomb getVariable ["wiresCut",[]]))};
_white = {"ACE_DefusalKit" in (items player) && (_bomb getVariable ["defuseStart", -1] > 0;) && !(_bomb getVariable ["bombDefused",false]) && !("white" in (_bomb getVariable ["wiresCut",[]]))};

// Wire Actions
_bD = ["7R_Def","Defuse","",{_var = (_target getVariable ["wiresCut",[]]) append ["blue"];},_blue] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _bD] call ace_interact_menu_fnc_addActionToObject;
_rD = ["7R_Def","Defuse","",{_var = (_target getVariable ["wiresCut",[]]) append ["red"];},_red] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _rD] call ace_interact_menu_fnc_addActionToObject;
_gD = ["7R_Def","Defuse","",{_var = (_target getVariable ["wiresCut",[]]) append ["green"];},_green] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _gD] call ace_interact_menu_fnc_addActionToObject;
_yD = ["7R_Def","Defuse","",{_var = (_target getVariable ["wiresCut",[]]) append ["yellow"];},_yellow] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _yD] call ace_interact_menu_fnc_addActionToObject;
_wD = ["7R_Def","Defuse","",{_var = (_target getVariable ["wiresCut",[]]) append ["white"];},_white] call ace_interact_menu_fnc_createAction;
[_bomb, 0, ["ACE_MainActions","7R_Def"], _wD] call ace_interact_menu_fnc_addActionToObject;
