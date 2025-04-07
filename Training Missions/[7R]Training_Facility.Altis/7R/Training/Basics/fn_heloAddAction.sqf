/*
	Parameters:
		<-- Terminal as Object
		<-- Helipad as Object
	
	Description:		
		Add Helicopter Spawn Action to Terminal

	Example:
		[_terminal, pad1] spawn fw_fnc_heloAddAction;
*/

params ["_terminal","_pad"];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn UH60", fw_fnc_heloSpawn,["RHS_UH60M",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn UH1Y", fw_fnc_heloSpawn,["RHS_UH1Y",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn CH47", fw_fnc_heloSpawn,["RHS_CH_47F",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn MELB MH6", fw_fnc_heloSpawn,["RHS_MELB_MH6M",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn AH6 L", fw_fnc_heloSpawn,["RHS_MELB_AH6M_L",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn AH6 M", fw_fnc_heloSpawn,["RHS_MELB_AH6M_M",_pad]];       
_terminal addaction ["<t color=""#00FF00"">" +"Spawn AH6 H", fw_fnc_heloSpawn,["RHS_MELB_AH6M_H",_pad]];       
_terminal addaction ["<t color=""#00FF00"">" +"Spawn UH-1 H", fw_fnc_heloSpawn,["rhs_uh1h_hidf",_pad]];       
_terminal addaction ["<t color=""#00FF00"">" +"Spawn UH-1 H Gunship", fw_fnc_heloSpawn,["rhs_uh1h_hidf_gunship",_pad]];       
_terminal addaction ["<t color=""#00FF00"">" +"Spawn Merlin 18 GMPG", fw_fnc_heloSpawn,["UK3CB_BAF_Merlin_HC4_18_GPMG_MTP",_pad]];     
_terminal addaction ["<t color=""#00FF00"">" +"Spawn Merlin 32", fw_fnc_heloSpawn,["UK3CB_BAF_Merlin_HC4_32_MTP",_pad]];    
_terminal addaction ["<t color=""#00FF00"">" +"Spawn Wildcat Armed", fw_fnc_heloSpawn,["UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",_pad]];    
_terminal addaction ["<t color=""#00FF00"">" +"Spawn Wildcat Armed Guided", fw_fnc_heloSpawn,["UK3CB_BAF_Wildcat_AH1_CAS_8B",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn CH-146 Griffin", fw_fnc_heloSpawn,["7r_can_ch146_utility",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn CH-146 Griffin Armed", fw_fnc_heloSpawn,["7r_can_ch146_armed_dynamic",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn Mi-8", fw_fnc_heloSpawn,["7r_cdf_mi17",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn AH64D", fw_fnc_heloSpawn,["RHS_AH64D_wd",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Spawn MI-24G", fw_fnc_heloSpawn,["7r_cdf_mi24g",_pad]];
_terminal addaction ["<t color=""#00FF00"">" +"Clear Spawn Pad", fw_fnc_heloSpawn,["",_pad]];  