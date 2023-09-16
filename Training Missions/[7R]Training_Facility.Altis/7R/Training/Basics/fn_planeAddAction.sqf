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

_terminal addaction ["Spawn F/A-18C Multi-Role", fw_fnc_heloSpawn, ["FIR_F18C_Wildcat_USN", _pad, 0, [
	[1, "FIR_AIM9X_P_1rnd_M"],
	[2, "FIR_AGM65F_P_1rnd_M"],
	[3, "FIR_AGM154C_P_1rnd_M"],
	[4, "FIR_AIM120_P_1rnd_M"],
	[5, "FIR_Litening_std_P_1rnd_M"],
	[6, "FIR_AIM120_P_1rnd_M"],
	[7, "FIR_AGM154C_P_1rnd_M"],
	[8, "FIR_AGM65F_P_1rnd_M"],
	[9, "FIR_AIM9X_P_1rnd_M"]
]]];

_terminal addaction ["Spawn A-10C Close-Air-Suppport", fw_fnc_heloSpawn, ["FIR_A10C_FT", _pad, 0, [
	[1, "FIR_ALQ184_2_P_1rnd_M"],
	[2, "FIR_Hydra_M261_P_19rnd_M"],
	[3, "FIR_AGM65G_P_1rnd_M"],
	[4, "FIR_GBU56_P_1rnd_M"],
	[5, "FIR_EGBU12_P_1rnd_M"],
	[6, "FIR_EGBU12_P_1rnd_M"],
	[7, "FIR_GBU56_P_1rnd_M"],
	[8, "FIR_AGM65G_P_1rnd_M"],
	[9, "FIR_Litening_Nomodel_P_1rnd_M"],
	[10, "FIR_AIM9M_P_2rnd_M"]
]]];

_terminal addaction ["Spawn SU-25SM3 Close-Air-Support", fw_fnc_heloSpawn, ["FIR_Su25SM3_Camo", _pad, 0, [
	[1, "FIR_R60M_P_1rnd_M"],
	[2, "FIR_Kh25MTP_P_1rnd_M"],
	[3, "FIR_S8KOM_P_20rnd_M"],
	[4, "FIR_S8KOM_P_20rnd_M"],
	[5, "FIR_S8KOM_P_20rnd_M"],
	[6, "FIR_S8KOM_P_20rnd_M"],
	[7, "FIR_Kh25MTP_P_1rnd_M"],
	[8, "FIR_R60M_P_1rnd_M"]
]]];
