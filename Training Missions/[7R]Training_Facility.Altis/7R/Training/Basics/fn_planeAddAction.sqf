/*
	Parameters:
		<-- Terminal as Object
		<-- Planepad as Object

	Description:
		Adds Plane spawn Action to Terminal

	Example:
		[this, pad1] spawn fw_fnc_planeAddAction;
*/

_terminal = _this select 0;
_pad = _this select 1;


// _terminal addaction ["Spawn A-10 (Vanilla)", fw_fnc_heloSpawn,["B_Plane_CAS_01_dynamicLoadout_F",_pad]];
// _terminal addaction ["Spawn A-10 (RHS)", fw_fnc_heloSpawn,["RHS_A10",_pad]];
// _terminal addaction ["Spawn FA-181", fw_fnc_heloSpawn,["B_Plane_Fighter_01_F",_pad]];
// _terminal addaction ["Spawn C-130J", fw_fnc_heloSpawn,["RHS_C130J",_pad]];
// _terminal addaction ["Spawn L-159", fw_fnc_heloSpawn,["I_Plane_Fighter_03_dynamicLoadout_F",_pad]];
// _terminal addaction ["Spawn A-149", fw_fnc_heloSpawn,["I_Plane_Fighter_04_F",_pad]];
// _terminal addaction ["Spawn Blackfish VTOL", fw_fnc_heloSpawn,["B_T_VTOL_01_infantry_F",_pad]];
// _terminal addaction ["Spawn F/A-18E Default", fw_fnc_heloSpawn,["JS_JC_FA18E",_pad]];

_terminal addaction ["Spawn F/A-18C Multi-Role", fw_fnc_heloSpawn, ["B_Plane_CAS_01_dynamicLoadout_F", _pad, 0]];
_terminal addaction ["Spawn F/A-18C Multi-Role", fw_fnc_heloSpawn, ["B_Plane_Fighter_01_F", _pad, 0]];

