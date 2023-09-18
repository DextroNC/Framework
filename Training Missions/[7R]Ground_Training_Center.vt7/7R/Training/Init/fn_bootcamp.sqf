/*
	Parameters:
		None
	Description:
		Adds Actions to Terminals at Bootcamp

*/
// Parameter Init
private _ranges = [[bc_tf1,bc_tr1],[bc_tf2,bc_tr12],[bc_tf3,bc_tr3],[bc_tf4,bc_tr4]];
private _active = {_target getVariable ["SR_Test",false]};
private _inactive = {!(_target getVariable ["SR_Test",false])};
private _leader = {leader group player == player};

// Shooting Range
{
	// Parameter Init
	_x params ["_terminal","_trigger"];

	// Rifle Range
	private _rifle = ["SR_Test", "Start Rifle Course", "", {
	params ["_target", "_player", "_params"];
	_params params ["_terminal","_trigger"];
	[_trigger,_terminal,"SR_PopUpTarget_1",true] remoteExec  ["fw_fnc_setTargetArea",0];
	nul = [_player,5] spawn fw_fnc_jamWeapon;
	}, _inactive, {}, _x] call ace_interact_menu_fnc_createAction;
 	[_terminal, 0, ["ACE_MainActions"], _rifle] spawn ace_interact_menu_fnc_addActionToObject;

	// Launcher Range
	private _launcher = ["SR_Test", "Start Launcher Course", "", {
	params ["_target", "_player", "_params"];
	_params params ["_terminal","_trigger"];
	[_trigger,_terminal,"SR_LargeTarget_HD",true] remoteExec  ["fw_fnc_setTargetArea",0];
	}, _inactive, {}, _x] call ace_interact_menu_fnc_createAction;
 	[_terminal, 0, ["ACE_MainActions"], _launcher] spawn ace_interact_menu_fnc_addActionToObject;

	 // Reset
	private _reset = ["SR_Test", "Start Launcher Course", "", {
	params ["_target", "_player", "_params"];
	_params params ["_terminal","_trigger"];
		nul = [_trigger] spawn fw_fnc_resetTargetArea;
	 	_terminal setVariable ["SR_Test",false,true];
	}, _active, {}, _x] call ace_interact_menu_fnc_createAction;
 	[_terminal, 0, ["ACE_MainActions"], _reset] spawn ace_interact_menu_fnc_addActionToObject;
}forEach _ranges;

// Paradrop
// HAHO
private _haho = ["SR_Test", "Start HAHO", "", {
params ["_target", "_player", "_params"];
	nul = [_target,_player,0,["bc_approach","bc_spawn",2500,"Windrunner 1-1",false,"bc_dz"]] spawn fw_fnc_paraDrop;

}, _leader, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_para, 0, ["ACE_MainActions"], _haho] spawn ace_interact_menu_fnc_addActionToObject;

// HALO
private _halo = ["SR_Test", "Start HALO", "", {
params ["_target", "_player", "_params"];
	nul = [_target,_player,0,["bc_dz","bc_spawn",2500,"Windrunner 1-1",false,"bc_dz"]] spawn fw_fnc_paraDrop;

}, _leader, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_para, 0, ["ACE_MainActions"], _halo] spawn ace_interact_menu_fnc_addActionToObject;

// Recall
private _recall = ["SR_Test", "Recall Group", "", {
params ["_target", "_player", "_params"];
	{
		[_x,((position _target) findEmptyPosition [1,5])] remoteExec ["setPos",_x];
	}forEach units group _player;
}, _leader, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_para, 0, ["ACE_MainActions"], _recall] spawn ace_interact_menu_fnc_addActionToObject;

// Wounded and Civilians
// Spawn Civilian
private _civilian = ["SR_Test", "Spawn Civilian", "", {
	params ["_target", "_player", "_params"];
	[bc_spawn] remoteExec  ["fw_fnc_spawnHVT",0];
	_target setVariable ["SR_Test",true,true];
}, _inactive, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_interact, 0, ["ACE_MainActions"], _civilian] spawn ace_interact_menu_fnc_addActionToObject;

// Spawn Wounded
private _wounded = ["SR_Test", "Spawn Wounded", "", {
	params ["_target", "_player", "_params"];
	[bc_spawn,selectRandom [1,2,3],selectRandom [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2]] remoteExec  ["fw_fnc_spawnWounded",0];
	_target setVariable ["SR_Test",true,true];
}, _inactive, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_interact, 0, ["ACE_MainActions"], _wounded] spawn ace_interact_menu_fnc_addActionToObject;

// Clear Area
private _clear = ["SR_Test", "Clear Area", "", {
	params ["_target", "_player", "_params"];
	_target setVariable ["SR_Test",false,true];
	{deleteVehicle _x} forEach (_target nearObjects ["C_man_w_worker_F",50]);
}, _active, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_interact, 0, ["ACE_MainActions"], _clear] spawn ace_interact_menu_fnc_addActionToObject;

// Become Medic
private _medic = ["SR_Test", "Become Medic", "", {
	params ["_target", "_player", "_params"];
	_player setVariable ["ace_medical_medicClass",1,true];
	_player addBackpack "rhsusf_assault_eagleaiii_coy";
	for "_i" from 1 to 2 do {_player addItemToBackpack "SR_Bandage_Pack";};
	for "_i" from 1 to 2 do {_player addItemToBackpack "SR_Medicine_Pack";};
	for "_i" from 1 to 1 do {_player addItemToBackpack "SR_BloodIV_Pack";};
	for "_i" from 1 to 1 do {_player addItemToBackpack "SR_Utility_Pack";};
	for "_i" from 1 to 1 do {_player addItemToBackpack "ACE_surgicalKit";};
}, {true}, {},[]] call ace_interact_menu_fnc_createAction;
[bootcamp_interact, 0, ["ACE_MainActions"], _medic] spawn ace_interact_menu_fnc_addActionToObject;

[ "Bootcamp", format ["Year %1", date select 0], mapGridPosition player] spawn BIS_fnc_infoText;